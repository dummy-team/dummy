'use strict'

mountFolder = (connect, dir) ->
  connect.static require('path').resolve(dir)

loadConfig = (path)->
  glob = require('glob')
  object = {}

  glob.sync('*', {cwd: path}).forEach((option)->
    key = option.replace(/\.coffee$/,'')
    object[key] = require(path + option)
  )
  return object

registerTasks = (grunt, path)->
  glob = require('glob')
  object = []
  glob.sync('*.coffee', {cwd: path}).forEach((option)->
    key = option.replace(/\.coffee$/,'')
    grunt.registerTask 'key', require(path + option)(grunt)
  )

  return object


browserSync = require("browser-sync")
module.exports = (grunt) ->
  # load all grunt tasks
  require("load-grunt-tasks")(grunt)

  config =
    pkg: grunt.file.readJSON('package.json')
    env: process.env
    in8:
      jsSrc   : '../js/src'
      jsDest  : '../js'
      imgSrc  : '../img'
      cssSrc  : '../css/src'
      cssDest : '../css'
      htmlSrc : '../'
      docDest : '../docs'
      liveport: grunt.option('liveport') || 35729


  # load tasks options
  grunt.util._.extend(config, loadConfig('./tasks/options/'))
  grunt.initConfig(config)

  # register tasks

  grunt.registerTask "bs-start", ->
    done = this.async()
    browserSync
      files: [
        '<%= in8.jsDest %>/*.js'
        '<%= in8.jsDest %>/**/*.js'
        '<%= in8.imgSrc %>/**'
        '<%= in8.htmlSrc %>/*.html'
        '<%= in8.htmlSrc %>/**/*.html'
      ]
      open: false
      watchTask: true
      server:
        baseDir: "../"
    , (err, bs) ->
      done()

  # Fire file-change events manually for greater control
  grunt.registerTask "bs-reload", ->
    # ¡ Paths are relatives to server baseDir !
    browserSync.reload(["css/main.css"])

  registerTasks(grunt, './tasks/')
