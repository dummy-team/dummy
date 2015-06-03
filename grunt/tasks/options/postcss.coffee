module.exports =
  build:
    options:
      map: true
      processors: [
        require('autoprefixer-core')({browsers: 'last 3 version'}),
      ]
    files:
      '<%= in8.cssDest %>/main.css': '<%= in8.cssDest %>/main.tmp.css'
