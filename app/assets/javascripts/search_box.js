$(function () {

  $('a[href="#search"]').on('click', function(event) {
    event.preventDefault();
    $('#search').addClass('open');
    $('#search > form > input[type="search"]').focus();
    $('nav').addClass('hide');
    $('.card').addClass('hide');
    $('.ptr').addClass('hide');
  });

  $('#search, #search button.close').on('click keyup', function(event) {
    if (event.target.className == 'close' || event.keyCode == 27) {
      $(this).removeClass('open');
      $('nav').removeClass('hide');
      $('.card').removeClass('hide');
      $('.ptr').removeClass('hide');
    }
  });

});