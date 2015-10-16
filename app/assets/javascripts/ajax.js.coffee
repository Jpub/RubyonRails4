init = ->
  $('#ajax_form').on 'ajax:success', (e, data) ->
    $('#result').empty()
    $.each data, ->
      $('#result').append(
        $('<li></li>').append(
          $('<a></a>').attr('href', 'http://www.wings.msn.to/index.php/-/A-03/' + @isbn).append(@title)
        )
      )

  $(document).ajaxStart ->
     $('#progress').html '통신 중...'
   .ajaxComplete ->
     $('#progress').html ''

  $('#slide_search').on 'ajax:success', (e, data) ->
    $('#result').empty()
    $.each data.Slideshows.Slideshow, ->
      $('#result').append(
        $('<li></li>').append(
          $('<a></a>').attr('href', @URL).append("#{@Title}(#{@Description})")
        )
      )


$(document).ready(init)
$(document).on('page:change', init)
