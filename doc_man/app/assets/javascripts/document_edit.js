$('textarea').each(function () {
  this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
}).on('input', function () {
  this.style.height = 'auto';
  this.style.height = (this.scrollHeight) + 'px';
});

$(document).ready(function(){
  $(".category_selector").select2();
});


$("#text_to_edit").keyup(function() {
	var rc_to_send = document.getElementById ( "text_to_edit" ).value;
	if (document.contains(document.getElementById("preview"))) {
            document.getElementById("preview").remove();
	}
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/test",
        data: {
            rc_text: rc_to_send // < note use of 'this' here
        },
        success: function(json) {
          //document.getElementById("demo").className = "panel panel-primary";
        	document.getElementById("demo").innerHTML = json.text;
        	//result = $.parseJSON(json);

        },
        error: function(json) {
            alert('error');
        }
    });
});

