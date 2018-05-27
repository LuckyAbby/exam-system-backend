'use strict';
const _ = require('lodash');
const assert = require('assert');
const Controller = require('egg').Controller;

class ExamineeController extends Controller {
  async index() {
    const { ctx, service } = this;
    const { exam_id } = ctx.query;
    const examinees = await service.userExam.query(
      'select ue.id, user_id, name, sex, tel, email, account, exam_id from user_exam ue, user where user.id = ue.user_id and exam_id = ?'
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
    const { account, exam_id } = ctx.request.body;
    assert(account, 'account can not be null');
    assert(exam_id, 'exam_id can not be null');
    await service.userExam.create({ account, exam_id });
    ctx.body = {
      success: true,
    };
    // const user = await service.user.getOne({ account });
    // console.log('user', user);
    // const user_id = user.id;
    // const row = {
    //   user_id,
    //   exam_id,
    // };
    // const examinee = await service.examinee.add(row);
    // ctx.body = {
    //   success: true,
    //   content: {
    //     examinee,
    //   },
    // };
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
    await service.userExam.delete({ id });
    ctx.body = {
      success: true,
      content: {},
    };
  }
}

module.exports = ExamineeController;
