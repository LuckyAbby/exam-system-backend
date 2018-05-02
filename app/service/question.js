'use strict';

const TABLE = 'question';

module.exports = app => {
  class Question extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }
  }
  return Question;
};
