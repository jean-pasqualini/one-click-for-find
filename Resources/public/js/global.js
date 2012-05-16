/**
 * @author john
 */
 
$(document).ready(function() {
 	
            var availableTags = [
                "ActionScript",
                "AppleScript",
                "Asp",
                "BASIC",
                "C",
                "C++",
                "Clojure",
                "COBOL",
                "ColdFusion",
                "Erlang",
                "Fortran",
                "Groovy",
                "Haskell",
                "Java",
                "JavaScript",
                "Lisp",
                "Perl",
                "PHP",
                "Python",
                "Ruby",
                "Scala",
                "Scheme"
            ];
            
            $('input[type=text].tag').each(function(index, input) {
            	$(input)
            	.wrap("<div class='tag ui-input-text ui-body-b ui-corner-all ui-shadow-inset'>")
            	.parent()
            	.prepend("<ul>");
            });
            
            $("input[type=text].tag")
            .die()
            .autocomplete({
            	source: availableTags
            });
            
            $("input[type=text].tag").keyup(function(event) {
            	            	
            	if(event.keyCode == 32 && $(this).val() != "")
				{
            		var data = $.ajax($(this).attr("world-update"),
            		 {
            			type : "POST",
            			context : this,
            			data : { "world" : $(this).val()},
            			dataType : "json",
            			success : function(data) {
            				//console.log(data);
	            			if(data.etat)
	            			{
			            		$(this).parent("div.tag")
			            		.children("ul")
			            		.append("<li>" + $(this).val() + "<a href='#'><img src='http://home.deds.nl/~nokiidevries/images/delete.gif'></a></li>")
			            		
			            		
			            		$($(this).attr("select-target"))
			            		.append(
			            			$("<option>")
			            			.attr("selected", "selected")
			            			.attr("value", data.data.id)
			            			.html($(this).val())
			            		);
			            		
			            		$(this).val("");
			            	}
			            	else
			            	{
			            		alert(data.message);
			            	}
            			}
            		 });            		            	
            	}
            	else if(event.keyCode == 8)
            	{
            		if($(this).val() == "")
            		{
            			$(this).parent("div.tag")
            			.children("ul")
            			.children("li:last-child")
            			.remove();
            			
            			$(this).parent("div.tag")
            			.children("select")
            			.children("option:last-child")
            			.remove();
            		}
            	}
            	
            	return false;
            });
});
