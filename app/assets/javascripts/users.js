$(document).ready(function(){
  track_remote_messages($('#edit_form, #sign_up_form, #sign_in_form'));

  $('#user_teach').bind('change', function() {
    active = $(this).attr('checked');
    $('#teacher_info input').attr('disabled', !active);
    show_hide($('#teacher_info'), active);
  });
  $('#user_learn').bind('change', function() {
    active = $(this).attr('checked');
    $('#learner_info input').attr('disabled', !active);
    show_hide($('#learner_info'), active)
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
      $.get('/languages/match_names', {name: lang, exact: 1}, function(data){
        if(data.length == 0) {
          $(event.target).tagit('removeTagByLabel', lang);
        }
      });
    }
  });
  
  $('#sign_up_form, #sign_in_form').bind('ajax:success', function(data, response, xhr) {
    if (response.status == 'success') {
      window.location.href = '/profile/edit'
    }
  });
  
});