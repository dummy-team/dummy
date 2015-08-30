loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

files = {}
files[options.css.dest+'main.css.tmp'] = options.css.source+'main.scss'

sass =
  dev:
    options:
      sourceMap: true
      outputStyle: options.css.style
      precision: options.css.precision
    files: files


module.exports = sass
