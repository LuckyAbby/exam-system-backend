'use strict';

const TABLE = 'exam';

module.exports = app => {
  class User extends app.Service {
    constructor(ctx) {
      super(ctx);
      this.table = TABLE;
    }
  }

  return User;
};
