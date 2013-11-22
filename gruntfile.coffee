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
          sourceMap: true
        expand: true
        flatten: true
        cwd: 'js/src'
        src: ['*.coffee']
        dest: 'js'
        ext: '.js'


    # You must build docco last cause it stop the task chain (e.g. not compatible with watch)
    docco:
      buildCoffee:
        src: ['js/src/*.coffee']
        options:
          output: 'docs/coffee/annotated-source'
          css: 'docs/assets/custom.css'
      buildSass:
        src: ['css/src/*.scss']
        options:
          output: 'docs/sass/annotated-source'
          css: 'docs/assets/custom.css'

    sass:
      build:
        options:
          sourcemap: true
          style: "compact"
          precision: 20
          lineNumbers: true
        files:
          'css/main.css': 'css/src/styles.scss'
          'css/ie.css': 'css/src/ie.scss'

    autoprefixer:
      build:
        browsers: ["last 3 version", "ie 8", "ie 7"]
        src: 'css/main.css'

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
        livereload: 35729
      html:
        files:'*.html'
      sass:
        files:'css/src/*.scss'
        tasks: [
          'sass:build',
          'autoprefixer:build'
        ]
      coffee:
        files: 'js/src/*.coffee'
        tasks: 'coffee:build'


    grunt.registerTask 'default', [
      'sass:build'
      'autoprefixer:build'
      'coffee:build'
    ]

    grunt.registerTask 'server', [
      'sass:build'
      'autoprefixer:build'
      'coffee:build'
      'connect'
      'open'
      'watch'
    ]

