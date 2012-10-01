# Configuration for e2e-tests on testacular

# base path, that will be used to resolve files and exclude
basePath = '../../'

# list of files / patterns to load in the browser
files = [
  MOCHA
  MOCHA_ADAPTER
  ANGULAR_SCENARIO
  ANGULAR_SCENARIO_ADAPTER
  'test/vendor/chai.js'
#  'vendor/script/angular/angular.js'
#  'vendor/script/angular/angular-*.js'
  'build/development/js/*.js'
  'test/e2e/js/*.js'
]

# enable / disable watching file and executing tests whenever any file changes
autoWatch = false

# Start these browsers, currently available:
# - Chrome
# - ChromeCanary
# - Firefox
# - Opera
# - Safari
# - PhantomJS
browsers = ['PhantomJS']

# Auto run tests on start (when browsers are captured) and exit
singleRun = false

# cli runner port
runnerPort = 9202

# web server port
port = 9877

# use dots reporter, as travis terminal does not support escaping sequences
# possible values: 'dots' || 'progress'
reporter = 'progress'

proxies = {
  '/': 'http://localhost:8002/'
}

junitReporter = {
  outputFile: 'test_out/e2e.xml',
  suite: 'e2e'
}

