(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
$.fn.hoverSrc = function(_on, _off, activeClass) {
  var $this, hoverIn, hoverOut;
  $this = $(this);
  if (_on == null) {
    _on = '-hover';
  }
  if (_off == null) {
    _off = '-off';
  }
  if (activeClass == null) {
    activeClass = 'active';
  }
  hoverIn = function() {
    var srcName;
    if (!$this.hasClass(activeClass)) {
      srcName = $this.attr('src');
      srcName = srcName.replace(_off, _on);
      return $this.attr(src, srcName);
    }
  };
  hoverOut = function() {
    var srcName;
    if (!$this.hasClass(activeClass)) {
      srcName = $this.attr('src');
      srcName = srcName.replace(_on, _off);
      return $this.attr(src, srcName);
    }
  };
  $this.each(function() {
    (new Image()).src = $this.attr('src').replace(_off, _on);
    $this.bind('focus mouseenter', hoverIn);
    return $this.bind('blur mouseleave', hoverOut);
  });
  return $this;
};


},{}],2:[function(require,module,exports){
require('./components/jquery.hoverSrc.coffee');

$(function() {
  return $(window).ready(function() {
    return $('.no-touch img.hover').hoverSrc();

    /*
     * Handle pulldown
    $('.pulldown').pulldown()
    
     * Add backToTop anchor when half a screen  is scrolled
    $('body').append('<a id="backToTop" href="#">Back to top</a>')
    $('#backToTop').backToTop($(window).height()/2)
    
     * Refresh scroll offset of backToTop button appearance
    $(window).bind('resize', ->
      $('#backToTop').backToTop($(window).height()/2)
    )
     */
  });
});


},{"./components/jquery.hoverSrc.coffee":1}]},{},[2]);
