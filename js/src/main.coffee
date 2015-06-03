# Helpers
#
# getHash = require './components/getHash.coffee'

# jQuery helpers
#
require('./components/jquery.hoverSrc.coffee')
# require './components/jquery.pulldown.coffee'
# require './components/jquery.fixToTop.coffee'
# require './components/jquery.smoothAnchors.coffee'

# Website wide scripts
# @author Inouit
#

$( ->
  $(window).ready( ->

    # Handle src update on hover event
    $('.no-touch img.hover').hoverSrc()

    ###
    # Handle pulldown
    $('.pulldown').pulldown()

    # Add backToTop anchor when half a screen  is scrolled
    $('body').append('<a id="backToTop" href="#">Back to top</a>')
    $('#backToTop').backToTop($(window).height()/2)

    # Refresh scroll offset of backToTop button appearance
    $(window).bind('resize', ->
      $('#backToTop').backToTop($(window).height()/2)
    )
    ###
  )
)
