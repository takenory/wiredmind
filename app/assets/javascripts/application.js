// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function() {
  $("div#core").hide();
  $("div#core").fadeIn();
  $("table.mind").live("mouseover", function() {
    $("table.mind").resizable({
      stop: function(ev, ui) {
        var id = ui.helper.attr("id").split('_')[1];
        var width = ui.size.width;
        var height = ui.size.height;
        $.ajax({
          type: "POST",
          url: "/minds/" + id + "/resize",
          data: "width=" + width + "&height=" + height 
        });
      }
    });
    $("table.mind").draggable({
      stop: function(ev, ui) {
        var id = ui.helper.attr("id").split('_')[1];
        var top = ui.position.top;
        var left = ui.position.left;
        $.ajax({
          type: "POST",
          url: "/minds/" + id + "/move",
          data: "top=" + top + "&left=" + left
        });
      }
    });
  });
});
