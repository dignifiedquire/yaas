# app/directives/version.coffee

module.exports = [
  'version'

  (version) ->
    (scope, elm, attrs) -> elm.text(version)
]