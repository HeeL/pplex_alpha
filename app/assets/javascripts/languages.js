$(document).ready(function() {
  $('#lang').bind('keyup', function() {
    $.get('/languages/match_names.json', {name: $(this).val()}, function(data){
      $(data).each(function(i, lang){
        console.log(lang.name);
      });
    });
  });
});