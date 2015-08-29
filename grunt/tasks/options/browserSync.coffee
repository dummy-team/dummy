options = require('../../parameters')

module.exports =
  dev:
    options:
      open: options.sync.open
      watchTask: true
      watchOptions:
        ignored: /^([.][^.\/\\])|([\/\\]+[.][^.])/
      server: options.sync.server
      proxy: options.sync.proxy

    bsFiles:
      src : options.sync.files
