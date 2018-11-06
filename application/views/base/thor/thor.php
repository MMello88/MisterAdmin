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

    echo "
    <div class='container'>
      <div class='row mb-5' id='tabela_input'>
      </div>
      <div class='row mb-5'>
        <button onclick='myFunction()' class='btn btn-warning'>Copy text</button>
        <textarea id='myTextAreaScript' rows='150' cols='100'></textarea>
      </div>
      <div class='row mb-5' id='script_gerados'>
      </div>
    <div>
    ";
    
?>

<script>

function myFunction() {
  var copyText = document.getElementById("myTextAreaScript");
  copyText.select();
  document.execCommand("copy");
}

$(document).on('change', '#thor_tabela', function(e){
    var url_post = "<?= base_url("MisterThor/get_input_tabela_colunas"); ?>";
    $("#myTextAreaScript").val("");
    $("#script_gerados").html("");

    $.ajax({
      type: "POST",
      url: url_post,
      data: {'tabela' : this.value, 'echo' : 'true'},
      success: function(data){
        $("#tabela_input").html("");
        $("#tabela_input").html(data);
      },
      error: function(data) {
       $("#tabela_input").html(data);
      }
    });

    e.preventDefault();
});

$(document).on('submit', 'form#enviar_tabela_coluna', function(e){
  var dados = $(this).serialize();
  var url_post = this.action;

  $.ajax({
    type: "POST",
    url: url_post,
    data: dados,
    success: function(data){
      $("#script_gerados").html("");
      $("#script_gerados").html(data);
    },
    error: function(data) {
     $("#script_gerados").html(data);
    }
  });

  var url_post = "<?= base_url("MisterThor/get_script"); ?>";
  
  $.ajax({
    type: "POST",
    url: url_post,
    data: dados,
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