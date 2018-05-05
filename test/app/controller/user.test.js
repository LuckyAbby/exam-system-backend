'use strict';

const _ = require('lodash');
const { app, assert } = require('egg-mock/bootstrap');

describe('test/app/controller/user.test.js', () => {
  it('should POST /login', async () => {
    app.mockCsrf();
    const data = {
      account: '111116',
      password: '111',
      name: '张三1',
      sex: 1,
      tel: 12312,
      email: '121@qq.com',
      type: 1,
    };
    const res = await app.httpRequest()
      .post('/register')
      .type('json')
      .send(data)
      .expect(200);
    const { user } = res.body.content;
    // console.log
    assert(user.id, 'post /register fail');
    assert(user.account === data.account, 'post /register fail');
    assert(user.name === data.name, 'post /register fail');
    const loginData = {
      account: '111116',
      password: '111',
    };
    const resGet = await app.httpRequest()
      .post('/login')
      .type('json')
      .send(loginData)
      .expect(200);
    assert(resGet.body.content.user.account === loginData.account, 'post /login fail');
  });
  it('should POST /register', async () => {
    app.mockCsrf();
    const data = {
      account: '111111',
      password: '111',
      name: '张三',
      sex: 1,
      tel: 12312,
      email: '121@qq.com',
      type: 1,
    };
    const res = await app.httpRequest()
      .post('/register')
      .type('json')
      .send(data)
      .expect(200);
    const { user } = res.body.content;
    assert(user.id, 'post /register fail');
    assert(user.account === data.account, 'post /register fail');
    assert(user.name === data.name, 'post /register fail');
  });

});
