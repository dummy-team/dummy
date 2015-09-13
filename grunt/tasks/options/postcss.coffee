loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

files = {}
files[options.css.dest+'main.css'] = options.css.dest+'main.css.tmp'

module.exports =
  dev:
    options:
      map: true
      processors: [
        require('autoprefixer')(options.autoprefixer),
      ]
    files: files
