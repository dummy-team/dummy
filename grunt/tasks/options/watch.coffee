loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

if options.lint.lock
  tasks =
    sass : [
      'scsslint'
      'sass:dev'
      'postcss:dev'
      'clean:css'
    ]
    coffee: [
      'coffeelint'
      'browserify:dev'
    ]
else
  tasks =
    sass : [
      'sass:dev'
      'postcss:dev'
      'clean:css'
      'scsslint'
    ]
    coffee: [
      'browserify:dev'
      'jshint'
    ]


module.exports =
  options:
    spawn: false

  sass:
    files:options.css.dest+'**/*.scss'
    tasks: tasks.sass

  coffee:
    files: options.js.dest+'**/*.js'
    tasks: tasks.coffee
