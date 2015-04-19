(function() {
  var _, defaults, path, t2,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  path = require('path');

  t2 = require('through2');

  _ = require('underscore');

  defaults = {
    ext: ['.html']
  };

  module.exports = function(file) {
    var ref;
    if (ref = path.extname(file), indexOf.call(defaults.ext, ref) < 0) {
      return t2();
    }
    return t2(function(data, enc, cb) {
      data = String(data);
      data = 'module.exports = ' + _.template(data).source;
      this.push(new Buffer(data));
      return cb();
    });
  };

}).call(this);
