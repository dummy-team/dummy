module.exports =
  dev:
    options:
      debug: true
    src: [
      '<%= in8.jsSrc %>/main.coffee'
    ]
    dest: '<%= in8.jsDest %>/main.js'

  build:
    options:
      debug: false
    src: [
      '<%= in8.jsSrc %>/main.coffee'
    ]
    dest: '<%= in8.jsDest %>/main.js'
