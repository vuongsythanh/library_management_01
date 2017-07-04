$(document).on('turbolinks:load', function() {
  $('body').on('click', '.btn-edit-user', function(e) {
    e.preventDefault();
    $('.user-modal-edit').css('display', 'block')
    $.ajax({
      dataType: 'html',
      url: $(this).attr('href'),
      method: 'get',
      success: function(data) {
        $('.modal-body-user-edit').html(data);
      }
    });
    return false
  });

  $('button[data-dismiss="modal"]').click(function(){
    $('.user-modal-edit').css('display', 'none');
  });
});
