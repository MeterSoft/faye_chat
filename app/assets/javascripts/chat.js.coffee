$ ->
  $(document).on 'click', '.form_btn_js', ->
    url = $('.form_js').attr('action')
    type = $('.form_js').attr('method')
    data = $('.form_js').serialize()

    $.ajax
      url: url
      type: type
      data: data
      dataType: 'json'
      success: (data) ->
        $('#message_text').val('')