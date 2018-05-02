'use strict';

const _ = require('lodash');
const { app, assert } = require('egg-mock/bootstrap');

describe('test/app/controller/exam.test.js', () => {

  it('should GET /api/exam', async () => {
    const res = await app.httpRequest()
      .get('/api/exam')
      .expect(200);

    // 这里期望返回的 exams 是一个数组。因为 /api/exam 获取的是考试列表
    assert(_.isArray(res.body.content.exams), 'get /api/exam fail!');
  });

  it('should POST /api/exam', async () => {
    app.mockCsrf();
    const data = {
      name: '测试考试',
      time: 100,
      state: 2,
      start_time: '2018-04-30 06:55:31',
      end_time: '2018-04-30 07:55:31',

    };
    const res = await app.httpRequest()
      .post('/api/exam')
      .type('json')
      .send(data)
      .expect(200);
    assert(res.body.content.exam.id, 'post /api/exam fail!');
    assert(res.body.content.exam.name === data.name, 'post /api/exam fail!');
    assert(res.body.content.exam.time === data.time, 'post /api/exam fail!');
  });

  it('should GET /api/exam/:id', async () => {
    app.mockCsrf();
    const data = {
      name: '测试考试',
      time: 100,
      start_time: '2018-04-30 06:55:31',
      end_time: '2018-04-30 07:55:31',
      state: 0,
    };
    const res = await app.httpRequest()
      .post('/api/exam')
      .type('json')
      .send(data)
      .expect(200);
    assert(res.body.content.exam.id, 'post /api/exam fail!');
    assert(res.body.content.exam.name === data.name, 'post /api/exam fail!');
    assert(res.body.content.exam.time === data.time, 'post /api/exam fail!');

    const { id } = res.body.content.exam;
    const resGet = await app.httpRequest()
      .get(`/api/exam/${id}`);
    const { exam } = resGet.body.content;
    assert(exam.id === id, 'get /api/exam/:id fail!');
    assert(exam.name === data.name, 'get /api/exam/:id fail!');

  });

  it('should PUT api/exam/:id', async () => {
    app.mockCsrf();
    const data = {
      name: '测试考试',
      time: 100,
      start_time: '2018-04-30 07:33:33',
      end_time: '2018-04-30 08:33:33',
      state: 0,
    };
    const res = await app.httpRequest()
      .post('/api/exam')
      .type('json')
      .send(data)
      .expect(200);
    assert(res.body.content.exam.id, 'post /api/exam fail!');
    assert(res.body.content.exam.name === data.name, 'post /api/exam fail!');
    assert(res.body.content.exam.time === data.time, 'post /api/exam fail!');

    const { id } = res.body.content.exam;
    const updateData = {
      id,
      name: '测试考试更改',
      time: 150,
      state: 1,
    };
    await app.httpRequest()
      .put('/api/exam')
      .type('json')
      .send(updateData)
      .expect(200);
    const resGet = await app.httpRequest()
      .get(`/api/exam/${id}`)
      .expect(200);
    assert(resGet.body.content.exam.name === updateData.name, 'post /api/exam fail!');
    assert(resGet.body.content.exam.time === updateData.time, 'post /api/exam fail!');
    assert(resGet.body.content.exam.state === updateData.state, 'post /api/exam fail!');
  });

  it('should DELETE /api/exam/:id', async () => {
    app.mockCsrf();
    const data = {
      name: '测试考试',
      time: 100,
      start_time: '2018-04-30 06:55:31',
      end_time: '2018-04-30 07:55:31',
      state: 0,
    };
    const res = await app.httpRequest()
      .post('/api/exam')
      .type('json')
      .send(data)
      .expect(200);
    assert(res.body.content.exam.id, 'post /api/exam fail!');
    assert(res.body.content.exam.name === data.name, 'post /api/exam fail!');
    assert(res.body.content.exam.time === data.time, 'post /api/exam fail!');

    const { id } = res.body.content.exam;
    await app.httpRequest()
      .delete(`/api/exam/${id}`)
      .expect(200);

    const resGet = await app.httpRequest()
      .get(`/api/exam/${id}`);
    assert(resGet.body.content.exam === null, 'delete /api/exam/:id fail!');
  });

});
