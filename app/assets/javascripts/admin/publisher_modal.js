$(document).on('turbolinks:load', function() {
  $('body').on('click', '.btn-edit-publisher', function(e) {
    e.preventDefault();
    $('.publisher-modal-edit').css('display', 'block')
    $.ajax({
      dataType: 'html',
      url: $(this).attr('href'),
      method: 'get',
      success: function(data) {
        $('.modal-body-publisher-edit').html(data);
      }
    });
    return false
  });

  $('button[data-dismiss="modal"]').click(function(){
    $('.publisher-modal-edit').css('display', 'none');
  });
});
