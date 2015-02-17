module.exports =
  dev:
    options:
      sourceMap: true
    expand: true
    flatten: true
    cwd: '<%= in8.jsSrc %>'
    src: ['*.coffee']
    dest: '<%= in8.jsDest %>'
    ext: '.js'

  build:
    options:
      sourceMap: false
    expand: true
    flatten: true
    cwd: '<%= in8.jsSrc %>'
    src: ['*.coffee']
    dest: '<%= in8.jsDest %>'
    ext: '.js'
