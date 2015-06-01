# Extract a hash from a string
# @param url [String] The url you want the hash extracted from
# default is the current location
#
# @return [String] the Hash of the given url

getHash = (url) ->
  return url?.substring(url.indexOf('#') + 1) || window.location.hash

module?.exports = getHash
