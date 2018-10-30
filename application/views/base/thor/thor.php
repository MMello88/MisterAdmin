                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">

                        	<div class="card">

                                <div class="card-title">
                                    <h4>Formulário Thor</h4>
                                </div>
<?php 
    
	
	echo form_open("MisterThor/index", "class='form-inline'") .
	"<div class='form-group  mb-2'>".
	form_dropdown('tabela', $all_tables, "", "class='form-control mr-2'") .
		"<button type='submit' class='btn btn-primary'>Enviar</button>
		 </div>"
		. form_close(); 
	if(isset($tabela))
		echo "tabela utilizada: " . $tabela;
	echo "<br/>";
	echo "<button onclick='myFunction()' class='btn btn-warning'>Copy text</button>";
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
                                </div>
                            </div>
                        </div>
                    </div>
                </section>