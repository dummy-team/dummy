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
        '../css/main.css'
        '../js/main.js'
      ]
