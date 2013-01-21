$(document).ready(function(){

  $('#amount').bind('keyup', function() {
    rub_hint = ''
    disabled = true
    rub_amount = $('#amount').val() * 30;
    if (rub_amount > 0 && rub_amount < 300000) {
      rub_hint = '~ ' + rub_amount + ' RUB';
      disabled = false
    }
    $('#rub_amount').html(rub_hint);
    $('#add_balance_btn').attr('disabled', disabled);
  });
  $('#amount').keyup();

});