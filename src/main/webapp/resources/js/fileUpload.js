function uploadChange(file) {
  var name = "";
  
  for (var j =0; j<file.files.length;j++)
  	name += file.files[j].name+"  ";
  document.getElementById('board_image').value=name;
  document.getElementById('board_image_id').innerHTML=name;
}

function deleteImage() {
  document.getElementById('board_image').value="";
  document.getElementById('board_image_id').innerHTML="";
}

function printName() {
	const name = document.getElementById('board_image').value;
	document.getElementById("result").innerText = name;
}