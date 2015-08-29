options = require('../../parameters')

module.exports =
  options:
    force: true
  css:
    src: [
      options.css.dest+'*.tmp*'
    ]
