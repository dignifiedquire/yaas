module.exports = (grunt) ->

  # Constants
  BUILD_PATH = 'build'
  APP_PATH   = 'app'
  
  # Project configuration ----------
  grunt.initConfig

    server:
      port: 8080
      base: BUILD_PATH

    watch:
      coffee:
        files: APP_PATH
        tasks: ''



  grunt.registerTask 'default', 'server watch'


    


    