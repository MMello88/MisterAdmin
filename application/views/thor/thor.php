<?php 
	echo form_open("MisterThor/index") .
		"<input type='text' name='tabela'>
		<button type='submit'>Enviar</button>"
		. form_close(); 
	echo "tabela utilizada: " . isset($tabela) ? $tabela : "";
	echo "<br/>";
	echo "<button onclick='myFunction()'>Copy text</button>";
	echo "<br/>";
	echo "<textarea id='myInput' rows='150' cols='100'>$script</textarea>";
?>

<script>
function myFunction() {
  var copyText = document.getElementById("myInput");
  copyText.select();
  document.execCommand("copy");
 
}
</script>