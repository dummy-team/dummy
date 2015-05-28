# A collection of helpers
# @author Inouit
#
# It's an old file which should be rewritten and splitted into several files

$ ->

  # Exctract a hash from a string
  # @param url [String] The url you want the hash extracted from
  # default is the current location
  #
  # @return [String] the Hash of the given url
  $.getHash = (url) ->
    return url?.substring(url.indexOf('#') + 1) || window.location.hash

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
    # Preload images the active image
    (new Image()).src = $this.attr('src').replace(_off, _on)

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

    # Bind events
    $this.each ->
      $this.bind 'focus mouseenter', hoverIn
      $this.bind 'blur mouseleave', hoverOut

    return $this


  # Fix any element to the top when scroll pass it
  # & add optionnal class for each step defined
  # @param gap [Integer]
  # @param steps [Object]
  #
  # @return the jQuery object to allow chaining
  #
  $.fn.fixToTop = (gap, steps) ->

    $this = $(this)
    origin = (if gap then $this[0].offsetTop + gap else $this[0].offsetTop)
    originOffSet = parseFloat($this.next().css('marginTop'))
    offSet = parseFloat($this.height()) + parseFloat($this.next().css('marginTop'))

    ###
      If steps option is found, listen to scroll to set classes for each step
      ```JavaScript
        steps:
          'className': offsetValue
      ```
    ###
    if steps
      stepsClasses = ''
      for step of steps
        stepsClasses += ' ' + step
      $(window).scroll ->
        for step of steps
          if $this.css('visibility') isnt 'hidden' and $(window).scrollTop() > steps[step]
            $this
              .removeClass(stepsClasses)
              .addClass(step)

    # Bind to scroll event
    $(window).scroll ->
      if $this.css('visibility') isnt 'hidden' and $(window).scrollTop() > origin
        fix()
      else
        free()

    # Add the class fixed to the element to handle the position from css
    # and handle an optionnal offset
    fix = ->
      unless $this.hasClass('fixed')
        offSet = parseFloat($this.height()) + parseFloat($this.next().css('marginTop'))
        $this.addClass 'fixed'
        # Set margin to balance the fixed position
        $this.next().css 'marginTop', offSet + 'px'

    # Remove the fixed class and reset offsets
    free = ->
      $this.removeClass 'fixed'
      $this.next().css 'marginTop', originOffSet + 'px'

    return $this


  # Show/Hide content of a pulldown element on click on the first child (button) of each elements
  # Use css to do the toggle.
  #
  # @return the jQuery object to allow chaining
  #
  $.fn.pulldown = ->

    $list = $(this)
    $items = $list.children()
    $buttons = $items.find('> *:first-child')
    $items.addClass 'close'
    $buttons.addClass 'pulldownButton'
    $buttons.unbind ' click'
    $buttons.bind 'click', (e) ->
      e.preventDefault()

    # Add class to hide non-button elements
    $items.children().not($buttons).addClass 'pulldownContent'
    $items.data 'state', 0

    # ### Bind click events
    $items.on 'click', (e) ->
      e.preventDefault()
      $item = $(this)
      if $item.data('state')
        # Close
        $item.data('state', 0).addClass 'close'
      else
        # Open
        $item.data('state', 1).removeClass 'close'
        $items.not($item).data('state', 0).addClass 'close'

    $list.data 'pulldown', 1
    return $(this)


  # Display / hide a *back to top* button when scrolling under the gap
  # Require [scrollTo plugin](https://github.com/flesler/jquery.scrollTo)
  #
  # @param gap [Integer] The amount of scrolled screen needed before showing the anchor
  #
  # @return the jQuery object to allow chaining
  #
  $.fn.backToTop = (gap) ->

    $this = $(this)
    gap ?= 0

    $this.off 'click'
    $this.on 'click', (e) ->
      e.preventDefault()
      $('html').scrollTo 0,
        duration: 800

    $this.off 'backToTop.scroll'
    $this.on 'backToTop.scroll', ->
      if $(window).scrollTop() >= gap
        $this.fadeIn()
      else
        $this.fadeOut()

    # If backToTop isn't initiated we trigger a scroll event on the element
    unless $this.data('backToTop')
      $(window).scroll ->
        $this.trigger 'backToTop.scroll'

    $this.data 'backToTop', 1

    return $this


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
      anchorsOffsets.push $(('#' + $.getHash($this.attr('href')))).offset().top

    anchorsOffsetsLength = anchorsOffsets.length
    $anchors.unbind 'click'
    $anchors.click (e) ->
      e.preventDefault()
      $('html').scrollTo $(('#' + $.getHash($this.attr('href')))),
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

    return $this
