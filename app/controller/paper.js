'use strict';
const _ = require('lodash');
const assert = require('assert');
const Controller = require('egg').Controller;

class PaperController extends Controller {
  async index() {
    const { ctx, service } = this;
    const papers = await service.paper.get();
    ctx.body = {
      success: true,
      content: {
        papers,
      },
    };
  }

  async show() {
    const { ctx, service } = this;
    const { id } = ctx.params;
    const paper = await service.paper.getOne( { id });
    ctx.body = {
      success: true,
      content: {
        paper,
      },
    };
  }

  async create() {
    const { ctx, service } = this;
    const row = _.pick(ctx.request.body, [
      'name',
      'exam_id',
      'user',
      'total_score',
      'objective_score',
      'subjective_score',
    ]);
    assert(row.name, 'controller.paper.create: name not null');
    assert(row.exam_id, 'controller.paper.create: exam_id not null');
    assert(row.user, 'controller.paper.crete: user not null');
    assert(row.total_score, 'controller.paper.create: total_score not null');
    assert(row.objective_score, 'controller.paper.create: subjective_score not null');
    assert(row.subjective_score, 'controller.paper.crete: objective_score not null');

    const paper = await service.paper.add(row);
    ctx.body = {
      success: true,
      content: {
        paper,
      },
    };
  }

  async update() {
    const { ctx, service } = this;
    const row = _.pick(ctx.request.body, [
      'id',
      'name',
      'user',
      'exam_id',
      'total_score',
      'subjective_score',
      'objective_score',
    ]);
    const paper = await service.paper.update(row);
    ctx.body = {
      success: true,
      content: {
        paper,
      },
    };
  }

  async delete() {
    const { ctx, service } = this;
    const { id } = ctx.params;
    assert(id, 'controller.paper.delete: id not null');
    await service.paper.delete({ id });
    ctx.body = {
      success: true,
      content: {}
    };
  }
}

module.exports = PaperController;
