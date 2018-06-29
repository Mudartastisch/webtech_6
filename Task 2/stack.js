function push() {

	var li = document.createElement("li");
	li.textContent = document.control.pushText.value;
	document.getElementsByTagName("ul")[0].appendChild(li);
 }

function pop() {

 	var elem_name = document.getElementsByTagName("ul")[0].lastChild.innerHTML;
	document.getElementsByTagName("ul")[0].lastChild.remove();
	document.control.popText.value = elem_name;
 }

function initialize(){

	var push_new  = document.getElementById('pushButton');
	push_new.addEventListener ('click', push);

	var pop_new  = document.getElementById('popButton');
	pop_new.addEventListener ('click', pop);
}