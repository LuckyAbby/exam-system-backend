'use strict';

const egg = require('egg');
const _ = require('lodash');
const util = require('util');

class DbService extends egg.Service {

  /**
   * 获取数据库连接
   * @param {object} conn 数据库连接
   * @return {object} 数据库连接
   */
  db(conn) {
    return conn || this.app.mysql;
  }

  /**
   * 执行一条 SQL 语句
   * @param {string} sql sql 语句
   * @param {array} values SQL 条件
   * @param {object} conn db connection
   * @return {object} result
   */
  async query(sql, values, conn) {
    const db = this.db(conn);
    return await db.query(sql, values);
  }


  /**
   * 查询多条记录
   * 支持两种方式
   * 一是直接写条件如 { id, status }
   * 二是自定义条件
   * {
   *  where: {
   *   type: 'javascript'
   *  },
   *  columns: ['author', 'title'],
   *  orders: [['id', 'desc']]
   * }
   * @param {object} options 查询条件
   * @param {*} conn db connection
   * @return {object} result
   */
  async get(options = {}, conn) {
    const db = this.db(conn);
    options.where = options.where || Object.assign({}, options);
    return await db.select(this.table, options || null);
  }

  /**
   * 查询一条记录
   * 在 ali-rds 中，有 table/where/options 三个参数
   * 本质上是将 where 条件从 db.select 的 options 中分离出来了，同时限定 limit=1 offset=0
   * @param {object} where 查询条件，SQL 的 where 部分
   * @param {object} options 其他条件 {columns: ['author', 'title'], orders: [['id', 'desc']]}
   * @param {object} conn db connection
   * @return {object} result
   */
  async getOne(where, options, conn) {
    const connection = options && options.constructor === Object ? conn : options;
    const db = this.db(connection);
    return await db.get(this.table, where, options);
  }

  /**
   * 添加一条数据
   * @param {object} row 需要插入的数据
   * @param {object} conn db connection
   * @return {object} 添加的数据
   */
  async add(row, conn) {
    const db = this.db(conn);
    row = Object.assign({}, row);
    row.create_time = row.update_time = new Date();
    const id = (await db.insert(this.table, row)).insertId;
    return await this.getOne({ id }, conn);
  }


  /**
   * 批量添加数据
   * @param {array} rows rows
   * @param {object} conn db connection
   * @return {object} res
   */
  async addRows(rows, conn) {
    const db = this.db(conn);
    const NOW = new Date();
    const data = rows.map(row => {
      row.create_time = row.update_time = NOW;
      return row;
    });

    if (rows.length) {
      return await db.insert(this.table, data);
    }
  }

  /**
   * 更新数据
   * 详见 https://eggjs.org/zh-cn/tutorials/mysql.html#update
   * @param  {object}    row 为需要更新的数据 如 { id, name, password }，根据 id 更新 name 和 password
   * @param  {object}    where 如果主键是自定义的 ID 名称或需要更新其他字段，如 custom_id，则需要在 where 里面配置
   * @param  {object}    conn connection
   * @return {Generator}      res
   */
  async update(row, where, conn) {
    const db = this.db(conn);
    const newRow = Object.assign({}, row);
    newRow.update_time = new Date();
    const options = where ? { where: Object.assign({}, where) } : null;
    return await db.update(this.table, newRow, options);
  }

  /**
   * options [Object]
   *
   * {
   *  rows: [
   *    {
   *      id,
   *      name,
   *      desc
   *    }
   *    ...
   *  ]
   * }
   *
   * UPDATE ?? SET ?? = CASE id
   *  WHEN ? THEN ?
   *  WHEN ? THEN ?
   *  WHEN ? THEN ?
   * END,
   *  ?? = CASE id
   *  WHEN ? THEN ?
   *  WHEN ? THEN ?
   *  WHEN ? THEN ?
   * END WHERE id IN (...)
   * @param {array} rows rows
   * @param {object} conn db connection
   * @return {object} result
   */
  async updateRows(rows, conn) {
    const db = this.db(conn);
    let newRows = Object.assign([], rows);
    const NOW = new Date();

    const WHERE = {
      ids: [],
    };

    newRows = newRows.map(row => {
      // update必须传入id
      if (!row.id) {
        throw new this.app.Error('D_NoParam_Id', 'dbService.updateRows() no param row.id');
      }
      row.update_time = NOW;

      WHERE.ids.push(row.id);
      return row;
    });


    const TEMPLATE = {
      all: `UPDATE ?? SET %s WHERE id IN (${WHERE.ids.join(',')});`,
      set: '?? = CASE id %s END',
      // id可能是bigNumber的字符串，需要单独处理
      when: 'WHEN %s THEN ?',
    };

    const VALUES = [ this.table ];
    /*
     * {
     *  col1: [
     *    {id, value},
     *    {id, value},
     *  ],
     *  col2: [
     *    {id, value},
     *    {id, value},
     *  ]
     * }
     */
    const COLUMNS = {};

    newRows.forEach(row => {
      _.each(row, (value, key) => {
        if (key === 'id') return;

        if (!COLUMNS[key]) {
          COLUMNS[key] = [{
            id: row.id,
            value,
          }];
        } else {
          COLUMNS[key].push({
            id: row.id,
            value,
          });
        }
      });
    });

    const sets = [];
    _.each(COLUMNS, (newRows, column) => {
      const whens = [];
      VALUES.push(column);
      _.each(newRows, item => {
        // 防止注入做判断
        if (!/^\d+$/.test('' + item.id)) {
          throw new this.app.Error('D_InvalidParam_Id', 'dbService.updateRows() invalid id param');
        }

        whens.push(util.format(TEMPLATE.when, item.id));
        VALUES.push(item.value);
      });

      const set = util.format(TEMPLATE.set, whens.join(' '));
      sets.push(set);
    });

    const SQL = util.format(TEMPLATE.all, sets.join(','));
    return await db.query(SQL, VALUES);
  }

  /**
   * 删除数据
   * @param {object} where 删除条件
   * @param {object} conn db connection
   * @return {object} result
   */
  async delete(where, conn) {
    const db = this.db(conn);
    return await db.delete(this.table, where);
  }

  /**
   * 统计查询
   * @param {object} where 条件
   * @param {object} conn db connection
   * @return {object} result
   */
  async count(where, conn) {
    const db = this.db(conn);
    return await db.count(this.table, where);
  }
}

module.exports = DbService;
