loadLocals = require('../../tools/loadLocals')
options = loadLocals('parameters')

module.exports =
  dev:
    options:
      open: options.sync.open
      watchTask: true
      watchOptions:
        # Ignore dotfiles
        ignored: /^([.][^.\/\\])|([\/\\]+[.][^.])/
      server: options.sync.server
      proxy: options.sync.proxy

    bsFiles:
      src : options.sync.files
