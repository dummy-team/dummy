(($) ->
  $.fn.placeholder = ->
    emptyMe = ->
      $(this).val ""  if $(this).val() is $(this).data("placeholder")
    fullMe = ->
      $(this).val $(this).data("placeholder")  if $(this).val() is ""
    $(this).data "placeholder", $(this).attr("placeholder")
    $(this).val jQuery(this).attr("placeholder")
    $(this).bind "keypress", emptyMe
    $(this).bind "click", emptyMe
    $(this).blur fullMe

  $.fn.hoverSrc = (on_, off_) ->
    hoverIn = ->
      unless jQuery(this).hasClass("active")
        srcName = jQuery(this).attr("src")
        srcName = srcName.replace(suffixeOff, suffixeOn)
        jQuery(this).attr src: srcName
    hoverOut = ->
      unless jQuery(this).hasClass("active")
        srcName = jQuery(this).attr("src")
        srcName = srcName.replace(suffixeOn, suffixeOff)
        jQuery(this).attr src: srcName
    suffixeOn = (if on_ then on_ else "-hover")
    suffixeOff = (if off_ then off_ else "-off")
    $(this).hover hoverIn, hoverOut
    $(this).focus hoverIn
    $(this).blur hoverOut

  $.fn.verticalCenter = (height) ->
    if height
      $(this).each ->
        return this  if parseFloat($(this).height()) < 1
        $(this).css "padding-top", (height - parseFloat($(this).height())) / 2

    else
      $(this).each ->
        return this  if parseFloat($(this).height()) < 1
        $(this).css "padding-top", (parseFloat($(this).parent().height()) - parseFloat($(this).height())) / 2


  $.getHash = (url) ->
    (if url then url.substring(url.indexOf("#") + 1) else window.location.hash)

  $.fn.fixToTop = (gap) ->
    fix = ->
      if $(window).scrollTop() > origin
        $that.addClass("fixed").trigger("fixed").next().css "marginTop", offSet + "px"
      else
        $that.removeClass("fixed").trigger("unfixed").next().css "marginTop", originOffSet + "px"
    $that = $(this)
    origin = $that[0].offsetTop
    originOffSet = parseFloat($that.next().css("marginTop"))
    offSet = parseFloat($that.height()) + parseFloat($that.next().css("marginTop"))
    origin = origin + gap  if gap
    fix()
    $(window).scroll ->
      fix()


  $.fn.smoothAnchors = (offsetTop, screenOffset) ->
    $anchors = $(this).find("a[href*=\"#c\"]")
    anchorsOffsets = []
    offsetTop = (if offsetTop then offsetTop else 50)
    screenOffset = (if screenOffset then screenOffset else $(window).height() / 6)
    $anchors.each ->
      byID = $(("#" + $.getHash($(this).attr("href"))))
      byName = $("[name=\"" + $.getHash($(this).attr("href")) + "\"]")
      target = undefined
      unless byID.index() is "-1"
        target = byID
      else
        target = byName
      unless target.index() is "-1"
        anchorsOffsets.push target.offset().top - screenOffset
      else
        anchorsOffsets.push 0

    anchorsOffsetsLength = anchorsOffsets.length
    $anchors.click (e) ->
      byID = $(("#" + $.getHash($(this).attr("href"))))
      byName = $("[name=\"" + $.getHash($(this).attr("href")) + "\"]")
      target = undefined
      unless byID.index() is "-1"
        target = byID
      else
        target = byName
      unless target.index() is "-1"
        e.preventDefault()
        $("html").scrollTo target,
          offset:
            top: offsetTop

          duration: 800


    $(window).scroll (e) ->
      scrollTop = $(window).scrollTop() + offsetTop
      $anchors.removeClass "active"
      i = 0

      while i < anchorsOffsetsLength
        j = i + 1
        if scrollTop >= anchorsOffsets[i] and not anchorsOffsets[j]
          $anchors.not($anchors[i]).removeClass "active"
          $($anchors[i]).addClass "active"
          return
        else if scrollTop >= anchorsOffsets[i] and scrollTop < anchorsOffsets[j]
          $anchors.not($anchors[i]).removeClass "active"
          $($anchors[i]).addClass "active"
          return
        i++

) jQuery
(($) ->
  $(document).ready ->

    # handle src update on hover event
    $("img.hover").hoverSrc()

    # enable placeholder management for updated browsers
    unless Modernizr.input.placeholder
      $("input").each ->
        $(this).placeholder()  unless $(this).attr("placeholder") is ""

    jQuery("#mainNav").in_jMenu null,
      $toggleBtn: jQuery("<a href=\"javascript:;\" class=\"in_jMenu-toggleBtn\"></a>")
      userInterfaces:
        smallscreen: "jQuery('#header').after($(this).parent());"
        desktop: "jQuery('#header .page').append($(this).parent());"
        toggleBtn: "jQuery('#logo').after(o.$toggleBtn);"

      columnsTemplate: []

    jQuery(window).resize ->

      # switch UI handler for the main in_menu
      if jQuery(window).width() <= 660
        jQuery("#mainNav").find("br").replaceWith "&nbsp;"

        # jQuery('#mainNav li a').html(jQuery('#mainNav li a').html().replace('&nbsp;','<br />'));
        jQuery("#mainNav").in_jMenu "setUI",
          UI: "smallscreen"

      else
        jQuery("#mainNav li a").each ->
          jQuery(this).html jQuery(this).html().replace("&nbsp;", "<br />")

        jQuery("#mainNav").in_jMenu "setUI",
          UI: "desktop"



    # trigger a resize event to initalize UI handler
    jQuery(window).trigger "resize"

) jQuery