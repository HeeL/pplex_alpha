$(document).ready(function(){
  
  $("#edit_form").bind('ajax:error', function(data, status, xhr) {
    show_message('Status: ' + status.status + '\n' + status.statusText, 'Error', 'error');
  });
  $("#edit_form").bind('ajax:success', function(data, response, xhr) {
    if (response == 'false') {
      show_message("Sorry, we've tried to save it and failed", 'Error', 'error');
    }
    else {
      show_message('Success', 'Profile updated');
    }
  });

});