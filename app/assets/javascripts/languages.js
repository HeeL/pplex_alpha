$(document).ready(function(){
  
  $('#lang').bind('keyup', function() {
    $.get('/languages/match_names', {name: $(this).val()}, function(data){
      $('#matched_names').html(data)
    });
  });

});