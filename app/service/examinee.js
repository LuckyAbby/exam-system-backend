'use strict';

const TABLE = 'user_exam';

module.exports = app => {
  class Examinee extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }
  }

  return Examinee;
};
