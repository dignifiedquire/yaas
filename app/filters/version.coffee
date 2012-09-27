# app/filters/version.coffee

'use strict'

angular.module('app.filters', [])

.filter 'interpolate', [
  'version',

  (version) ->
    (text) -> String(text).replace(/\%VERSION\%/mg, version)
]