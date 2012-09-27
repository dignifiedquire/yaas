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
  controllers/
  directives/
  filters/
  partials/
  services/
  index.jade
  app.coffee
config/
  testacular/
vendor/
  img/
  font/
  script/
  style/
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



