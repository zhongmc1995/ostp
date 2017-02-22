/**
 * 
 */
function toTZ(url){
	var toPageValue = document.getElementById("toGoPage").value;
	if(toPageValue == ''){toPageValue=1;return;}
	if(isNaN(Number(toPageValue))){toPageValue=1;return;}
	this.href=url+"?page="+toPageValue;
	window.location = this.href;
	}
