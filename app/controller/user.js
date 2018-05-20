'use strict';

const Controller = require('egg').Controller;
const assert = require('assert');

class UserController extends Controller {
  async login() {
    const { ctx, service } = this;
    const { account, password } = ctx.query;
    assert(account, 'account not null');
    assert(password, 'password not null');
    const user = await service.question.getOne({ account, password });
    assert(user, '用户名或密码错误');
    assert(user.id, '用户名或密码错误');
    ctx.session.userId = user.id;
    ctx.body = {
      success: true,
      content: {
        user,
      },
    };
  }

  async logout() {
    const { ctx } = this;
    ctx.session.userId = null;
    ctx.body = {
      success: true,
      content: {},
    };
  }
}

module.exports = UserController;
