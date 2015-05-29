require './components/base.coffee'

# Website wide scripts
# @author Inouit
#

$ ->
  $(window).ready ->

    # Handle src update on hover event
    $('.no-touch img.hover').hoverSrc()

    ###

    # Add backToTop anchor when half a screen  is scrolled
    $('body').append('<a id="backToTop" href="#">Back to top</a>')
    $('#backToTop').backToTop($(window).height()/2)

    # Handle pulldown
    $('.pulldown').pulldown()

    # Refresh scroll offset of backToTop button appearance
    $(window).bind 'resize', ->
      $('#backToTop').backToTop($(window).height()/2)

    ###
