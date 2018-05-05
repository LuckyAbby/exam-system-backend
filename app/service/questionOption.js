'use strict';

const TABLE = 'question_option';

module.exports = app => {
  class QuestionOption extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }
  }
  return QuestionOption;
};
