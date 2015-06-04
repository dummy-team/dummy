# Add an automatic smooth Scroll to any child link matching ** a[href*='#'] **
# Require [scrollTo plugin](https://github.com/flesler/jquery.scrollTo)
#
# @param offsetTop [Integer]
# @param screenOffset [Integer]
#
# @return the jQuery object to allow chaining
#
#
$.fn.smoothAnchors = (offsetTop, screenOffset) ->

  $this = $(this)
  $anchors = $this.find('a[href*=\'#\']')
  anchorsOffsets = []
  offsetTop ?= 0
  screenOffset ?= $(window).height() / 6


  $anchors.unbind('click')
  $anchors.click( (e) ->
    e.preventDefault()
    $('html').scrollTo($(('#' + getHash($(this).attr('href')))),
      offset:
        top: -offsetTop
      duration: 800
    )
  )
  $(window).scroll( (e) ->
    scrollTop = $(window).scrollTop() + offsetTop + screenOffset
    $anchors.removeClass('section-active')

    anchorsOffsets = []
    $anchors.each( ->
      anchorsOffsets.push($(('#' + getHash($(this).attr('href')))).offset().top)
    )
    anchorsOffsetsLength = anchorsOffsets.length

    if scrollTop < anchorsOffsets[0]
      $anchors.not($anchors[0]).removeClass('section-active')
      $($anchors[0]).addClass('section-active')
      return

    i = 0
    while i < anchorsOffsetsLength
      j = i + 1
      if scrollTop >= anchorsOffsets[i] and not anchorsOffsets[j]
        $anchors.not($anchors[i]).removeClass('section-active')
        $($anchors[i]).addClass('section-active')
        return
      else if scrollTop >= anchorsOffsets[i] and scrollTop < anchorsOffsets[j]
        $anchors.not($anchors[i]).removeClass('section-active')
        $($anchors[i]).addClass('section-active')
        return
      i++
  )
  return $this

# Extract a hash from a string
getHash = (url) ->
  return url?.substring(url.indexOf('#') + 1)
