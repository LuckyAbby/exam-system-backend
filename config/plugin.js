'use strict';

// had enabled by egg
// exports.static = true;
exports.mysql = {
  enable: true,
  package: 'egg-mysql',
};

exports.cors = {
  enable: true,
  package: 'egg-cors',
};

// exports.nunjucks = {
//   enable: true,
//   package: 'egg-view',
// };

exports.ejs = {
  enable: true,
  package: 'egg-view-ejs',
};

// exports.static = {
//   enable: true,
// };
