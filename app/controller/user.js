'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx, service } = this;
    const res = await service.user.add({
      name: `user_${Math.random().toString().substr(2)}`,
      password: 'xxx',
      type: 1,
    });
    console.log('res: ', res, '\n');
    ctx.body = {
      success: true,
      // content: res,
    };
  }
}

module.exports = HomeController;
