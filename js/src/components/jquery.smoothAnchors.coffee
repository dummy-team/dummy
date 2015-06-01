# Add an automatic smooth Scroll to any child link matching ** a[href*='#c'] **
# Require [scrollTo plugin](https://github.com/flesler/jquery.scrollTo)
#
# @param offsetTop [Integer]
# @param screenOffset [Integer]
#
# @return the jQuery object to allow chaining
#
$.fn.smoothAnchors = (offsetTop, screenOffset) ->

  $this = $(this)
  $anchors = $this.find('a[href*=\'#c\']')
  anchorsOffsets = []
  offsetTop ?= 50
  screenOffset = (if screenOffset then screenOffset else $(window).height() / 6)

  $anchors.each ->
    anchorsOffsets.push $(('#' + getHash($this.attr('href')))).offset().top

  anchorsOffsetsLength = anchorsOffsets.length
  $anchors.unbind 'click'
  $anchors.click (e) ->
    e.preventDefault()
    $('html').scrollTo $(('#' + getHash($this.attr('href')))),
      offset:
        top: -offsetTop

      duration: 800

  timeWindow = 500
  lastExecution = new Date((new Date()).getTime())

  $(window).scroll (e) ->
    if (lastExecution.getTime() + timeWindow) <= (new Date()).getTime()
      scrollTop = $(window).scrollTop() + offsetTop + screenOffset
      $anchors.removeClass 'active'
      i = 0

      while i < anchorsOffsetsLength
        j = i + 1
        if scrollTop >= anchorsOffsets[i] and not anchorsOffsets[j]
          $anchors.not($anchors[i]).removeClass 'active'
          $($anchors[i]).addClass 'active'
          lastExecution = new Date((new Date()).getTime())
          return
        else if scrollTop >= anchorsOffsets[i] and scrollTop < anchorsOffsets[j]
          $anchors.not($anchors[i]).removeClass 'active'
          $($anchors[i]).addClass 'active'
          lastExecution = new Date((new Date()).getTime())
          return
        i++

  # Extract a hash from a string
  getHash = (url) ->
    return url?.substring(url.indexOf('#') + 1)

  return $this
