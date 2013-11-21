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
