'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx, service } = this;
    const { userName, password } =  ctx.request.body;
    const res = await service.home.index(ctx.request.body);
    ctx.body = {
      success: true,
      content: res
    };
  }
}

module.exports = HomeController;
