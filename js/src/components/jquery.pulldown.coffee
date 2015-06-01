# Show/Hide content of a pulldown element on click on the first child (button) of each elements
# Use css to do the toggle.
#
# @return the jQuery object to allow chaining
#
$.fn.pulldown = ->

  $list = $(this)
  $items = $list.children()
  $buttons = $items.find('> *:first-child')
  $items.addClass 'close'
  $buttons.addClass 'pulldownButton'
  $buttons.unbind ' click'
  $buttons.bind 'click', (e) ->
    e.preventDefault()

  # Add class to hide non-button elements
  $items.children().not($buttons).addClass 'pulldownContent'
  $items.data 'state', 0

  # ### Bind click events
  $items.on 'click', (e) ->
    e.preventDefault()
    $item = $(this)
    if $item.data('state')
      # Close
      $item.data('state', 0).addClass 'close'
    else
      # Open
      $item.data('state', 1).removeClass 'close'
      $items.not($item).data('state', 0).addClass 'close'

  $list.data 'pulldown', 1
  return $(this)
