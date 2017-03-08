$(document).on('turbolinks:load', function() {
  $('body').on('click', '.btn-edit-author', function(e) {
    e.preventDefault();
    $('.author-modal-edit').css('display', 'block')
    $.ajax({
      dataType: 'html',
      url: $(this).attr('href'),
      method: 'get',
      success: function(data) {
        $('.modal-body-author-edit').html(data);
      }
    });
    return false
  });

  $('button[data-dismiss="modal"]').click(function(){
    $('.author-modal-edit').css('display', 'none');
  });
});
