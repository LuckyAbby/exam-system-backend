'use strict';
const _ = require('lodash');
const Controller = require('egg').Controller;

class StudentController extends Controller {
  async index() {
    const { ctx, service } = this;
    const students = await service.student.get();
    ctx.body = {
      success: true,
      content: {
        students,
      }
    }
  }
}
