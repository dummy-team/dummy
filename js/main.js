(function() {
  $(function() {
    return $(window).ready(function() {
      $(".no-touch img.hover").hoverSrc();
      if (!Modernizr.input.placeholder) {
        return $("input").each(function() {
          if ($(this).attr("placeholder") !== "") {
            return $(this).placeholder();
          }
        });
      }

      /*
      
       * Add backToTop anchor when half a screen  is scrolled
      $('body').append('<a id="backToTop" href="#">Back to top</a>')
      $('#backToTop').backToTop($(window).height()/2)
      
       * Handle pulldown
      $('.pulldown').pulldown()
      
       * Refresh scroll offset of backToTop button appearance
      $(window).bind 'resize', ->
        $('#backToTop').backToTop($(window).height()/2)
       */
    });
  });

}).call(this);

//# sourceMappingURL=main.js.map
