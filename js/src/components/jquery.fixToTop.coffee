# Fix any element to the top when scroll pass it
# & add optionnal class for each step defined
# @param gap [Integer]
# @param steps [Object]
#
# @return the jQuery object to allow chaining
#
$.fn.fixToTop = (gap, steps) ->

  $this = $(this)
  gap ?= 0
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
    $(window).scroll( ->
      for step of steps
        if $this.css('visibility') isnt 'hidden' and $(window).scrollTop() > steps[step]
          $this
            .removeClass(stepsClasses)
            .addClass(step)
    )
  # Bind to scroll event
  $(window).scroll( ->
    free()
    origin = $this.offset().top + gap
    if $this.css('visibility') isnt 'hidden' and $(window).scrollTop() > origin
      fix()
    else
      free()
  )
  # Add the class fixed to the element to handle the position from css
  # and handle an optionnal offset
  fix = ->
    unless $this.hasClass('fixed')
      offSet = parseFloat($this.height()) + parseFloat($this.next().css('marginTop'))
      $this.addClass('fixed')
      # Set margin to balance the fixed position
      $this.next().css('marginTop', offSet + 'px')

  # Remove the fixed class and reset offsets
  free = ->
    $this.removeClass('fixed')
    $this.next().css('marginTop', originOffSet + 'px')

  return $this
