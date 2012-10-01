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
          'test/unit/js/*.js': 'test/unit/**/*.coffee'
      config:
        options:
          bare: true
        files:
          'config/testacular/*.js': 'config/testacular/*.coffee'
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
      port: 8002
      base: "./#{DEV_PATH}"

    watch:
      coffee:
        files: ['app/*.coffee', 'app/**/*.coffee', 'test/unit/**/*.coffee']
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
  grunt.registerMultiTask 'testacularServer', 'Start testacularServer', ->
    testacular = require('testacular')

    # start the server
    testacular.server.start @data.options
    
    done = @async()
    done()
    
  grunt.registerMultiTask 'testacularRun', 'Run testacular tests', ->
    if process.platform == 'win32'
      testCmd = 'node_modules\\.bin\\testacular.cmd'
    else 
#      testCmd = 'node_modules/.bin/testacular'
      testCmd = 'testacular'

    runner = "--runner-port #{@data.options.runnerPort}"
    
    travisArgs = ['start', '--single-run', '--no-auto-watch', '--reporter=dots', '--browsers=Firefox'] 
    testArgs = if process.env.TRAVIS then travisArgs else ['run', runner]

    specDone = this.async()
    
    child = grunt.util.spawn {cmd: testCmd, args: testArgs}, (err, result, code) ->
      #console.log code, result, err
      grunt.log.error("Test failed...", code) if code
      specDone()
    #console.log child
    child.stdout.pipe(process.stdout)
    child.stderr.pipe(process.stderr)

    


  # Dependencies
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'  
  grunt.loadNpmTasks 'grunt-contrib-less'  
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  
  # Aliases
  grunt.registerTask 'config', 'coffee:config'
  grunt.registerTask 'development', 'clean:development coffee:development jade:development concat:development less:development'
  grunt.registerTask 'test', 'testacularServer'
  
  grunt.registerTask 'default', 'clean config development testacularServer server watch'


    


    