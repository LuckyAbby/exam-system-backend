"use strict";

const Service =  require('egg').Service;

class HomeService extends Service {
  async index(row) {
    const user =  this.ctx.db.query('select * from user where uid = ? and psd = ？', row.userName， row.password);
    if (user) {
      return true;
    }
  }
}
