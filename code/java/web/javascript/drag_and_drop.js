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
	clone.children[0].rows[0].cells[0].innerHTML = "<img src=\"/java/images/basket.jpg\" onclick=\"deleteRow(event)\"></img>";
	clone.children[0].rows[0].cells[2].innerHTML = "<input type=\"text\" style=\"width:120px\" placeholder=\"Notes\" aria-label=\"Notes\"></input>";
	target.appendChild(clone);
}
