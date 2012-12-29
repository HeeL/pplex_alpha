function show_message(text, title, type) {
  if(typeof(title)==='undefined') title = '';
  if(typeof(type)==='undefined') type = '';

  $.pnotify( {type: type, title: title, text: text} );
}

function show_hide(el, show) {
  show ? el.fadeIn() : el.fadeOut()
}

$(document).ready(function(){
  $('#signup_link').bind('click', function(){
    $('#signup_block').toggle('inline');
  });
});
