//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function() {
	
	$(document).on("change", ".time-slots-date", function() {
		var catId = $(this).attr("data-cat-id");

		$.get("/cats/" + catId + "/open_slots/" + $(this).val()).done(function(html) {
			$(".time-slot-select").html(html);
		});
	});

});