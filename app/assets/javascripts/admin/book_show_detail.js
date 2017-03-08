$(document).on('turbolinks:load', function() {
  $('body').on('click', '.btn-show-book', function(e) {
    e.preventDefault();
    $('#modal_edit_boo_label').hide();
    $('.book-modal-edit').fadeIn('slow');

    $('.book-modal-edit').css('display', 'block')
    $.ajax({
      dataType: 'html',
      url: $(this).attr('href'),
      method: 'get',
      success: function(data) {
        $('.modal-body-book-edit').html(data);
      }
    });
    return false
  });

  $('button[data-dismiss="modal"]').click(function(){
    $('.book-modal-edit').css('display', 'none');
  });
});
