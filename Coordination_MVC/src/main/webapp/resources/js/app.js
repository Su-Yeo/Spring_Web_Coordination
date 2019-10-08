/*Login or Registration Form Submit*/

$("#login_form").submit(function () {

	var sendData = JSON.stringify({id:$('#id').val(), password:$('#password').val()});
	$.ajax({
    	type: "POST",
    	url : "<c:url value='loginCheck />",
    	data: sendData,
    	contentType : "application/json; charset=UTF-8",
    	dataType: "json",
    	success : function(data) {
    			location.href="<c:url value='/'/>";
    	},
    	error : function(e) {
    			alert('Error!!!');
    	}
    });
});

/*
$("#login_form").submit(function (e) {
    e.preventDefault();
    var obj = $(this), action = obj.attr('name'); Define variables
    var sendData = JSON.stringify({id:$('#id').val(), password:$('#password').val()});
    $.ajax({
    	type: "POST",
    	url : "<c:url value='loginCheck />",
    	data: sendData,
    	dataType: "json",
    	contentType:"application/json;charset=UTF-8",
    	async: true,
    	success : function(data) {
    			console.log(data)
    	},
    	error : function(data) {
    			$("#"+action+" #display_error").show().html(JSON.error);
    	}
       
    });
});

$("#login_form").submit(function (e) {
    e.preventDefault();
    var obj = $(this), action = obj.attr('name');
    $.ajax({
        type: "POST",
        url: e.target.action,
        data: obj.serialize()+"&Action="+action,
        cache: false,
        success: function (JSON) {
            if (JSON.error != '') {
                $("#"+action+" #display_error").show().html(JSON.error);
            } else {
                window.location.href = "/";
            }
        }
    });
});
*/

