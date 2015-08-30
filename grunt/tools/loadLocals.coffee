module.exports = (path) ->
  path = "../"+path
  options = require(path)
  extend = require('util')._extend

  options_local = true
  try
    require.resolve(path+'_local')
  catch error
    options_local = false

  if options_local
    options = extend(options, require(path+'_local'))

  return options
