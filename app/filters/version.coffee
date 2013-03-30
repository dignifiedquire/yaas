# app/filters/version.coffee
module.exports = [
  'version',

  (version) ->
    (text) -> String(text).replace(/\%VERSION\%/mg, version)
]