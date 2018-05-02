'use strict';

const _ = require('lodash');
const { app, assert } = require('egg-mock/bootstrap');

describe('test/app/controller/question.test.js', () => {

  it('should GET /api/question', async () => {
    const res = await app.httpRequest()
      .get('/api/question')
      .expect(200);

    assert(_.isArray(res.body.content.questions), 'get /api/questions fail!');
  });

  it('should POST /api/question', async () => {
    app.mockCsrf();
    const data = {
      title: '测试试题',
      type: 1,
      score: 10,
      exam_id: 1,
    };
    const res = await app.httpRequest()
      .post('/api/question')
      .type('json')
      .send(data)
      .expect(200);
    const { question } = res.body.content;
    assert(question.id, 'post /api/question fail!');
    assert(question.title === data.title, 'post /api/question fail!');
    assert(question.type === data.type, 'post /api/question fail!');
  });

  it('should GET /api/question/:id', async () => {
    app.mockCsrf();
    const data = {
      title: '测试题目',
      type: 1,
      score: 20,
      exam_id: 2,
    };
    const res = await app.httpRequest()
      .post('/api/question')
      .type('json')
      .send(data)
      .expect(200);
    assert(res.body.content.question.id, 'post /api/question fail!');
    assert(res.body.content.question.title === data.title, 'post /api/question fail!');
    assert(res.body.content.question.score === data.score, 'post /api/question fail!');

    const { id } = res.body.content.question;
    const resGet = await app.httpRequest()
      .get(`/api/question/${id}`);
    const { question } = resGet.body.content;
    assert(question.id === id, 'get /api/exam/:id fail!');
    assert(question.title === data.title, 'get /api/exam/:id fail!');
  });

  it('should PUT /api/question/:id', async () => {
    app.mockCsrf();
    const data = {
      title: '测试题目',
      type: 1,
      score: 30,
      exam_id: 5,
    };
    const res = await app.httpRequest()
      .post('/api/question')
      .type('json')
      .send(data)
      .expect(200);
    assert(res.body.content.question.id, 'post /api/question fail!');
    assert(res.body.content.question.title === data.title, 'post /api/question fail!');
    assert(res.body.content.question.score === data.score, 'post /api/question fail!');

    const { id } = res.body.content.question;
    const updateData = {
      id,
      title: '测试题目更改',
      type: 4,
      score: 22,
      exam_id: 6,
    };

    await app.httpRequest()
      .put('/api/question')
      .type('json')
      .send(updateData)
      .expect(200);
    const resGet = await app.httpRequest()
      .get(`/api/question/${id}`)
      .expect(200);
    assert(resGet.body.content.question.title === updateData.title, 'post /api/question fail!');
    assert(resGet.body.content.question.type === updateData.type, 'post /api/question fail!');
    assert(resGet.body.content.question.score === updateData.score, 'post /api/question fail!');
  });

  it('should DELETE /api/question/:id', async () => {
    app.mockCsrf();
    const data = {
      title: '测试题目',
      type: 1,
      score: 10,
      exam_id: 10,
    };
    const res = await app.httpRequest()
      .post('/api/question')
      .type('json')
      .send(data)
      .expect(200);
    assert(res.body.content.question.id, 'post /api/question fail!');
    assert(res.body.content.question.title === data.title, 'post /api/question fail!');
    assert(res.body.content.question.score === data.score, 'post /api/question fail!');

    const { id } = res.body.content.question;
    await app.httpRequest()
      .delete(`/api/question/${id}`)
      .expect(200);

    const resGet = await app.httpRequest()
      .get(`/api/question/${id}`);
    assert(resGet.body.content.question === null, 'delete /api/question/:id fail!');
  });

});
