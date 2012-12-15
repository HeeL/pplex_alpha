function show_message(text, title, type) {
  if(typeof(title)==='undefined') title = '';
  if(typeof(type)==='undefined') type = '';

  $.pnotify( {type: type, title: title, text: text} );
}