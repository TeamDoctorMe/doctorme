
$ ->
  $('.symptom-tier a').click (e) ->
    e.preventDefault()

    ids   = $(this).data('children')
    $(this).addClass('active')
    
    if (ids.length == 0)
      id = $(this).parent('li').attr('id')
      $('#patient_case_symptom_id').val(id)
    else
      $.each ids, (index, value) ->
        $('#' + value + '.symptom-tier').show()

  $('.toggleable').click (e) ->
    e.preventDefault()

    toggleable = $(this).data('toggleable')

    $(toggleable).slideToggle()
