$(document).on('turbolinks:load', function () {

  $(".picklist").on('mousedown mouseup', '.clickable',function(event) {
    if (event.type=='mouseup') {
      $(this).removeClass('dragdrop');
    } else {
      $(this).addClass("dragdrop").siblings().removeClass('dragdrop');
    }
  });

  $('#tagsortablelists').find('ul.sortabletag').sortable({
    connectWith: 'ul.sortabletag'
  });

  $('#categorysortablelists').find('ul.sortablecategory').sortable({
    connectWith: 'ul.sortablecategory'
  });

  $( ".item_categories_tags" ).sortable({
    receive: function(event, ui) {
      var categoryTagId = ui.item.data('id');
      var draggableDataType = ui.item.data('type');

      var params = {
          dataType: 'json',
          type: "POST",
          success: function () {
            console.log('great success');
            return true
          }
      };
      if (draggableDataType == "Tag") {
          params.url = "/taggings";
          params.data = {tagging: {tag_id: categoryTagId, taggable_id: $("#item_name").data('id'), taggable_type: $("#item_name").data('type') }};
      } else {
          params.url = "/categorizes";
          params.data = {categorize: {category_id: categoryTagId, categorizable_id: $("#item_name").data('id'),  categorizable_type: $("#item_name").data('type') }};
      }
      $.ajax(params);
    },
    remove: function(event, ui) {
      var categoryTagId = ui.item.data('id');
      var draggableDataType = ui.item.data('type');

      var params = {
          dataType: 'json',
          type: "DELETE",
          success: function () {
            console.log('great success');
            return true
          }
      };
      if (draggableDataType == "Tag") {
          params.url = "/taggings/"+categoryTagId;
          params.data = {item_id: $("#item_name").data('id'), tagging: {tag_id: categoryTagId, taggable_id: $("#item_name").data('id'), taggable_type: $("#item_name").data('type') }};
      } else {
          params.url = "/categorizes/"+categoryTagId;
          params.data = {item_id: $("#item_name").data('id'), categorize: {category_id: categoryTagId, categorizable_id: $("#item_name").data('id'), categorizable_type: $("#item_name").data('type') }};
      }
      $.ajax(params);
    },
  });

});