'use strict';

const Controller = require('egg').Controller;
const assert = require('assert');
const _ = require('lodash');

class ExamController extends Controller {
  async index() {
    const { ctx, service } = this;
    const { user } = ctx.session;
    assert(user, '未登录');
    const { id: user_id } = user;
    const user_exams = await service.userExam.get({ user_id });
    const exam_ids = _.map(user_exams, 'exam_id');
    const exams = _.isEmpty(exam_ids) ? [] : (await service.exam.get({ id: exam_ids }));
    const user_papers = _.isEmpty(exam_ids) ? [] : (await service.userPaper.get({
      user_id,
      exam_id: exam_ids,
      subjective_grade: null,
      objective_grade: null,
    }));
    const paper_ids = _.map(user_papers, 'paper_id');
    const papers = _.isEmpty(paper_ids) ? [] : (await service.paper.get({ id: paper_ids }));
    const examPaper = {};
    papers.forEach(item => {
      if (examPaper[item.exam_id]) {
        examPaper[item.exam_id].push(item);
      } else {
        examPaper[item.exam_id] = [ item ];
      }
    });
    ctx.body = {
      success: true,
      content: {
        exams,
        examPaper,
      },
    };
  }

  async show() {
    const { ctx, service } = this;
    const { id } = ctx.params;
    const exam = await service.exam.getOne({ id });
    ctx.body = {
      success: true,
      content: {
        exam,
      },
    };
  }
}

module.exports = ExamController;
