$(document).ready(function(){
  
  $('#lang').autocomplete({
    source: function( request, response ) {
      $.get('/languages/match_names', {name: request.term}, function(data){
        response(data);
      });            
    }
  });

});