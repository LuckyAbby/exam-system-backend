'use strict';

const TABLE = 'user_paper';

module.exports = app => {
  class UserPaperService extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }
  }

  return UserPaperService;
};
