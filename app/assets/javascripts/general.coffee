
$ ->
  $('.toggleable').click (e) ->
    e.preventDefault()

    toggleable = $(this).data('toggleable')

    $(toggleable).slideToggle()
