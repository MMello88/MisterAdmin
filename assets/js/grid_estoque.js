  $(document).on('submit', 'form#movEstoque', function(e){
    var form = this;
    var dados = $(this).serialize();
    var url_post = this.action;

    var QtdeMov = $(form).siblings("td[for='qtde_movimentacao']").children('input').val();
    var tipo_mov = $(form).siblings("td[for='tipo_movimentacao']").children('select').val();
    var QtdeTotal = $(form).siblings("input[name='qtde_total']").val();
    
    var Total;
    if (tipo_mov == 'e')
      Total = Number(QtdeTotal) + Number(QtdeMov);
    else if (tipo_mov == 's')
      Total = Number(QtdeTotal) - Number(QtdeMov);

    $(form).siblings("td[for='qtde_movimentacao']").children('input').val("");
    $(form).siblings("td[for='qtde_total']").text(Total);

    $.ajax({
      type: "POST",
      url: url_post,
      data: dados,
      success: function(data){
        $("#alert-post-sucesso").removeClass("d-none");
        $("#alert-post-sucesso").addClass("show");
      },
      error: function(data) {
        $("#alert-post-error").removeClass("d-none");
        $("#alert-post-error").addClass("show");
      }
    });
    e.preventDefault();
  });

  $('#close-post-sucesso').on('click', function () {
    $("#alert-post-sucesso").removeClass("show");
    $("#alert-post-sucesso").addClass("d-none");
  });

  $('#close-post-error').on('click', function () {
    $("#alert-post-error").removeClass("show");
    $("#alert-post-error").addClass("d-none");
  });