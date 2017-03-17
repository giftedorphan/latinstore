$(document).on('turbolinks:load', function () {
  $('.EditNameCategoryTag').editable({
        error: function(response, newValue) {
          var error_msgs = []
          $.each(response.responseJSON, function(key, value){
            error_msgs.push(key+' '+value);
          })
          return error_msgs.join("; ");
        }
  })
});