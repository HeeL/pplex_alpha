$(document).ready(function(){
  
  $("#edit_form").bind('ajax:error', function(data, status, xhr) {
    show_message('Status: ' + status.status + '\n' + status.statusText, 'Error', 'error');
  });
  $("#edit_form").bind('ajax:success', function(data, response, xhr) {
    if (response == 'false') {
      show_message("Sorry, we've failed to save it", 'Error', 'error');
    }
    else {
      show_message('Success', 'Profile updated');
    }
  });

  $('#teach').bind('change', function() {
    show_hide($('#teacher_info'), $(this).attr('checked'))
  });
  $('#learn').bind('change', function() {
    show_hide($('#learner_info'), $(this).attr('checked'))
  });
  $('#learn, #teach').change();
  
  function show_hide(el, show) {
    show ? el.fadeIn() : el.fadeOut()
  }
  
});