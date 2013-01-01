$(document).ready(function(){

  $('#who_teacher, #who_learner').bind('change', function(){
    current_label = $('#submit_search').val()
    if($('input[name="who"]:checked').val() == 'teacher') {
      new_label = current_label.replace('Learners', 'Teachers')
    }
    else {
      new_label = current_label.replace('Teachers', 'Learners')
    }
    $('#submit_search').val(new_label)
  });

  $('#search_form input').bind('change', function() {
    $.post('/search/get_count', $('#search_form').serialize(), function(data) {
      label = $('#submit_search').val();
      $('#submit_search').val(label.replace(label.slice(label.indexOf(' (') + 2), data + ')'));
    })
  });

  $('#who_teacher').change();

  $('#search_form').bind('ajax:success', function(data, response, xhr) {
    $('#search_results').html(response);
  });

});