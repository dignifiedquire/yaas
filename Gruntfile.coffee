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
            'app/app.coffee'
            'app/routes.coffee'
            'app/controllers/*.coffee'
            'app/directives/*.coffee'
            'app/filters/*.coffee'
            'app/services/*.coffee'
          ]
          
    concat:
      development:
        files:
          'build/development/js/vendor.js': [
            'vendor/script/jquery/jquery.js'
            'vendor/script/bootstrap/transition.js'
            'vendor/script/bootstrap/alert.js'
            'vendor/script/bootstrap/modal.js'
            'vendor/script/bootstrap/dropdown.js'
            'vendor/script/bootstrap/scrollspy.js'
            'vendor/script/bootstrap/tab.js'
            'vendor/script/bootstrap/tooltip.js'
            'vendor/script/bootstrap/popover.js'
            'vendor/script/bootstrap/button.js'
            'vendor/script/bootstrap/collapse.js'
            'vendor/script/bootstrap/carousel.js'
            'vendor/script/bootstrap/typeahead.js'
            'vendor/script/bootstrap/affix.js'
            'vendor/script/angular/angular.js'
            'vendor/script/angular/angular-resource.js'
            'vendor/script/angular/angular-cookies.js'
            'vendor/script/angular/angular-loader.js'
            'vendor/script/angular/angular-sanitize.js'            
            #'vendor/script/**/*.js'
          ]
          'build/development/js/vendor.css': 'vendor/style/**/*.css'
    less:
      development:
        options:
          paths: [
            'app/assets/style'
            'vendor/style'
          ]
        files:
          'build/development/css/app.css': [
            'app/assets/style/app.less'
          ]
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
      concat:
        files: ['vendor/script/**/*.js', 'vendor/style/**/*.css']
        tasks: 'concat:development'
      jade:
        files: ['app/index.jade', 'app/partials/*.jade']
        tasks: 'jade:development'
      less:
        files: ['app/assets/style/*.less']
        tasks: 'jade:development'
  

  # Dependencies
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'  
  grunt.loadNpmTasks 'grunt-contrib-less'  
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  
  # Aliases
  grunt.registerTask 'development', 'clean:development coffee:development jade:development concat:development less:development'
  
  grunt.registerTask 'default', 'clean development server watch'


    


    