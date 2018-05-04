'use strict';

const TABLE = 'paper_question';

module.exports = app => {
  class PaperQuestion extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }
  }
  return PaperQuestion;
}
