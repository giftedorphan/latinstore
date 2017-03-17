$(document).ajaxComplete(function(event, request) {
  function show_ajax_message(msg, type) {
    $("#flash_hook").html('<div id="flash_'+type+'">'+msg+'</div>');
    $("#flash_hook").replaceWith("<div id='flash_hook'> <div class='alert alert-" + type + "'> <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button> <div id='flash_"+type+"'>"+ msg +"</div> </div> </div> </div> </div>")
  }

  msg = request.getResponseHeader("X-Message");
  type = request.getResponseHeader("X-Message-Type");
  if(msg !== null) show_ajax_message(msg, type);
});