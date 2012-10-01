var autoWatch, basePath, browsers, files, junitReporter, logLevel, port, preprocessors, proxies, reporter, runnerPort, singleRun;

basePath = '../../';

files = [MOCHA, MOCHA_ADAPTER, 'vendor/script/angular/angular.js', 'test/vendor/chai.js', 'vendor/script/angular/angular-*.js', 'test/vendor/angular-mock.js', 'build/development/js/*.js', 'test/unit/**/*.coffee'];

autoWatch = false;

browsers = ['Chrome'];

singleRun = false;

runnerPort = 9201;

port = 9878;

reporter = 'progress';

proxies = {
  '/': 'http://localhost:8002/'
};

junitReporter = {
  outputFile: 'test_out/e2e.xml',
  suite: 'e2e'
};

preprocessors = {
  '**/*.coffee': 'coffee'
};

logLevel = LOG_DEBUG;
