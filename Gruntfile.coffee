module.exports = (grunt) ->

  # Constants
  BUILD_PATH = 'build'
  APP_PATH   = 'app'
  DEV_PATH   = "#{BUILD_PATH}/development"
  JS_DEV_PATH = "#{DEV_PATH}/js"

  # Project configuration
  grunt.initConfig
    clean:
      development: "#{DEV_PATH}"
    coffee:
      development:
        files:
          'build/development/js/app.js': [ 
            'app/*.coffee'
            'app/controllers/*.coffee'
            'app/directives/*.coffee'
            'app/filters/*.coffee'
            'app/services/*.coffee'
          ]
          
    concat:
      development:
        files:
          'build/development/js/vendor.js': 'vendor/script/*.js'
    jade:
      development:
        options:
          data:
            debug: true
        files:
          'build/development/index.html': "#{APP_PATH}/index.jade"
          'build/development/partials/*.html': "#{APP_PATH}/partials/*.jade"
    server:
      port: 8080
      base: "./#{DEV_PATH}"

    watch:
      coffee:
        files: ['app/*.coffee', 'app/**/*.coffee']
        tasks: 'coffee:development'

  

  # Dependencies
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'  
  grunt.loadNpmTasks 'grunt-contrib-less'  
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  
  # Aliases
  grunt.registerTask 'development', 'clean:development coffee:development jade:development'
  
  grunt.registerTask 'default', 'clean development server watch'


    


    