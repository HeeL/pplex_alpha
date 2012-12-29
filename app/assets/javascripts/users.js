$(document).ready(function(){
  
  $("#edit_form").bind('ajax:error', function(data, status, xhr) {
    show_message('Status: ' + status.status + '\n' + status.statusText, 'Error', 'error');
  });
  $("#edit_form").bind('ajax:success', function(data, response, xhr) {
    if (response.status == 'error') {
      show_message(response.text, 'Error', 'error');
    }
    else {
      show_message('Profile updated', 'Success');
    }
  });

  $('#user_teach').bind('change', function() {
    show_hide($('#teacher_info'), $(this).attr('checked'))
  });
  $('#user_learn').bind('change', function() {
    show_hide($('#learner_info'), $(this).attr('checked'))
  });
  $('#user_teach, #user_learn').change();
  
  $('#teacher_langs, #learner_langs').tagit({
    allowSpaces: true,
    autocomplete: {
      source: function( request, response ) {
        $.get('/languages/match_names', {name: request.term}, function(data){
          response(data);
        });
      }
    },
    afterTagAdded: function(event, input) {
      lang = input.tag.find('span').html();
      $.get('/languages/match_names', {name: lang}, function(data){
        if(data.length == 0) {
          $(event.target).tagit('removeTagByLabel', lang);
        }
      });
    }
  });
  
});