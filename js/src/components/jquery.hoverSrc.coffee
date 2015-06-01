# Emulate a hover state for images
#
# @param _on [String] The active suffixe used on [src] attribute
# @param _off [String] The inactive suffixe used on [src] attribute
# @param activeClass [String] The class used to force active state
#
# @return the jQuery object to allow chaining
#
$.fn.hoverSrc = (_on, _off, activeClass) ->
  # Set attributes
  $this = $(this)
  _on ?= '-hover'
  _off ?= '-off'
  activeClass ?= 'active'

  # Add the active suffixe to the image src
  hoverIn = ->
    unless $this.hasClass(activeClass)
      srcName = $this.attr('src')
      srcName = srcName.replace(_off, _on)
      $this.attr src: srcName

  # Add the inactive suffixe to the image src
  hoverOut = ->
    unless $this.hasClass(activeClass)
      srcName = $this.attr('src')
      srcName = srcName.replace(_on, _off)
      $this.attr src: srcName

  $this.each ->
    # Preload images the active image
    (new Image()).src = $this.attr('src').replace(_off, _on)

    # Bind events
    $this.bind 'focus mouseenter', hoverIn
    $this.bind 'blur mouseleave', hoverOut

  return $this
