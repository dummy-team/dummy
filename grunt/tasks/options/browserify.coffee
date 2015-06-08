module.exports =
  dev:
    options:
      transform: ["coffeeify"]
      browserifyOptions: {
        debug: true
      }
    files: [
      {
        expand: true
        cwd: '<%= in8.jsSrc %>/'
        src: ['*.coffee']
        dest: '<%= in8.jsDest %>/'
        ext: '.js'
      }
    ]


  build:
    options:
      transform: ["coffeeify"]
      browserifyOptions: {
        debug: false
      }
    files: [
      {
        expand: true
        cwd: '<%= in8.jsSrc %>/'
        src: ['*.coffee']
        dest: '<%= in8.jsDest %>/'
        ext: '.js'
      }
    ]
