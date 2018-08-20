$(document).on('submit','form#movEstoque', function(){
  var form = this;
/*  var idCart = $(form).find("input[name='id_cart']").val(); */
  var dados = $(form).serialize();
  var valor_item = $(form).find("input[name='valor_subtotal-"+idCart+"']").val();
  var total = $("#valor_total").text().replace("Total Pedido: ","");
  total = Number(total) - Number(valor_item);
  $.ajax({
    type: "POST",
    url: location.href + "/postMoviEstoque",
    data: dados,
    success: function( data )
    {
      getCountCart();
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