function verifyInterview(){
	var error = false;
	$('#overlay_scheduler #name').attr("class", "");
	$('#overlay_scheduler #interview_datepicker').attr("class", "");

	if($('#overlay_scheduler #name').val() == ""){
		error = true
		$('#overlay_scheduler #name').attr("class", "error");
	}

	if($('#overlay_scheduler #interview_datepicker').val() == ""){
		error = true
		$('#overlay_scheduler #interview_datepicker').attr("class", "error");
	}

	if(error){
		$.post("interviews/error");

	}
	else{
	 $.post('interviews/create?name=' + encodeURIComponent($('#overlay_scheduler #name').val()) + '&date=' + encodeURIComponent($('#overlay_scheduler #interview_datepicker').val()) + '&candidate[position]=' + encodeURIComponent($('#candidate_position').val()));
	 $('#overlay_scheduler').hide();
		$('#overlay_scheduler').html("");
	}
}
