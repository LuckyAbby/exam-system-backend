'use strict';
const _ = require('lodash');
const assert = require('assert');
const Controller = require('egg').Controller;

class ExamineeController extends Controller {
  async index() {
    const { ctx, service } = this;
    const { exam_id } = ctx.query;
    const examinees = await service.examinee.query(
      'select ue.id, user_id, name, sex, tel, email, exam_id from user_exam ue, user where user.id = ue.user_id and exam_id = ?'
      , [ exam_id ]);
    // console.log('examinees', examinees);
    ctx.body = {
      success: true,
      content: {
        examinees,
      },
    };
  }

  async show() {
    const { ctx, service } = this;
    const { id } = ctx.params;
    const examinee = await service.user.getOne({ id });
    ctx.body = {
      success: true,
      content: {
        examinee,
      },
    };
  }

  async create() {
    const { ctx, service } = this;
    const row = _.pick(ctx.request.body, [
      'user_id',
      'exam_id',
    ]);
    const examinee = await service.examinee.add(row);
    ctx.body = {
      success: true,
      content: {
        examinee,
      },
    };
  }

  async update() {
    const { ctx, service } = this;
    const row = _.pick(ctx.request.body, [
      'id',
      'name',
      'sex',
      'tel',
      'email',
      'account',
    ]);
    const examinee = await service.user.update(row);
    ctx.body = {
      success: true,
      content: {
        examinee,
      },
    };
  }

  async delete() {
    const { ctx, service } = this;
    const { id } = ctx.params;
    // const { exam_id } = ctx.query;
    assert(id, 'controller.examinee.delete fail!');
    // console.log('id, exam_id', id, exam_id);
    await service.examinee.delete({ id });
    ctx.body = {
      success: true,
      content: {},
    };
  }
}

module.exports = ExamineeController;
