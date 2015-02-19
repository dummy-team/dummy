module.exports =
  build:
    options:
      browsers: ["last 3 version", "ie 8", "ie 7"]
    files:
      '<%= in8.cssDest %>/main.css': '<%= in8.cssDest %>/main.css'
      '<%= in8.cssDest %>/ie.css': '<%= in8.cssDest %>/ie.css'
