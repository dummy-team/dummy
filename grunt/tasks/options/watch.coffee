module.exports =
  options:
    livereload: '<%= in8.liveport %>'
    spawn: false

  sass:
    files:'<%= in8.cssSrc %>/*.scss'
    tasks: [
      'sass:dev',
      'autoprefixer'
      'bs-reload'
    ]

  coffee:
    files: '<%= in8.jsSrc %>/*.coffee'
    tasks: [
      'coffee:dev'
    ]
