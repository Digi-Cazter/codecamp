function selectRow(row){
	$(".active_row").attr("class", "trigger");
	$(row).attr("class", "active_row trigger");
}

function verifyChallengeSubmit(){
	var error = false;
	$('#challenge_id').attr("class", "");
	$('#challenge_description').attr("class", "");
	$('#challenge_text').attr("class", "");
	$('#editor_text').attr("class", "");
	$('#result_text').attr("class", "");


	if($('#challenge_description').val() == ""){
		error = true
		$('#challenge_description').attr("class", "error");
	}

	if($('#challenge_text').val() == ""){
		error = true
		$('#challenge_text').attr("class", "error");
	}

	if($('#result_text').val() == ""){
		error = true
		$('#result_text').attr("class", "error");
	}

	if(error){
		$.post("challenges/error");
	}
	else{
	 $.post('challenges/create?id=' + encodeURIComponent($('#challenge_id').val()) + '&description=' + encodeURIComponent($('#challenge_description').val()) + '&challenge=' + encodeURIComponent($('#challenge_text').val()) + '&starter_code=' + encodeURIComponent($('#editor_text').val()) + '&test_case=' + encodeURIComponent($('#result_text').val()) )
	}
}
