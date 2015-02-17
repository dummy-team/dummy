module.exports =
  dev:
    options:
      sourcemap: "file"
      style: "compact"
      precision: 20
      lineNumbers: true
      update: true
    files:
      '<%= in8.cssDest %>/main.css': '<%= in8.cssSrc %>/styles.scss'

  ie:
    options:
      style: "compact"
      precision: 20
    files:
      '<%= in8.cssDest %>/main.css': '<%= in8.cssSrc %>/styles.scss'
      '<%= in8.cssDest %>/ie.css': '<%= in8.cssSrc %>/ie.scss'
