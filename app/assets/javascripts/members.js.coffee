$ ->
  $('.member').bind 'mouseenter', (event) =>
    member = event.target
    $('#tip').html text_summary_for(member)
    $('#tip').show()
    $('.member').bind 'mouseleave', (event) =>
      $('#tip').hide()
text_summary_for = (member) =>
  member.dataset['agency'] + " of " + member.dataset['county'] + " county"
