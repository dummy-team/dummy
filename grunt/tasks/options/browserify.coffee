options = require('../../parameters')

module.exports =
  dev:
    options:
      transform: ["coffeeify"]
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
