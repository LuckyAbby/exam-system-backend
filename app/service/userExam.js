'use strict';

const TABLE = 'user_exam';

module.exports = app => {
  class UserExamService extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }
  }

  return UserExamService;
};
