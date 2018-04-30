'use strict';

const Controller = require('egg').Controller;

class UserController extends Controller {
  async index() {
    const { ctx, service } = this;
    const res = await service.user.add({
      name: `user_${Math.random().toString().substr(2)}`,
      password: 'xxx',
      type: 1,
    });
    console.log('res: ', res, '\n');
    // const res00 = await service.user.addRows([
    //   {
    //     name: `user_${Math.random().toString().substr(2)}`,
    //     password: '1111',
    //     type: 1,
    //   },
    //   {
    //     name: `user_${Math.random().toString().substr(2)}`,
    //     password: '1211',
    //     type: 1,
    //   },
    // ]);
    // console.log('res00: ', res00, '\n');
    // const res1 = await service.user.get();
    // console.log('res1: ', res1, '\n');
    // const res2 = await service.user.query('select * from user where id = ? ', [ 1 ]);
    // console.log('res2: ', res2, '\n');
    // const res3 = await service.user.getOne();
    // console.log('res3: ', res3, '\n');

    // const res4 = await service.user.update({ id: 45, name: 'update_45' });
    // console.log('res4: ', res4, '\n');

    // const res5 = await service.user.update({ password: 'update_46' }, { name: 'user_39164252142308964' });
    // console.log('res5: ', res5, '\n');

    // const res6 = await service.user.updateRows([
    //   { id: 45, password: 'updateRows_111' },
    //   { id: 46, password: 'updateRows_111' },
    //   { id: 47, password: 'updateRows_111' },
    // ]);
    // console.log('res6: ', res6, '\n');

    // const res7 = await service.user.delete({ id: 45 });
    // console.log('res7: ', res7, '\n');

    // const res8 = await service.user.count({ password: 'updateRows_111' });
    // console.log('res8: ', res8, '\n');

    ctx.body = {
      success: true,
      // content: res,
    };
  }
}

module.exports = UserController;