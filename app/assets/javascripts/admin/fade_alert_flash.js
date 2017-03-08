window.setTimeout(function() {
  $('.alert').fadeTo(500, 0).slideUp(500, function(){
    $(this).remove();
  });

  $('.alert').css(text-align, center);
}, 3000);
