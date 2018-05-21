'use strict';
const _ = require('lodash');
const { app, assert } = require('egg-mock/bootstrap');

describe('test/app/controller/examinee.test.js', () => {
  it.skip('should GET /api/examinee', async () => {
    const res = await app.httpRequest()
      .get('/api/examinee?exam_id=1')
      .expect(200);

    assert(_.isArray(res.body.content.examinees), 'get /api/examinee fail!');
  });

  it('should post /api/examinee', async () => {
    app.mockCsrf();
    const data = {
      account: 11118,
      exam_id: 1,
    };
    const res = await app.httpRequest()
      .post('/api/examinee')
      .type('json')
      .send(data)
      .expect(200);
    assert(res.body.content.examinee.exam_id === data.exam_id, 'post /api/examinee fail');
    assert(res.body.content.examinee.id, 'post /api/examinee fail');
  });

  it.skip('should GET /api/examinee/:id', async () => {
    app.mockCsrf();
    const data = {
      account: '11112',
      password: '111',
      name: '张三2',
      sex: 1,
      tel: 2222,
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
    const { id } = user;
    const resGet = await app.httpRequest()
      .get(`/api/examinee/${id}`)
      .expect(200);
    const { examinee } = resGet.body.content;
    assert(examinee.name === data.name, 'get /api/examinee/:id fail'); 
  });

  it.skip('shuld PUT /api/examinee', async () => {
    app.mockCsrf();
    const data = {
      account: '11113',
      password: '111',
      name: '张三3',
      sex: 1,
      tel: 3333,
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
    const { id } = user;
    const updateData = {
      id,
      account: '11118',
      sex: 2,
      email: '888@qq.com',
    };
    await app.httpRequest()
      .put('/api/examinee')
      .type('json')
      .send(updateData)
      .expect(200);
    const resGet = await app.httpRequest()
      .get(`/api/examinee/${id}`)
      .expect(200);
    assert(resGet.body.content.examinee.account === updateData.account, 'put /api/examinee fail');
  });

  it.skip('should DELETE /api/examinee/:id', async () => {
    app.mockCsrf();
    const data = {
      user_id: 2,
      exam_id: 1,
    };
    const res = await app.httpRequest()
      .post('/api/examinee')
      .type('json')
      .send(data)
      .expect(200);
    assert(res.body.content.examinee.id, 'POST /api/examinee fail!');
    assert(res.body.content.examinee.exam_id === data.exam_id, 'POST /api/examinee fail!');
    const { id } = res.body.content.examinee;
    await app.httpRequest()
      .delete(`/api/examinee/${id}`)
      .expect(200);
  });

});
