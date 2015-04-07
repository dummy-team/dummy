module.exports =
  options:
    force: true
  js:
    src: [
      '<%= in8.jsDest %>/*.min.js'
    ]
  css:
    src: [
      '<%= in8.cssDest %>/*.tmp.css'
    ]
