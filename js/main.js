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
    });
  });

}).call(this);

/*
//@ sourceMappingURL=main.js.map
*/