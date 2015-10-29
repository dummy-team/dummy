loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

module.exports =
  dev:
    options:
      transform: ['coffeeify', 'stringify']
      browserifyOptions: {
        debug: true
      }
    files: [
      {
        expand: true
        cwd: options.js.source
        src: ['*.coffee']
        dest: options.js.dest
        ext: '.js'
      }
    ]
