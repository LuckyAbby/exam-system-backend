'use strict';
const _ = require('lodash');
const { app, assert } = require('egg-mock/bootstrap');

describe('test/app/controller/examinee.test.js', () => {
  it('should GET /api/examinee', async () => {
    const res = await app.httpRequest()
      .get('/api/examinee?exam_id=1')
      .expect(200);

    assert(_.isArray(res.body.content.examinees), 'get /api/examinee fail!');
  });

  it('should post /api/examinee', async () => {
    app.mockCsrf();
    const data = {
      user_id: 50,
      exam_id: 1,
    };
    const res = await app.httpRequest()
      .post('/api/examinee')
      .type('json')
      .send(data)
      .expect(200);
    assert(res.body.content.examinee.user_id === data.user_id, 'post /api/examinee fail');
    assert(res.body.content.examinee.id, 'post /api/examinee fail');
  });

  it.skip('should GET /api/examinee/:id', async () => {

  });

  it.skip('shuld PUT /api/examinee', async () => {

  });

  it('should DELETE /api/examinee/:id', async () => {
    app.mockCsrf();
    const data = {
      user_id: 48,
      exam_id: 17,
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

    // const resGet = await app.httpRequest()
    //   .get(`/api/examinee/${id}`);
    // assert(resGet.body.content.examinee === null, 'DELETE /api/examinee/:id fail!');
  });

});
