module.exports = (grunt)->
  grunt.registerTask 'build', [
    'concurrent:builds'
    'autoprefixer'
    'uglify'
    'groc'
    'cssmin'
  ]