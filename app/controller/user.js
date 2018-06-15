'use strict';

const Controller = require('egg').Controller;
const _ = require('lodash');
const assert = require('assert');

class UserController extends Controller {
  // async index() {
  //   const { ctx, service } = this;
  //   const res = await service.user.add({
  //     name: `user_${Math.random().toString().substr(2)}`,
  //     password: 'xxx',
  //     tel: 888888,
  //     email: '888888@qq.com',
  //     type: 1,
  //   });
  //   console.log('res: ', res, '\n');
  //   // const res00 = await service.user.addRows([
  //   //   {
  //   //     name: `user_${Math.random().toString().substr(2)}`,
  //   //     password: '1111',
  //   //     type: 1,
  //   //   },
  //   //   {
  //   //     name: `user_${Math.random().toString().substr(2)}`,
  //   //     password: '1211',
  //   //     type: 1,
  //   //   },
  //   // ]);
  //   // console.log('res00: ', res00, '\n');
  //   // const res1 = await service.user.get();
  //   // console.log('res1: ', res1, '\n');
  //   // const res2 = await service.user.query('select * from user where id = ? ', [ 1 ]);
  //   // console.log('res2: ', res2, '\n');
  //   // const res3 = await service.user.getOne();
  //   // console.log('res3: ', res3, '\n');

  //   // const res4 = await service.user.update({ id: 45, name: 'update_45' });
  //   // console.log('res4: ', res4, '\n');

  //   // const res5 = await service.user.update({ password: 'update_46' }, { name: 'user_39164252142308964' });
  //   // console.log('res5: ', res5, '\n');

  //   // const res6 = await service.user.updateRows([
  //   //   { id: 45, password: 'updateRows_111' },
  //   //   { id: 46, password: 'updateRows_111' },
  //   //   { id: 47, password: 'updateRows_111' },
  //   // ]);
  //   // console.log('res6: ', res6, '\n');

  //   // const res7 = await service.user.delete({ id: 45 });
  //   // console.log('res7: ', res7, '\n');

  //   // const res8 = await service.user.count({ password: 'updateRows_111' });
  //   // console.log('res8: ', res8, '\n');

  //   ctx.body = {
  //     success: true,
  //     // content: res,
  //   };
  // }

  async index() {
    const { ctx, service } = this;
    const { userName: account, password } = ctx.request.body;
    const user = await service.user.getOne({ account });
    assert(user && user.password === password, '密码错误');
    ctx.body = {
      success: true,
      content: {
        user,
      },
    };
  }

  async create() {
    const { ctx, service } = this;
    const row = _.pick(ctx.request.body, [
      'name',
      'account',
      'tel',
      'email',
      'sex',
      'password',
      'type',
    ]);
    assert(row.account, 'controller.login.index: account not null');
    assert(row.name, 'controller.login.index: name not null');
    assert(row.tel, 'controller.login.index: tel not null');
    assert(row.email, 'controller.login.index: email not null');
    assert(row.password, 'controller.login.index: password not null');
    assert(row.sex, 'controller.login.index: sex not null');
    assert(row.type, 'controller.login.index: type not null');
    // const user = await service.user.add(row);
    const user = await service.user.add(row);
    ctx.body = {
      success: true,
      content: {
        user,
      },
    };
  }

  async show() {
    const { ctx } = this;
    const id = 4; // TODO: get id from session
    const user = await this.service.user.getOne({ id });
    const filter = [ 'id', 'name', 'sex', 'create_time', 'account', 'tel', 'type', 'update_time' ];
    ctx.body = {
      success: true,
      content: {
        user: _.pick(user, filter),
      },
    };
  }
}

module.exports = UserController;
