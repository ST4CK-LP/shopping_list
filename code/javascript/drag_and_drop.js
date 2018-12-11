function allowDrop(ev) {
	ev.preventDefault();
}

function drag(ev) {
	ev.dataTransfer.setData("text", ev.target.id);
}

function deleteRow(event) {
	var elem = event.target.parentNode.parentNode.parentNode.parentNode.parentNode;
	elem.remove();
}

function deleteUserRow(event) {
	var elem = event.target.parentNode.parentNode;
	elem.remove();
}

function addUserRow(event) {
	//query
}

function drop(ev) {
	ev.preventDefault();
	var data = ev.dataTransfer.getData("text");
	var div = document.getElementById(data);
	var target = document.getElementById("shopping-list");
	clone = div.cloneNode(true);
	clone.children[0].rows[0].cells[2].innerHTML="<img src=\"../../images/basket.jpg\" style=\"padding-left:100px\" onclick=\"deleteRow(event)\"></img>";
	target.appendChild(clone);
}
