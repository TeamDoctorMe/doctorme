
$ ->
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
