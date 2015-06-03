module.exports =
  dev:
    options:
      open: false
      watchTask: true
      server: "../"
      # proxy: "local.inouit.com"

    bsFiles:
      src : [
        '../*.html'
        '../css/*.css'
        '../js/*.js'
      ]
