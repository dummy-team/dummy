'use strict'

mountFolder = (connect, dir) ->
    connect.static require('path').resolve(dir)

module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.initConfig

    # You can't run the docco task alone, coffeFiles & sassFiles don't chain.
    # You have to call them separatly.
    docco:
      coffeeFiles:
        files:
          src: ['js/src/*.coffee']
        options:
          output: 'docs/coffee/annotated-source'
          css: 'docs/assets/custom.css'
      sassFiles:
        files:
          src: ['css/src/*.scss']
        options:
          output: 'docs/sass/annotated-source'
          css: 'docs/assets/custom.css'

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
          port: grunt.option('port') || 0
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
        port: grunt.option('liveport') || 35729
      html:
        files:[
          '*.html'
          '**/*.html'
          'notify:html'
        ]
      sass:
        files:'css/src/*.scss'
        tasks: [
          'sass:build',
          'autoprefixer:build'
          'docco:sassFiles'
          'notify:sass'
        ]
      coffee:
        files: 'js/src/*.coffee'
        tasks: [
          'coffee:build'
          'docco:coffeeFiles'
          'notify:coffee'
        ]

    notify:
      html:
        options:
          title: 'Live reload',
          message: 'html updated',
      sass:
        options:
          title: 'Live reload',
          message: 'Sass compiled & documentation generated',
      coffee:
        options:
          title: 'Live reload',
          message: 'CoffeeScript compiled & documentation generated',
      server:
        options:
          message: 'Server is ready!'
      build:
        options:
          message: 'Build Successfull!'

    grunt.registerTask 'default', 'serve'

    grunt.registerTask 'serve', [
      'sass:build'
      'autoprefixer:build'
      'coffee:build'
      'connect'
      'notify:server'
      'open'
      'watch'
    ]

    grunt.registerTask 'build', [
      'sass:build'
      'autoprefixer:build'
      'coffee:build'
      'notify:build'
    ]

