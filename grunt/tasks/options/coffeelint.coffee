loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

module.exports =
  options:
    configFile: 'coffeelint.json'
  app:
    files:
      src: [ options.js.source+'**/*.coffee' ]
