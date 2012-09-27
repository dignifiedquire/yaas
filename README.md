# yaas - yet another angular seed


## Why?
Because I'm not satisfied with the seeds out there. [Yeoman](http://yeoman.io) isn't working for me yet and it's Windows support leaves much desired.



## What can it do for me?
When it's setup it will make your development live much easier. You will be able to use the following awesome and hip technologies

* [Anuglar.js](http://angularjs.org) for the framework
* [CoffeeScript](http://coffeescript.org/) for the source
* [SASS](http://sass-lang.com/) for the style
* [Bootstrap](twitter.github.com/bootstrap/) with [FontAwesome](http://fortawesome.github.com/Font-Awesome/) for the layout
* [Jade](http://jade-lang.com/) for the templates
* [Phantomjs](http://phantomjs.org/) for the headless
* [Mocha](http://visionmedia.github.com/mocha/) for the tests


## Where do all my files live?
```
build/
app/
    assets/
        style/
            app.scss
        img/
        font/
        
vendor/
    components/
    img/
    font/
    script/
    style/

        
     
 index.html        --> app layout file (the main html template file of the app)
 script/               --> javascript files
   controllers     --> application controllers
     first.coffee
   filters         --> custom angular filters
     first.coffee
   services        --> custom angular services
     first.coffee
   widgets         --> custom angular widgets
     first.coffee
 partials/         --> angular view partials (partial html templates)
   partial1.html
   partial2.html
 vendor/           --> third party code handeld via bower
   img/
   script/
   style/

config/testacular.conf.js        --> config file for running unit tests with Testacular
config/testacular-e2e.conf.js    --> config file for running e2e tests with Testacular


test/               --> test source files and libraries
  e2e/              -->
    runner.html     --> end-to-end test runner (open in your browser to run)
    scenarios.js    --> end-to-end specs
  lib/
    angular/                --> angular testing libraries
      angular-mocks.js      --> mocks that replace certain angular services in tests
      angular-scenario.js   --> angular's scenario (end-to-end) test runner library
      version.txt           --> version file
  unit/                     --> unit level specs/tests
    controllersSpec.js      --> specs for controllers
```

## How does this magic happen?
This project uses [grunt](http://gruntjs.com) for the build process and all the other magic. The tests are run via [testacular](http://vojtajina.github.com/testacular/).

### Tasks

#### Watch
 * watches all source files and recompiles them on save

#### Testacular Unit/E2E
* runs a testacular server that watches for changes in the test files
  and runs the tests on save


## What can I do for it?
* file issues
* fix issues
* contribute tests


