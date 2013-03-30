var autoWatch, basePath, browsers, files, junitReporter, port, proxies, reporter, runnerPort, singleRun;

basePath = '../../';

files = [MOCHA, MOCHA_ADAPTER, ANGULAR_SCENARIO, ANGULAR_SCENARIO_ADAPTER, 'test/vendor/chai.js', 'build/development/js/*.js', 'test/e2e/js/*.js'];

autoWatch = false;

browsers = ['PhantomJS'];

singleRun = false;

runnerPort = 9202;

port = 9877;

reporter = 'progress';

proxies = {
  '/': 'http://localhost:8002/'
};

junitReporter = {
  outputFile: 'test_out/e2e.xml',
  suite: 'e2e'
};
