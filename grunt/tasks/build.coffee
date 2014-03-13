module.exports = (grunt)->
  grunt.registerTask 'build', [
    'concurrent:builds'
    'autoprefixer:build'
    'uglify:build'
    'groc'
    'cssmin:minify'
  ]