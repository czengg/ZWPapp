var show = true

function clicked(e) {
	console.log("here");
	if ( show == true) {
		console.log("in");
		document.getElementById(
			e.getAttribute("data-section")).className += "hide";
		show = false;
	}
	else {
		console.log("out");
		document.getElementById(
			e.getAttribute("data-section")).className =
   			document.getElementById(
   			e.getAttribute("data-section")).className.replace
      		( /(?:^|\s)hide(?!\S)/g , '' );
		show = true;
	}
}