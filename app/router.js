'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);

  router.get('/user', controller.user.index);


  // exam
  // 获取考试列表
  router.get('/api/exam', controller.exam.index);
  // 获取单个考试
  router.get('/api/exam/:id', controller.exam.show);
  // 新建一个考试
  router.post('/api/exam', controller.exam.create);
  // 更新一个考试
  router.put('/api/exam', controller.exam.update);
  // 删除一个考试
  router.delete('/api/exam/:id', controller.exam.delete);
  // 测试考试的路由
  // 运行 npm run test-local test/app/controller/exam.test.js
  // 详见 test/app/controller/exam.test.js
  // 其他同理。

  router.get('/api/question', controller.question.index);
  router.get('/api/question/:id', controller.question.show);
  router.post('/api/question', controller.question.create);
  router.put('/api/question', controller.question.update);
  router.delete('/api/question/:id', controller.question.delete);

  router.get('/api/paper', controller.paper.index);
  router.get('/api/paper/:id', controller.paper.show);
  router.post('/api/paper', controller.paper.create);
  router.put('/api/paper', controller.paper.update);
  router.delete('/api/paper/:id', controller.paper.delete);

  // router.get('/api/student', controller.student.index);
  // router.get('/api/student/:id', controller.student.show);
  // router.post('/api/student', controller.student.create);
  // router.put('/api/student', controller.student.update);
  // router.delete('/api/student/:id', controller.student.delete);
};
