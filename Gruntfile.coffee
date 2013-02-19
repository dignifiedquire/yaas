module.exports = (grunt) ->

  # Constants
  BUILD_PATH = 'build'
  APP_PATH   = 'app'
  DEV_PATH   = "#{BUILD_PATH}/development"
  JS_DEV_PATH = "#{DEV_PATH}/js"

  # Project configuration
  grunt.initConfig
    clean:
      development: [DEV_PATH]

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
      config:
        options:
          bare: true
        files: [
          expand: true
          cwd: 'config'
          src: ['**/*.coffee']
          dest: 'config'
          ext: '.js'
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
          pretty: true
          data:
            debug: true
        files: [
          expand: true
          cwd: APP_PATH
          src: ['**/*.jade']
          dest: 'build/development'
          ext: '.html'
        ]
    connect:
      server:
        options:
          port: 8002
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
      config:
        files: ['config/testacular/*.coffee']
        tasks: 'coffee:config'

    testacularServer:
      unit:
        options:
          configFile: 'config/testacular/unit.js'
      e2e:
        options:
          configFile: 'config/testacular/e2e.js'
    testacularRun:
      unit:
        options:
          runnerPort: 9201
      e2e:
        options:
          runnerPort: 9202



  # Custom tasks
  grunt.loadTasks('tasks')



  # Dependencies
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  # Aliases
  grunt.registerTask 'config', 'coffee:config'
  grunt.registerTask 'development', [
    'clean:development'
    'coffee:development'
    'jade:development'
    'concat:development'
    'less:development'
  ]

  grunt.registerTask 'test', 'testacularServer'

  grunt.registerTask 'default', [
    'config'
    'development'
    'test'
    'connect:server'
    'watch'
  ]





