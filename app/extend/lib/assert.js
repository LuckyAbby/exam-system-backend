'use strict';

const _ = require('lodash');

module.exports = function(expression, customError) {
  if (expression) return;

  if (_.isString(customError)) {
    customError = {
      message: customError,
    };
  }

  const { code, message, data } = customError;

  throw new this.Error(code, message, data);
};
