'use strict';

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1523829971439_2128';

  // add your config here
  config.middleware = [];

  config.mysql = {
    client: {
      host: 'localhost',
      port: '3306',
      user: 'root',
      password: 0000,
      database: 'exam_system'
    },
    app: true,
    agent: false,
  };

  return config;
};
