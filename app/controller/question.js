'use strict';
const _ = require('lodash');
const assert = require('assert');
const Controller = require('egg').Controller;

class QuestionController extends Controller {
  async index() {
    const { ctx, service } = this;
    const questions = await service.question.get();
    ctx.body = {
      success: true,
      content: {
        questions,
      },
    };
  }

  async show() {
    const { ctx, service } = this;
    const { id } = ctx.params;
    const question = await service.question.getOne({ id });
    if (question) {
      const options = await service.questionOption.get({ question_id: id });
      question.options = options;
    }
    ctx.body = {
      success: true,
      content: {
        question,
      },
    };
  }

  async create() {
    const { ctx, service } = this;
    const row = _.pick(ctx.request.body, [
      'title',
      'type',
      'score',
      'exam_id',
    ]);
    assert(row.title, 'controller.question.create: title not null');
    assert(row.type, 'controller.question.create: type not null');
    assert(row.score, 'controller.question.create: score not null');
    assert(row.exam_id, 'controller.question.create: exam_id not null');
    const question = await service.question.add(row);
    if (row.type === 1) { // 客观题需要创建选项
      const { id } = question;
      const { options } = ctx.request.body;
      assert(options, 'controller.question.create:options not null');
      const optionsObj = options.map(item => {
        item.question_id = id;
        return item;
      });
      await service.questionOption.addRows(optionsObj);
    }
    ctx.body = {
      success: true,
      content: {
        question,
      },
    };
  }

  async update() {
    const { ctx, service } = this;
    const row = _.pick(ctx.request.body, [
      'id',
      'title',
      'type',
      'score',
      'exam_id',
    ]);
    const question = await service.question.update(row);
    await service.questionOption.delete({ question_id: row.id });
    if (row.type === 1) {
      const { options } = ctx.request.body;
      const optionsObj = options.map(item => {
        item.question_id = row.id;
        return item;
      });
      await service.questionOption.addRows({ optionsObj });
    }
    ctx.body = {
      success: true,
      content: {
        question,
      },
    };
  }

  async delete() {
    const { ctx, service } = this;
    const { id } = ctx.params;
    assert(id, 'controller.question.delete:id not null');
    await service.question.delete({ id });
    await service.questionOption.delete({ question_id: id });
    ctx.body = {
      success: true,
      content: {},
    };
  }
}

module.exports = QuestionController;
