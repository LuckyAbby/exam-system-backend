'use strict';
const _ = require('lodash');
const assert = require('assert');
const shortid = require('shortid');
const Controller = require('egg').Controller;

class ExamController extends Controller {
  async index() {
    const { ctx, service } = this;
    // 暂时不做分页。直接查询所有的考试
    const exams = await service.exam.get();
    // const exams = {};
    ctx.body = {
      success: true,
      content: {
        exams,
      },
    };
  }

  async show() {
    const { ctx, service } = this;
    const { id } = ctx.params;
    const exam = await service.exam.getOne({ id });
    ctx.body = {
      success: true,
      content: {
        exam,
      },
    };
  }


  async create() {
    const { ctx, service } = this;
    const row = _.pick(ctx.request.body, [
      'name',
      'time',
      'start_time',
      'end_time',
      'state',
    ]);
    // 参数判断。暂时先这样。后面我有时间了再写一个抛错中间件
    assert(row.name, 'controller.exam.create: name not null');
    assert(row.time, 'controller.exam.create: time not null');
    assert(row.start_time, 'controller.exam.create: start_time not null');
    assert(row.end_time, 'controller.exam.create: end_time not null');
    // 因为state里面有 0 所以不能再直接 assert 判断，精确判断是否是 [0, 1, 2] 里面的
    assert([ 0, 1, 2 ].includes(row.state), 'controller.exam.create: state not null');
    row.start_time = new Date(row.start_time);
    row.end_time = new Date(row.end_time);
    row.display_id = shortid.generate();
    const exam = await service.exam.add(row);
    ctx.body = {
      success: true,
      content: {
        exam,
      },
    };
  }

  async update() {
    const { ctx, service } = this;
    const row = _.pick(ctx.request.body, [
      'id', // 这些就是需要更新的数据。如果传入了 id，update 方法或自动以 id 为条件进行更新
      'name',
      'time',
      'start_time',
      'end_time',
      'state',
    ]);
    const exam = await service.exam.update(row);
    ctx.body = {
      success: true,
      content: {
        exam,
      },
    };
  }

  async delete() {
    const { ctx, service } = this;
    const { id } = ctx.params;
    assert(id, 'controller.exam.delete: id not null');
    await service.exam.delete({ id });
    ctx.body = {
      success: true,
      content: {},
    };
  }
}

module.exports = ExamController;
