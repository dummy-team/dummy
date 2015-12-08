loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

module.exports =
  options:
    config: '.jscsrc'
    esnext: true
    verbose: true
    fix: false
  app:
    files:
      src: [ options.js.source+'**/*.js' ]
