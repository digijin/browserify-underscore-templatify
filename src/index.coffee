path = require 'path'
t2 = require 'through2'
_ = require 'underscore'


module.exports = (file) ->
	unless path.extname(file) is '.html'
		return t2()
	t2 (data, enc, cb) ->
		data = String data
		data = 'module.exports = ' + _.template(data).source
		@push new Buffer data
		cb()