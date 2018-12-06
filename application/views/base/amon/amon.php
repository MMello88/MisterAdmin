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
      <div class='row' id='tabela_input'>
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

function addTabelaRelacional(value, key){
    $("#tab_ref_"+key).addClass('d-none');
    $("#col_id_ref_"+key).addClass('d-none');
    $("#col_desc_ref_"+key).addClass('d-none');

    if (value === 'MUL'){
        $("#tab_ref_"+key).removeClass('d-none');
        $("#col_id_ref_"+key).removeClass('d-none');
        $("#col_desc_ref_"+key).removeClass('d-none');
    }
}

function addCampoRelacional(tabela, key, colunaKey){
    var url_post = "<?= base_url("MisterAmon/getComboboxCampoRef"); ?>";
    $("#col_id_ref_"+key).remove();
    $("#col_desc_ref_"+key).remove();

    $.ajax({
      type: "POST",
      url: url_post,
      data: {'tabela' : tabela, 'echo' : 'true', 'key' : key, 'colunaKey' : colunaKey},
      success: function(data){
        $("#campo" + key).append(data);
      },
      error: function(data) {
       $("#campo" + key).html(data);
      }
    });
}

function AddCampoWhere(tabela){
    var url_post = "<?= base_url("MisterAmon/getInputsCampoWhere"); ?>";

    $.ajax({
      type: "POST",
      url: url_post,
      data: {'tabela' : tabela, 'echo' : 'true'},
      success: function(data){
        $("#campos_where").append(data);
      },
      error: function(data) {
       $("#campos_where").html(data);
      }
    });
}

function RemoverCampoWhere(BtnMe){
//
BtnMe.parent().parent().remove();
}
</script>