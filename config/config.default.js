'use strict';

module.exports = appInfo => {
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1523829971439_2128';

  // add your config here
  config.middleware = [
    'errorHandler',
  ];

  config.mysql = {
    client: {
      host: '127.0.0.1',
      port: '3306',
      user: 'root',
      password: '0000',
      database: 'exam_system',
    },
    app: true,
    agent: false,
  };

  config.security = {
    domainWhiteList: [ 'http://localhost:8000' ],
    csrf: {
      enable: false,
    },
  };

  return config;
};
