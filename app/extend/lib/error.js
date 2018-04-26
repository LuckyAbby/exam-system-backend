'use strict';

function CustomError(code, message, data) {
  const argLen = arguments.length;
  if (argLen === 1) {
    message = code;
    code = '';
  }

  Error.captureStackTrace(this, this.constructor);

  this.name = this.constructor.name;
  this.code = code;
  this.message = message;
  this.data = data;
}

require('util').inherits(CustomError, Error);

module.exports = CustomError;
