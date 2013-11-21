# Generated on 2013-11-13 using generator-bower 0.0.2
'use strict'

mountFolder = (connect, dir) ->
    connect.static require('path').resolve(dir)

module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.initConfig

    coffee:
      build:
        options:
          join: true,
          sourceMap: true
        files:
          './script.js': 'js/src/*.coffee'

    sass:
      build:
        files:
          'css/main.css': 'css/src/styles.scss'
          'css/ie.css': 'css/src/ie.scss'

    connect:
      all:
        options:
          port: 8000,
          hostname: "0.0.0.0",
          middleware: (connect, options) ->
            return [
              # Serve the project folder
              connect.static(options.base)
            ]

    open:
      all:
        path: 'http://localhost:<%= connect.all.options.port%>/'

    watch:
      options:
        livereload: 1337
      html:
        files:'*.html'
      sass:
        files:'css/src/*.scss'
        tasks: 'sass:build'
      coffee:
        files: 'js/src/*.coffee'
        tasks: 'coffee:build'

    grunt.registerTask 'default', [
      'sass:build'
      'coffee:build'
    ]

    grunt.registerTask 'server', [
      'sass:build'
      'coffee:build'
      'connect',
      'open'
      'watch'
    ]

