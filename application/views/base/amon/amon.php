                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">

                        	<div class="card">

                                <div class="card-title">
                                    <h4>Formulário Thor</h4>
                                </div>
<?php 
	echo form_open("MisterAmon/index", "class='form-inline'") .
	"<div class='form-group  mb-2'>".
    form_dropdown('tabela', $all_tables, "", "id='thor_tabela' class='form-control mr-2'") .
	"</div>" .
    form_close(); 

    echo "
    <div class='container'>
      <div class='row mb-5' id='tabela_input'>
      </div>
      
      <div class='row mb-5' id='script_gerados'>
      </div>
    <div>
    ";    
?>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


<script>
$(document).on('change', '#thor_tabela', function(e){
    var url_post = "<?= base_url("MisterAmon/get_input_tabela_colunas"); ?>";
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

function addTabelaRelacional(key){
    console.log(key);
    var url_post = "<?= base_url("MisterAmon/getAllTablesToCombox"); ?>";
    

    $.ajax({
      type: "POST",
      url: url_post,
      data: {'echo' : 'true'},
      success: function(data){
          console.log(data);
            var html = "<div class='col-md-3 form-group'><label>Tabela Ref:</label><select name='id_tabela_ref[]' id='id_tabela_ref' class='form-control' onchange='addCampoRelacional("+key+")'><option value=''></option>"
                
            html = html.concat("</select></div>");
        $("#campo" + key).append(html);
      },
      error: function(data) {
       $("#tabela_input").html(data);
      }
    });

    e.preventDefault();
}
</script>