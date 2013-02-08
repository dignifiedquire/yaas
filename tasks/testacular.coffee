module.exports = (grunt) ->
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
      testCmd = 'node_modules/.bin/testacular'

    # runner = "--runner-port #{@data.options.runnerPort}"

    travisArgs = ['start', '--single-run', '--no-auto-watch', '--reporter=dots', '--browsers=Firefox']
    testArgs = if process.env.TRAVIS then travisArgs else ['run', '--runner-port', @data.options.runnerPort]

    specDone = this.async()

    child = grunt.util.spawn {cmd: testCmd, args: testArgs}, (err, result, code) ->
      # console.log code, result, err
      grunt.log.error("Test failed...", code) if code
      specDone()
    # console.log child
    child.stdout.pipe(process.stdout)
    child.stderr.pipe(process.stderr)
