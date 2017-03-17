$(document).on('turbolinks:load', function () {
  $('.sendButton').prop('disabled', true);
  $('.nameCategoryTag').keyup(function(){
    $('.sendButton').prop('disabled', this.value == "" ? true : false);
  });
});