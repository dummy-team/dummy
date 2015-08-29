options = require('../../parameters')

module.exports=
  options:
    config: './scss-lint.yml'
    colorizeOutput: true
  allFiles: [
    options.css.source+'**/*.scss '
  ]
