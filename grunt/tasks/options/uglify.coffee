module.exports =
  options:
    banner: '/*! uglified <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */'
    # https://github.com/mishoo/UglifyJS2#compressor-options
    compress:
      dead_code: true
      drop_debugger: true
      drop_console: true
      warnings: true
  build:
    options:
      report: 'gzip'
      exportAll: true
    files: [{
      expand: true,
      cwd: '<%= in8.jsDest %>',
      src: '*.js',
      dest: '<%= in8.jsDest %>',
      ext: '.min.js'
    }]
