module.exports =
  dev:
    options:
      style: "compact"
      precision: 20
      lineNumbers: true
    files:
      '<%= in8.cssDest %>/main.css': '<%= in8.cssSrc %>/main.scss'

  build:
    options:
      style: "compact"
      precision: 20
    files:
      '<%= in8.cssDest %>/main.css': '<%= in8.cssSrc %>/main.scss'
