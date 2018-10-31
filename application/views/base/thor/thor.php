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
	form_dropdown('tabela', $all_tables, "", "id='thor_tabela' class='form-control mr-2'") .
	"</div>" .
    form_close(); 

    echo "<br/>";
    echo "<button onclick='myFunction()' class='btn btn-warning'>Copy text</button>";
    echo "<br/>";
    echo "<textarea id='myTextAreaScript' rows='150' cols='100'></textarea>";
    
?>

<script>

function myFunction() {
  var copyText = document.getElementById("myTextAreaScript");
  copyText.select();
  document.execCommand("copy");
}

$(document).on('change', '#thor_tabela', function(e){
    var url_post = "<?= base_url("MisterThor/index"); ?>";

    $.ajax({
      type: "POST",
      url: url_post,
      data: {'tabela' : this.value, 'echo' : 'true'},
      success: function(data){
        $("#myTextAreaScript").val("");
        $("#myTextAreaScript").val(data);
      },
      error: function(data) {
       $("#myTextAreaScript").val(data);
      }
    });
    e.preventDefault();
});

</script>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>