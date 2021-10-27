
function rememberIdCheck(id) {
	
	var checked = $('#'+id).is(':checked');
	
	if(checked) $('#'+id).val("chk");
	else $('#'+id).val("");
		
	//console.log($('#'+id).val())
}