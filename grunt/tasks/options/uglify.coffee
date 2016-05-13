loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')


module.exports =
  options:
    compress:
      dead_code: true
      drop_debugger: true
      drop_console: true
      warnings: true
  build:
    options:
      report: 'gzip'
      exportAll: true
    files: [{
      expand: true,
      cwd: options.js.dest,
      src: ['*.js','!*.min.js'],
      dest: options.js.dest
      ext: '.min.js'
    }]
