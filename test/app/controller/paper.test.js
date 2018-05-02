'use strict';

const _ = require('lodash');
const { app, assert } = require('egg-mock/bootstrap');

describe('test/app/controller/paper.test.js', () => {
  it('should GET /api/paper', async () => {
    const res = await app.httpRequest()
      .get('/api/paper')
      .expect(200);
    assert(_.isArray(res.body.content.papers), 'get /api/paper fail!');
  })

  it('should POST /api/paper', async () => {
    app.mockCsrf();
    const data = {
      name: '测试试卷',
      user: 1,
      exam_id: 12,
      total_score: 99,
      subjective_score: 98,
      objective_score: 97,
    };
    const res = await app.httpRequest()
      .post('/api/paper')
      .type('json')
      .send(data)
      .expect(200);
    const { paper } = res.body.content;
    assert(paper.id, 'post /api/paper fail!');
    assert(paper.name === data.name, 'post /api/paper fail!');
    assert(paper.user === data.user, 'post /api/paper fail!');
  });

  it('should GET /api/paper/:id', async () => {
    app.mockCsrf();
    const data = {
      name: '测试试卷',
      user: 12,
      exam_id: 123,
      total_score: 99,
      subjective_score: 97,
      objective_score: 98,
    };
    const res = await app.httpRequest()
      .post('/api/paper')
      .type('json')
      .send(data)
      .expect(200);
    const { paper } = res.body.content;
    assert(paper.id, 'post /api/paper fail!');
    assert(paper.name === data.name, 'post /api/paper fail!');
    assert(paper.user === data.user, 'post /api/paper fail!');

    const { id } = paper;
    const resGet = await app.httpRequest()
      .get(`/api/paper/${id}`);
    const paperGet  = resGet.body.content.paper;
    assert(paperGet.id === id, 'get /api/paper/:id fail!');
    assert(paperGet.name === data.name, 'get /api/paper/:id fail!');
  });

  it('should PUT /api/paper/:id', async () =>{
    app.mockCsrf();
    const data = {
      name: '测试考试',
      user: 23,
      exam_id: 122,
      total_score: 98,
      subjective_score: 97,
      objective_score: 96,
    };
    const res = await app.httpRequest()
      .post('/api/paper')
      .type('json')
      .send(data)
      .expect(200);
    const { paper } = res.body.content;
    assert(paper.id, 'post /api/paper fail!');
    assert(paper.name === data.name, 'post /api/paper fail!');
    assert(paper.user === data.user, 'post /api/paper fail!');

    const { id } = res.body.content.paper;
    const updateData = {
      id,
      name: '测试试卷更改',
      subjective_score: 100,
    };
    await app.httpRequest()
      .put('/api/paper')
      .type('json')
      .send(updateData)
      .expect(200);
    const resGet = await app.httpRequest()
      .get(`/api/paper/${id}`)
      .expect(200);
    assert(resGet.body.content.paper.name === updateData.name);
    assert(resGet.body.content.paper.subjective_score === updateData.subjective_score);
  });

  it('should DELETE /api/paper/:id', async () => {
    app.mockCsrf();
    const data = {
      name: '测试试卷',
      user: 11,
      exam_id: 10,
      subjective_score: 90,
      total_score: 100,
      objective_score: 90,
    };
    const res = await app.httpRequest()
      .post('/api/paper')
      .type('json')
      .send(data)
      .expect(200);
    const { paper } = res.body.content;
    assert(paper.id, 'post /api/paper failed!');
    assert(paper.name === data.name, 'post /api/paper fail');

    const { id } = paper;
    await app.httpRequest()
      .delete(`/api/paper/${id}`)
      .expect(200);
    const resGet = await app.httpRequest()
      .get(`/api/paper/${id}`);
      assert(resGet.body.content.paper === null, 'delete /api/paper fail!');
  });
});
