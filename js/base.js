(function() {
  $(function() {
    $.getHash = function(url) {
      if (url) {
        return url.substring(url.indexOf("#") + 1);
      } else {
        return window.location.hash;
      }
    };

    /* ```javascript
    unless Modernizr.input.placeholder
      $("input").each ->
        $(this).placeholder() unless $(this).attr("placeholder") is ""
    ```
     */
    $.fn.placeholder = function() {
      var emptyMe, fullMe;
      $(this).data("placeholder", $(this).attr("placeholder"));
      $(this).val(jQuery(this).attr("placeholder"));
      emptyMe = function() {
        $(this).data("placeholder", $(this).val());
        return $(this).val("");
      };
      fullMe = function() {
        if ($(this).val() === "") {
          return $(this).val($(this).data("placeholder"));
        }
      };
      $(this).on("focus", emptyMe);
      $(this).on("blur", fullMe);
      return $(this);
    };
    $.fn.hoverSrc = function(on_, off_) {
      var hoverIn, hoverOut, suffixeOff, suffixeOn;
      suffixeOn = (on_ ? on_ : "-hover");
      suffixeOff = (off_ ? off_ : "-off");
      hoverIn = function() {
        var srcName;
        if (!$(this).hasClass("active")) {
          srcName = $(this).attr("src");
          srcName = srcName.replace(suffixeOff, suffixeOn);
          return $(this).attr({
            src: srcName
          });
        }
      };
      hoverOut = function() {
        var srcName;
        if (!$(this).hasClass("active")) {
          srcName = $(this).attr("src");
          srcName = srcName.replace(suffixeOn, suffixeOff);
          return $(this).attr({
            src: srcName
          });
        }
      };
      $(this).each(function() {
        $(this).bind("focus mouseenter", hoverIn);
        $(this).bind("blur mouseleave", hoverOut);
        return (new Image()).src = $(this).attr("src").replace("-off", "-hover");
      });
      return $(this);
    };
    $.fn.fixToTop = function(gap, steps) {
      var $that, fix, free, offSet, origin, originOffSet, step, stepsClasses;
      $that = $(this);
      origin = (gap ? $that[0].offsetTop + gap : $that[0].offsetTop);
      originOffSet = parseFloat($that.next().css("marginTop"));
      offSet = parseFloat($that.height()) + parseFloat($that.next().css("marginTop"));

      /* If steps option is found, listen to scroll to set classes for each step
      ```JavaScript
      steps:
        "className": offsetValue
      
      ```
       */
      if (steps) {
        stepsClasses = "";
        for (step in steps) {
          stepsClasses += ' ' + step;
        }
        $(window).scroll(function() {
          var _results;
          _results = [];
          for (step in steps) {
            if ($that.css("visibility") !== "hidden" && $(window).scrollTop() > steps[step]) {
              _results.push($that.removeClass(stepsClasses).addClass(step));
            } else {
              _results.push(void 0);
            }
          }
          return _results;
        });
      }
      $(window).scroll(function() {
        if ($that.css("visibility") !== "hidden" && $(window).scrollTop() > origin) {
          return fix();
        } else {
          return free();
        }
      });
      fix = function() {
        if (!$that.hasClass("fixed")) {
          offSet = parseFloat($that.height()) + parseFloat($that.next().css("marginTop"));
          $that.addClass("fixed");
          return $that.next().css("marginTop", offSet + "px");
        }
      };
      free = function() {
        $that.removeClass("fixed");
        return $that.next().css("marginTop", originOffSet + "px");
      };
      return $(this);
    };
    $.fn.pulldown = function() {
      var $buttons, $items, $list;
      $list = $(this);
      $items = $list.children();
      $buttons = $items.find("> *:first-child");
      $items.addClass("close");
      $buttons.addClass("pulldownButton");
      $buttons.unbind(" click");
      $buttons.bind("click", function(e) {
        return e.preventDefault();
      });
      $items.children().not($buttons).addClass("pulldownContent");
      $items.data("state", 0);
      $items.on("click", function(e) {
        var $item;
        e.preventDefault();
        $item = $(this);
        if ($item.data("state")) {
          return $item.data("state", 0).addClass("close");
        } else {
          $item.data("state", 1).removeClass("close");
          return $items.not($item).data("state", 0).addClass("close");
        }
      });
      $list.data("pulldown", 1);
      return $(this);
    };
    $.fn.backToTop = function(gap) {
      var $that;
      $that = $(this);
      gap = (gap ? gap : 0);
      $(this).off("click");
      $(this).on("click", function(e) {
        e.preventDefault();
        return $("html").scrollTo(0, {
          duration: 800
        });
      });
      $(this).off("backToTop.scroll");
      $(this).on("backToTop.scroll", function() {
        if ($(window).scrollTop() >= gap) {
          return $that.fadeIn();
        } else {
          return $that.fadeOut();
        }
      });
      if (!$(this).data("backToTop")) {
        $(window).scroll(function() {
          return $that.trigger("backToTop.scroll");
        });
      }
      $(this).data("backToTop", 1);
      return $(this);
    };
    return $.fn.smoothAnchors = function(offsetTop, screenOffset) {
      var $anchors, anchorsOffsets, anchorsOffsetsLength, lastExecution, timeWindow;
      $anchors = $(this).find("a[href*=\"#c\"]");
      anchorsOffsets = [];
      offsetTop = (offsetTop ? offsetTop : 50);
      screenOffset = (screenOffset ? screenOffset : $(window).height() / 6);
      $anchors.each(function() {
        return anchorsOffsets.push($("#" + $.getHash($(this).attr("href"))).offset().top);
      });
      anchorsOffsetsLength = anchorsOffsets.length;
      $anchors.unbind("click");
      $anchors.click(function(e) {
        e.preventDefault();
        return $("html").scrollTo($("#" + $.getHash($(this).attr("href"))), {
          offset: {
            top: -offsetTop
          },
          duration: 800
        });
      });
      timeWindow = 500;
      lastExecution = new Date((new Date()).getTime());
      $(window).scroll(function(e) {
        var i, j, scrollTop;
        if ((lastExecution.getTime() + timeWindow) <= (new Date()).getTime()) {
          scrollTop = $(window).scrollTop() + offsetTop + screenOffset;
          $anchors.removeClass("active");
          i = 0;
          while (i < anchorsOffsetsLength) {
            j = i + 1;
            if (scrollTop >= anchorsOffsets[i] && !anchorsOffsets[j]) {
              $anchors.not($anchors[i]).removeClass("active");
              $($anchors[i]).addClass("active");
              lastExecution = new Date((new Date()).getTime());
              return;
            } else if (scrollTop >= anchorsOffsets[i] && scrollTop < anchorsOffsets[j]) {
              $anchors.not($anchors[i]).removeClass("active");
              $($anchors[i]).addClass("active");
              lastExecution = new Date((new Date()).getTime());
              return;
            }
            i++;
          }
        }
      });
      return $(this);
    };
  });

}).call(this);

//# sourceMappingURL=base.js.map
