options = require('../../parameters')
files = {}
files[options.css.dest+'main.css'] = options.css.dest+'main.css.tmp'

module.exports =
  dev:
    options:
      map: true
      processors: [
        require('autoprefixer-core')(options.autoprefixer),
      ]
    files: files
