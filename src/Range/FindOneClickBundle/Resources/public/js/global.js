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

    $("input[type=text].tag").tagit({
        autocomplete: {
            delay: 0,
            minLength: 2,
            source : "/app_dev.php/getTagId"
        },
        afterTagAdded: function(event, ui)
        {
            var tag = ui.tagLabel;

            $.get("/app_dev.php/addTag");
        }
    });


});
