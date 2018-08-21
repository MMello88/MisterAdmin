$(document).on('submit','#movEstoque', function(){
  var form = this;
/*  var idCart = $(form).find("input[name='id_cart']").val(); */
  var dados = $(form).serialize();
  var qtde_total = $(form).find("#qtde_total").val();
 console.log(form);
 console.log(dados);
 var url_post = form.attr('action');
  $.ajax({
    type: "POST",
    url: url_post,
    data: dados,
    success: function( data )
    {
      $("#carrinho-"+idCart).remove();
      $("#valor_total").text("Total Pedido: " + total.toFixed(2));
    },
    error : function(data) {
      $("#msgError").html("<strong>Desculpe!</strong> Erro ao remover seu pedido. Em breve tente novamente!");
      $("#message-danger").removeAttr("style");
    }
  });
  event.preventDefault();
});