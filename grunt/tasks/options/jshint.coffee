loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

module.exports =
  options:
    jshintrc: '.jshintrc'
  app:
    files:
      src: [ options.js.source+'**/*.js' ]
