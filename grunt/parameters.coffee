module.exports =
  sync:
  # Files which trigger a browser reload
    files: [
      '../*.html'
      '../css/*.css'
      '../js/*.js'
      '../img/**'
    ]
    # Strat a basic file server
    server: '../'
    # Use an existing server (apache,node...)
    proxy: false # 'domain.local'
    # Open browser on server start
    open: false
  # Errors in linters Prevent compilation
  lint:
    lock: false
  autoprefixer:
    browsers: 'last 3 version'
  # Source files
  js:
    source: '../js/src/'
    dest: '../js/'
  css:
    source  : '../css/src/'
    dest : '../css/'
    style: 'compact'
    precision: 20
