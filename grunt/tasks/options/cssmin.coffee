loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

module.exports =
  build:
    options:
      banner: '/*! minified <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */'
    expand: true
    cwd: options.css.dest
    src: 'main.css'
    dest: options.css.dest
    ext: '.min.css'
