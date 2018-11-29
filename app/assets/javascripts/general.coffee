$ ->
  verify_selection = ->
    if ($('ul.force-selection').length > 0)
      if ($('ul a.active').length > 0)
        $('input.btn-primary').removeClass('disabled')
      else
        $('input.btn-primary').addClass('disabled')

  verify_selection()

  $('.toggleable').click (e) ->
    e.preventDefault()

    toggleable = $(this).data('toggleable')

    $(toggleable).slideToggle()

  $('.symptom-select').click (e) ->
    e.preventDefault()    
    v = $(this).data('symptom')

    $('.symptom-select').removeClass('active')
    $(this).addClass('active')
    $('.symptom-value').val(v)

    verify_selection()
