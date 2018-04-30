'use strict';

const TABLE = 'user';

module.exports = app => {
  class UserService extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }
  }

  return UserService;
};
