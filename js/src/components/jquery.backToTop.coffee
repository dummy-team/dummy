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
