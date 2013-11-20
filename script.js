(function() {
  (function($) {
    $.fn.placeholder = function() {
      var emptyMe, fullMe;
      emptyMe = function() {
        if ($(this).val() === $(this).data("placeholder")) {
          return $(this).val("");
        }
      };
      fullMe = function() {
        if ($(this).val() === "") {
          return $(this).val($(this).data("placeholder"));
        }
      };
      $(this).data("placeholder", $(this).attr("placeholder"));
      $(this).val(jQuery(this).attr("placeholder"));
      $(this).bind("keypress", emptyMe);
      $(this).bind("click", emptyMe);
      return $(this).blur(fullMe);
    };
    $.fn.hoverSrc = function(on_, off_) {
      var hoverIn, hoverOut, suffixeOff, suffixeOn;
      hoverIn = function() {
        var srcName;
        if (!jQuery(this).hasClass("active")) {
          srcName = jQuery(this).attr("src");
          srcName = srcName.replace(suffixeOff, suffixeOn);
          return jQuery(this).attr({
            src: srcName
          });
        }
      };
      hoverOut = function() {
        var srcName;
        if (!jQuery(this).hasClass("active")) {
          srcName = jQuery(this).attr("src");
          srcName = srcName.replace(suffixeOn, suffixeOff);
          return jQuery(this).attr({
            src: srcName
          });
        }
      };
      suffixeOn = (on_ ? on_ : "-hover");
      suffixeOff = (off_ ? off_ : "-off");
      $(this).hover(hoverIn, hoverOut);
      $(this).focus(hoverIn);
      return $(this).blur(hoverOut);
    };
    $.fn.verticalCenter = function(height) {
      if (height) {
        return $(this).each(function() {
          if (parseFloat($(this).height()) < 1) {
            return this;
          }
          return $(this).css("padding-top", (height - parseFloat($(this).height())) / 2);
        });
      } else {
        return $(this).each(function() {
          if (parseFloat($(this).height()) < 1) {
            return this;
          }
          return $(this).css("padding-top", (parseFloat($(this).parent().height()) - parseFloat($(this).height())) / 2);
        });
      }
    };
    $.getHash = function(url) {
      if (url) {
        return url.substring(url.indexOf("#") + 1);
      } else {
        return window.location.hash;
      }
    };
    $.fn.fixToTop = function(gap) {
      var $that, fix, offSet, origin, originOffSet;
      fix = function() {
        if ($(window).scrollTop() > origin) {
          return $that.addClass("fixed").trigger("fixed").next().css("marginTop", offSet + "px");
        } else {
          return $that.removeClass("fixed").trigger("unfixed").next().css("marginTop", originOffSet + "px");
        }
      };
      $that = $(this);
      origin = $that[0].offsetTop;
      originOffSet = parseFloat($that.next().css("marginTop"));
      offSet = parseFloat($that.height()) + parseFloat($that.next().css("marginTop"));
      if (gap) {
        origin = origin + gap;
      }
      fix();
      return $(window).scroll(function() {
        return fix();
      });
    };
    return $.fn.smoothAnchors = function(offsetTop, screenOffset) {
      var $anchors, anchorsOffsets, anchorsOffsetsLength;
      $anchors = $(this).find("a[href*=\"#c\"]");
      anchorsOffsets = [];
      offsetTop = (offsetTop ? offsetTop : 50);
      screenOffset = (screenOffset ? screenOffset : $(window).height() / 6);
      $anchors.each(function() {
        var byID, byName, target;
        byID = $("#" + $.getHash($(this).attr("href")));
        byName = $("[name=\"" + $.getHash($(this).attr("href")) + "\"]");
        target = void 0;
        if (byID.index() !== "-1") {
          target = byID;
        } else {
          target = byName;
        }
        if (target.index() !== "-1") {
          return anchorsOffsets.push(target.offset().top - screenOffset);
        } else {
          return anchorsOffsets.push(0);
        }
      });
      anchorsOffsetsLength = anchorsOffsets.length;
      $anchors.click(function(e) {
        var byID, byName, target;
        byID = $("#" + $.getHash($(this).attr("href")));
        byName = $("[name=\"" + $.getHash($(this).attr("href")) + "\"]");
        target = void 0;
        if (byID.index() !== "-1") {
          target = byID;
        } else {
          target = byName;
        }
        if (target.index() !== "-1") {
          e.preventDefault();
          return $("html").scrollTo(target, {
            offset: {
              top: offsetTop
            },
            duration: 800
          });
        }
      });
      return $(window).scroll(function(e) {
        var i, j, scrollTop;
        scrollTop = $(window).scrollTop() + offsetTop;
        $anchors.removeClass("active");
        i = 0;
        while (i < anchorsOffsetsLength) {
          j = i + 1;
          if (scrollTop >= anchorsOffsets[i] && !anchorsOffsets[j]) {
            $anchors.not($anchors[i]).removeClass("active");
            $($anchors[i]).addClass("active");
            return;
          } else if (scrollTop >= anchorsOffsets[i] && scrollTop < anchorsOffsets[j]) {
            $anchors.not($anchors[i]).removeClass("active");
            $($anchors[i]).addClass("active");
            return;
          }
          i++;
        }
      });
    };
  })(jQuery);

  (function($) {
    return $(document).ready(function() {
      $("img.hover").hoverSrc();
      if (!Modernizr.input.placeholder) {
        $("input").each(function() {
          if ($(this).attr("placeholder") !== "") {
            return $(this).placeholder();
          }
        });
      }
      jQuery("#mainNav").in_jMenu(null, {
        $toggleBtn: jQuery("<a href=\"javascript:;\" class=\"in_jMenu-toggleBtn\"></a>"),
        userInterfaces: {
          smallscreen: "jQuery('#header').after($(this).parent());",
          desktop: "jQuery('#header .page').append($(this).parent());",
          toggleBtn: "jQuery('#logo').after(o.$toggleBtn);"
        },
        columnsTemplate: []
      });
      jQuery(window).resize(function() {
        if (jQuery(window).width() <= 660) {
          jQuery("#mainNav").find("br").replaceWith("&nbsp;");
          return jQuery("#mainNav").in_jMenu("setUI", {
            UI: "smallscreen"
          });
        } else {
          jQuery("#mainNav li a").each(function() {
            return jQuery(this).html(jQuery(this).html().replace("&nbsp;", "<br />"));
          });
          return jQuery("#mainNav").in_jMenu("setUI", {
            UI: "desktop"
          });
        }
      });
      return jQuery(window).trigger("resize");
    });
  })(jQuery);

}).call(this);

/*
//@ sourceMappingURL=script.js.map
*/