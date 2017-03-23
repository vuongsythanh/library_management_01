$(document).on('turbolinks:load', function() {
  $('body').on('click', '.btn-show-publisher', function(e) {
    e.preventDefault();
    $('#modal_edit_pub_label').hide();
    $("#modal_edit_pub_label").html('<b>Publishers information</b>').show();
    $('.publisher-modal-edit').fadeIn('slow');

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
