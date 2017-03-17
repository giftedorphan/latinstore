$(document).on('turbolinks:load', function () {
  // Make table rows clickable
  $(".table tbody>tr.clickable").on('click', function(event) {
    var target = $(event.target);
    if (target.is(":not(a)")) {
      window.location = $(this).data("link")
    }
  });
});