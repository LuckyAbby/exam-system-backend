'use strict';

const TABLE = 'paper';

module.exports = app => {
  class Paper extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }
  }
  return Paper;
}
