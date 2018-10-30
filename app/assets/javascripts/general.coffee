
$ ->
  $('.symptom-tier').click (e)->
    e.preventDefault()

    ids   = $(this).data('children')
    $(this).addClass('active')
    
    if (ids.length == 0)
      id = $(this).attr('id')
      $('#patient_case_symptom_id').val(id)
    else
      $.each ids, (index, value) ->
        $('#' + value + '.symptom-tier').show()
