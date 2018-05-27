'use strict';
// const _ = require('lodash');
const assert = require('assert');
const TABLE = 'user_exam';

module.exports = app => {
  class Examinee extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }

    async create({ account, exam_id }) {
      assert(account, 'account can not be null');
      assert(exam_id, 'exam_id can not be null');
      const { ctx, service } = this;
      const user = await service.user.getOne({ account });
      assert(user, 'user not exist');
      const user_id = user.id;
      const exist_user = await service.userExam.getOne({ user_id, exam_id });
      assert(exist_user === null, 'user already exist');
      const paper = await service.paper.getOne({ exam_id });
      assert(paper, 'paper not exist');
      const paper_id = paper.id;

      await app.mysql.beginTransactionScope(async conn => {
        await service.userExam.add({ user_id, exam_id }, conn);
        await service.userPaper.add({ user_id, exam_id, paper_id });
      }, ctx);
    }
  }

  return Examinee;
};
