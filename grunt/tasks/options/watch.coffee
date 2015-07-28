module.exports =
  options:
    spawn: false

  sass:
    files:'<%= in8.cssSrc %>/**/*.scss'
    tasks: [
      'sass:dev'
      'postcss'
      'clean:css'
      'scsslint'
    ]

  coffee:
    files: '<%= in8.jsSrc %>/**/*.coffee'
    tasks: [
      'browserify:dev'
      'coffeelint'
    ]
