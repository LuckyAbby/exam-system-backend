'use strict';

const TABLE = 'exam';

module.exports = app => {
  class Exam extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }
  }

  return Exam;
};
