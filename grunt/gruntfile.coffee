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
    grunt.registerTask key, require(path + option)
  )

  return object

module.exports = (grunt) ->
  # load all grunt tasks
  require('load-grunt-tasks')(grunt)
  config =
    pkg: grunt.file.readJSON('package.json')
    env: process.env

  # load tasks options
  grunt.util._.extend(config, loadConfig('./tasks/options/'))
  grunt.initConfig(config)

  # register tasks
  registerTasks(grunt, './tasks/')
