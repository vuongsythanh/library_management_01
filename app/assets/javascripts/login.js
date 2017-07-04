$(document).ready(function() {
  $('#login-box').bind('ajax:success', function(e, data, status, xhr) {
    if (data.error) {
      $('#login-error').addClass('alert alert-danger').html(data.message);
      $('#login-error').fadeTo(2000, 500).slideUp(500);
    } else {
      location.reload();
    }
  });

  $('#create-box').bind('ajax:success', function(e, data, status, xhr) {
    if (data.error) {
      $('#create-error').addClass('alert alert-danger').empty();
      for (var i = 0; i < data.message.length; i++){
        $('#create-error').append('<p>'+ data.message[i] + '</p>');
      }
      $('#create-error').fadeTo(2000, 500).slideUp(500);
    } else {
      location.reload();
    }
  });
});

