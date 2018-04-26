'use strict';

// const Service =  require('egg').Service;
module.exports = app => {
  class HomeService extends app.Service {
    async index(row) {
      // const user =  this.ctx.db.query('select * from user where uid = ? and psd = ？', row.userName， row.password);

      // if (user) {
      //   return true;
      // }
      console.log('aaa');
      return 1;
    }
  }

  return HomeService;
};

