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

  $('#submit_search').bind('click', function() {
    $('#search_results').html('');
    $('#show_more').hide();
    $('#offset').val(0);
  });


  $('#search_form input').bind('change keyup', function() {
    $('#search_results').html('');
    $('#show_more').hide();
    $('#offset').val(0);
  });

  $('#lang').autocomplete({
    source: function( request, response ) {
      $.get('/languages/match_names', {name: request.term}, function(data){
        response(data);
      });            
    },
    change: update_result_count,
    select: update_result_count
  });

  $('#search_form input').bind('change', function() {
    update_result_count();
  });

  $('#price').bind('keyup', function() {
    update_result_count();
  });

  function update_result_count() {
    $.post('/search/get_count', $('#search_form').serialize(), function(data) {
      label = $('#submit_search').val();
      $('#submit_search').val(label.replace(label.slice(label.indexOf(' (') + 2), data + ')'));
      $('#result_count').val(data);
    });
  }

  $('#who_teacher').change();

  $('#search_form').bind('ajax:success', function(data, response, xhr) {
    $('#search_results').append(response);
    if ($('#result_count').val() > $('.person').length) {
      $('#offset').val($('.person').length)
      $('#show_more').show();
    }
    else {
      $('#show_more').hide(); 
    }
  });

  $('#show_more').bind('click', function() {
    $('#search_form').submit()
  });

});