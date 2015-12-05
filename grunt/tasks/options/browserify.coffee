loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')
es2015 = require('babel-preset-es2015');

module.exports =
  dev:
    options:
      transform: [['babelify', { presets: [es2015] }], 'stringify']
      browserifyOptions: {
        debug: true
      }
    files: [
      {
        expand: true
        cwd: options.js.source
        src: ['*.js']
        dest: options.js.dest
        ext: '.js'
      }
    ]
