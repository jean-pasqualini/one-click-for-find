/**
 * @author john
 */
$(document).ready(function() {
	$("input#search-objet").bind("keyup change webkitspeechchange",function() {
		$.ajax($(this).attr("actionSearch"), {
			type: "POST",
			data: { literalQuery : $(this).val() },
			success: function(data)
			{
				$("ul.list-objets").html(data).listview('refresh');;
			}
		});
	});
});
