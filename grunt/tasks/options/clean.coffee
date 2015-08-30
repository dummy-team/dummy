loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

module.exports =
  options:
    force: true
  css:
    src: [
      options.css.dest+'*.tmp*'
    ]
