loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

module.exports =
  build:
    expand: true
    cwd: options.css.dest
    src: 'main.css'
    dest: options.css.dest
    ext: '.min.css'
