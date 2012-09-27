module.exports = (grunt) ->

  # Constants
  BUILD_PATH = 'build'
  APP_PATH   = 'app'
  DEV_PATH   = "#{BUILD_PATH}/development"
  JS_DEV_PATH = "#{DEV_PATH}/js"

  # Project configuration
  grunt.initConfig
    coffee:
      build:
        files:
          'build/development/js/main.js': [ 
            'app/*.coffee'
            'app/controllers/*.coffee'
            'app/directives/*.coffee'
            'app/filters/*.coffee'
            'app/services/*.coffee'
          ]

    server:
      port: 8080
      base: BUILD_PATH

    watch:
      coffee:
        files: APP_PATH
        tasks: ''



  # Dependencies
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'  
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  
  # Aliases
  grunt.registerTask 'default', 'clean build'


    


    