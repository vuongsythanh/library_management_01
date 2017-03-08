$.rails.allowAction = function(link){
  if (link.data('confirm') == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}

$.rails.confirmed = function(link){
  link.data('confirm', null);
  link.trigger('click.rails');
}

$.rails.showConfirmationDialog = function(link){
  var message = link.data('confirm');
  swal({
    title: message,
    type: 'warning',
    confirmButtonText: 'Ok. Delete!',
    confirmButtonColor: '#2acbb3',
    cancelButtonText: 'Cancel. Delete!',
    showCancelButton: true
  }).then(function(e){
    $.rails.confirmed(link);
  });
};
