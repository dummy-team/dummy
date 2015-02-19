module.exports =
  options:
    force: true
  build:
    src: [
      '<%= in8.docDest %>/*',
      '<%= in8.jsDest %>/*.min.js'
    ]
