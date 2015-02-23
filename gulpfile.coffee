gulp = require 'gulp'
browserify = require 'browserify'
coffee = require "gulp-coffee"
source = require 'vinyl-source-stream'
templatify = require './src/index.coffee'

gulp.task "coffee", ->
	gulp.src './src/*.coffee'
	.pipe coffee()
	.pipe gulp.dest './dist'

gulp.task "default", ['coffee'], ->
	bundler = browserify(
		entries: [ './spec/test.us' ])
	bundler.transform templatify({ext:['.us']})
	bundler.bundle()
		.pipe(source('bundle.js'))
		.pipe gulp.dest('./temp/')