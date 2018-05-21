'use strict';

const Controller = require('egg').Controller;
const assert = require('assert');
const _ = require('lodash');

class UserController extends Controller {
  async index() {
    const { ctx } = this;
    const user = ctx.session.user;
    assert(user, '未登录');
    const filter = [ 'id', 'name', 'type', 'create_time', 'update_time', 'sex', 'tel', 'email', 'account' ];
    ctx.body = {
      success: true,
      content: {
        user: _.pick(user, filter),
      },
    };
  }

  async login() {
    const { ctx, service } = this;
    const { account, password } = ctx.request.body;
    assert(account, 'account not null');
    assert(password, 'password not null');
    const user = await service.user.getOne({ account, password });
    assert(user, '用户名或密码错误');
    assert(user.id, '用户名或密码错误');
    ctx.session.user = user;
    ctx.body = {
      success: true,
      content: {
        user,
      },
    };
  }

  async register() {
    const { ctx, service } = this;
    const data = _.pick(ctx.request.body, [
      'name',
      'account',
      'email',
      'tel',
      'password',
    ]);
    data.sex = 1;
    data.type = 1;
    assert(data.name, 'name not null');
    assert(data.account, 'account not null');
    assert(data.email, 'email not null');
    assert(data.tel, 'tel not null');
    assert(data.password, 'password not null');
    const user = await service.user.add(data);
    ctx.session.user = user;
    const filter = [ 'id', 'name', 'type', 'create_time', 'update_time', 'sex', 'tel', 'email', 'account' ];
    ctx.body = {
      success: true,
      content: {
        user: _.pick(user, filter),
      },
    };
  }

  async logout() {
    const { ctx } = this;
    ctx.session.user = null;
    ctx.body = {
      success: true,
      content: {},
    };
  }
}

module.exports = UserController;
