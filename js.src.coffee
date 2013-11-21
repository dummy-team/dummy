$ ->
  # ## getHash
  $.getHash = (url) ->

    # return the HashTag of the given url : parameter or current
    (if url then url.substring(url.indexOf("#") + 1) else window.location.hash)


  # ## placeholder
  # Must only be called for browser not supporting placeholder attribute
  $.fn.placeholder = ->

    # Store placeholder value and fill the input

    # empty the previous value on focus

    # reset the value if nothing is found in the input on blur
    emptyMe = ->
      $(this).data "placeholder", $(this).val()
      $(this).val ""
    fullMe = ->
      $(this).val $(this).data("placeholder")  if $(this).val() is ""
    $(this).data "placeholder", $(this).attr("placeholder")
    $(this).val jQuery(this).attr("placeholder")
    $(this).focus emptyMe
    $(this).blur fullMe
    return $(this)


  # ## hoverSrc
  # Emulate a hover state for images
  $.fn.hoverSrc = (on_, off_) ->
    console.log "bim"
    # Use hover / off suffixes or those given

    # bind events

    # Add the on suffixe to the image name
    hoverIn = ->
      unless $(this).hasClass("active")
        srcName = $(this).attr("src")
        srcName = srcName.replace(suffixeOff, suffixeOn)
        $(this).attr src: srcName

    # Add the off suffixe to the image name
    hoverOut = ->
      unless $(this).hasClass("active")
        srcName = $(this).attr("src")
        srcName = srcName.replace(suffixeOn, suffixeOff)
        $(this).attr src: srcName
    suffixeOn = (if on_ then on_ else "-hover")
    suffixeOff = (if off_ then off_ else "-off")
    $(this).each ->
      $(this).bind "focus mouseenter", hoverIn
      $(this).bind "blur mouseleave", hoverOut
      (new Image()).src = $(this).attr("src").replace("-off", "-hover")

    return $(this)


  # ## fixToTop
  # fix any element to the top when scroll pass it
  $.fn.fixToTop = (gap) ->
    fix = ->
      unless $that.hasClass("fixed")
        offSet = parseFloat($that.height()) + parseFloat($that.next().css("marginTop"))
        $that.addClass "fixed"
        $that.next().css "marginTop", offSet + "px"
    free = ->
      $that.removeClass "fixed"
      $that.next().css "marginTop", originOffSet + "px"
    $that = $(this)
    origin = (if gap then $that[0].offsetTop + gap else $that[0].offsetTop)
    originOffSet = parseFloat($that.next().css("marginTop"))
    offSet = parseFloat($that.height()) + parseFloat($that.next().css("marginTop"))
    $(window).scroll ->
      if $that.css("visibility") isnt "hidden" and $(window).scrollTop() > origin
        fix()
      else
        free()

    return $(this)


  # ##Pulldown
  # Show/Hide content of pulldown element on click on the first child (button) of each elements
  # Use css to do the toggle.
  $.fn.pulldown = ->

    # initialize
    $list = $(this)
    $items = $list.children()
    $buttons = $items.find("> *:first-child")
    $items.addClass "close"
    $buttons.addClass "pulldownButton"
    $buttons.unbind " click"
    $buttons.bind "click", (e) ->
      e.preventDefault()


    # Add class to hide non-button elements
    $items.children().not($buttons).addClass "pulldownContent"
    $items.data "state", 0

    # bind click and focus event
    $items.bind "click", (e) ->
      e.preventDefault()
      $item = $(this)
      if $item.data("state")

        # close
        $item.data("state", 0).addClass "close"
      else

        # open
        $item.data("state", 1).removeClass "close"
        $items.not($item).data("state", 0).addClass "close"

    $list.data "pulldown", 1
    return $(this)


  # ## backToTop
  # display / hide a *back to top* button when scrolling under the gap
  $.fn.backToTop = (gap) ->
    $that = $(this)
    gap = (if gap then gap else 0)
    $(this).unbind "click"
    $(this).bind "click", (e) ->
      e.preventDefault()
      $("html").scrollTo 0,
        duration: 800


    $(this).unbind "backToTop.scroll"
    $(this).bind "backToTop.scroll", ->
      if $(window).scrollTop() >= gap
        $that.fadeIn()
      else
        $that.fadeOut()


    # if backToTop isn't initiated we trigger a scroll event on the element
    unless $(this).data("backToTop")
      $(window).scroll ->
        $that.trigger "backToTop.scroll"

    $(this).data "backToTop", 1
    return $(this)


  # ## smoothAnchors
  # Add an automatic smooth Scroll to the section menu of typo3 or any child link matching ** a[href*="#c"] **
  $.fn.smoothAnchors = (offsetTop, screenOffset) ->
    $anchors = $(this).find("a[href*=\"#c\"]")
    anchorsOffsets = []
    offsetTop = (if offsetTop then offsetTop else 50)
    screenOffset = (if screenOffset then screenOffset else $(window).height() / 6)
    $anchors.each ->
      anchorsOffsets.push $(("#" + $.getHash($(this).attr("href")))).offset().top

    anchorsOffsetsLength = anchorsOffsets.length
    $anchors.unbind "click"
    $anchors.click (e) ->
      e.preventDefault()
      $("html").scrollTo $(("#" + $.getHash($(this).attr("href")))),
        offset:
          top: -offsetTop

        duration: 800


    timeWindow = 500
    lastExecution = new Date((new Date()).getTime())
    $(window).scroll (e) ->
      if (lastExecution.getTime() + timeWindow) <= (new Date()).getTime()
        scrollTop = $(window).scrollTop() + offsetTop + screenOffset
        $anchors.removeClass "active"
        i = 0

        while i < anchorsOffsetsLength
          j = i + 1
          if scrollTop >= anchorsOffsets[i] and not anchorsOffsets[j]
            $anchors.not($anchors[i]).removeClass "active"
            $($anchors[i]).addClass "active"
            lastExecution = new Date((new Date()).getTime())
            return
          else if scrollTop >= anchorsOffsets[i] and scrollTop < anchorsOffsets[j]
            $anchors.not($anchors[i]).removeClass "active"
            $($anchors[i]).addClass "active"
            lastExecution = new Date((new Date()).getTime())
            return
          i++

    return $(this)
$ ->
  $(window).ready ->

    # ## Handle src update on hover event
    $(".no-touch img.hover").hoverSrc()

    # ## Enable placeholder management for updated browsers
    unless Modernizr.input.placeholder
      $("input").each ->
        $(this).placeholder()  unless $(this).attr("placeholder") is ""



    # ## Add backToTop anchor when half a screen  is scrolled
    # $('body').append('<a id="backToTop" href="#">Back to top</a>');
    # $('#backToTop').backToTop($(window).height()/2);

    # ## Handle pulldown
    # $('.pulldown').pulldown();

    # ## Refresh scroll offset of backToTop button appearance
    # $(window).bind('resize', function(){
    #     $('#backToTop').backToTop($(window).height()/2);
    # });
