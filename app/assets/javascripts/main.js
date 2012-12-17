function show_message(text, title, type) {
  if(typeof(title)==='undefined') title = '';
  if(typeof(type)==='undefined') type = '';

  $.pnotify( {type: type, title: title, text: text} );
}

$(document).ready(function(){
  $('#signup_link').bind('click', function(){
    $('#signup_block').toggle('inline');
  });
});
//#teacher_link'

//$('.signup_methods').is(':visible')