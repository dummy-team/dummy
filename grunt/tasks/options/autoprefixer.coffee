module.exports =
  build:
    options:
      map: true
      browsers: ["last 3 versions"]
    files:
      '<%= in8.cssDest %>/main.css': '<%= in8.cssDest %>/main.tmp.css'
