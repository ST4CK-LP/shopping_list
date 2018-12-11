function allowDrop(ev) {
	ev.preventDefault();
}

function drag(ev) {
	ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
	ev.preventDefault();
	var data = ev.dataTransfer.getData("text");
	var div = document.getElementById(data);
	var target = document.getElementById("shopping-list");
	clone = div.cloneNode(true);
	target.appendChild(clone);
}
