gulp = require 'gulp'
browserify = require 'browserify'

source = require 'vinyl-source-stream'
templatify = require './src/index.coffee'

gulp.task "default", ->
	bundler = browserify(
		entries: [ './spec/test.us' ])
	bundler.transform templatify({ext:['.us']})
	bundler.bundle()
		.pipe(source('bundle.js'))
		.pipe gulp.dest('./temp/')