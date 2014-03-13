module.exports =
  build:
    options:
      sourcemap: true
      style: "compact"
      precision: 20
      lineNumbers: true
    files:
      '<%= in8.cssDest %>/main.css': '<%= in8.cssSrc %>/styles.scss'
      '<%= in8.cssDest %>/ie.css': '<%= in8.cssSrc %>/ie.scss'