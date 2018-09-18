              <section id="main-content">
                <?php if (isset($main_page)) : ?>
                  <div class="row">
                    <div class="col-md-3">
                        <div class="card bg-white p-2 text-center">
                            <div class="m-t-5">
                                <p>Pedidos no Site</p>
                            </div>
                            <ul class="widget-line-list m-b-15">
                                <li class="border-right"> <label id="result_aberto"><?= $PedidoAbertoFechado->aberto; ?></label> <br>
                                  <span class="color-success">
                                    <i class="ti-hand-point-up"></i> Aberto
                                  </span>
                                </li>
                                <li>
                                  <label id="result_fechado"><?= $PedidoAbertoFechado->fechado; ?></label> <br>
                                  <span class="color-danger">
                                    <i class="ti-hand-point-down"></i>Fechados
                                  </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                      <div class="col-lg-3">
                          <div class="card bg-white p-3">
                              <div class="m-t-10 stat-widget-two">
                                  <div class="stat-content">
                                      <div class="stat-text">Realizar</div>
                                      <div class="stat-digit"><a href='<?= site_url("Dashboard/pedidos"); ?>'>Pedidos</a></div>
                                  </div>
                                  <div class="progress">
                                      <div class="progress-bar progress-bar-success w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                  </div>
                              </div>
                          </div>
                      </div>

                      <div class="col-lg-3">
                        <div class="card bg-white p-3">
                          <div class="m-t-10 stat-widget-two">
                            <div class="stat-content">
                              <div class="stat-text">Cadastrar</div>
                              <div class="stat-digit"><a href='<?= site_url("Dashboard/clientes"); ?>'>Clientes</a></div>
                            </div>
                            <div class="progress">
                              <div class="progress-bar progress-bar-success w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                          </div>
                        </div>
                      </div>
                  </div>

  <div class="alert alert-success alert-dismissible fade m-2 d-none" id="alert-post-sucesso" role="alert">
    <h4 class="alert-heading">Realizado com Sucesso!</h4>
    <hr class="my-2">
    <p class="p-0 m-0 text-light">Processo realizado com sucesso!</p> 
    <button type="button" class="close" id="close-post-sucesso">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>

  <div class="alert alert-danger alert-dismissible fade m-2 d-none" id="alert-post-error" role="alert">
    <h4 class="alert-heading">Realizado com Erro!</h4>
    <hr class="my-2">
    Processo realizado com erro. Em breve tente novamente!
    <button type="button" class="close" id="close-post-error">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>

                  <div class="row">
                    <div class="col-12 col-sm-12 col-lg-12">
                      <div class="accordion" id="accordionEstoque">
                        <div class="card">

                          <div class="card-header bg-white" id="headingEstoque">
                            <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#collapseEstoque" aria-expanded="true" aria-controls="collapseEstoque">
                              Lista de Estoque atual
                            </button>
                          </div>

                          <div id="collapseEstoque" class="collapse show" aria-labelledby="headingEstoque" data-parent="#accordionEstoque">
                            <table class="table">
                              <thead>
                                <tr>
                                  <th scope="col">Loja</th>
                                  <th scope="col">Produto</th>
                                  <th scope="col">Qntd Total</th>
                                  <th scope="col">Qntd Minima</th>
                                  <th scope="col">Nova Qntd</th>
                                  <th scope="col">Entrada/Saída</th>
                                  <th scope="col"></th>
                                </tr>
                              </thead>
                              <tbody>
                              <?php 
                                foreach ($estoques as $key => $estoq) {
                                  $alerta = $estoq['estoque_baixo'] == 1 ? "<span class='badge badge-danger pull-right'><i class='ti-alert'></i></span>" : "";
                                  echo "
                                  <tr>
                                  ".form_open($__CLASS__.'/postMoviEstoque', array('id' => 'movEstoque'))."
                                      <input type='hidden' name='id_loja' value='".$estoq['id_loja']."'>
                                      <input type='hidden' name='id_produto' value='".$estoq['id_produto']."'>
                                      <input type='hidden' name='ativo' value='".$estoq['ativo']."'>
                                      <input type='hidden' name='qtde_total' value='".$estoq['qtde_total']."'>
                                      <td>".$estoq['nome_fantasia']."</td>
                                      <td>{$alerta} ".$estoq['produto']."</td>
                                      <td for='qtde_total'>".$estoq['qtde_total']."</td>
                                      <td>".$estoq['qtde_minima']."</td>
                                      <td for='qtde_movimentacao'>
                                        <input type='numeric' name='qtde_movimentacao' class='form-control form-control-sm mb-2' placeholder='Nova Quantidade'>
                                      </td>
                                      <td for='tipo_movimentacao'>
                                        <select class='custom-select' name='tipo_movimentacao'><option value='e' selected>Entrada</option><option value='s'>Saída</option></select>
                                      </td>
                                      <td><button type='submit' class='btn btn-sm btn-success btn-outline mb-2'>Enviar</button></td>
                                    </form>
                                  </tr>";
                                } 
                              ?>
                              </tbody>
                            </table>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- /# row -->
                  <div class="row">
                    <div class="col-12 col-sm-12 col-lg-12">
                      <div class="accordion" id="accordionAFazer">
                        <div class="card">

                          <div class="card-header bg-white" id="headingAFazer">
                            <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#collapseAFazer" aria-expanded="true" aria-controls="collapseAFazer">
                              Lista de A Fazeres
                            </button>
                          </div>

                          <div id="collapseAFazer" class="collapse" aria-labelledby="headingAFazer" data-parent="#accordionAFazer">
                            <table class="table">
                              <thead>
                                <tr>
                                  <th scope="col">A Fazer</th>
                                  <th scope="col">Data Inicio</th>
                                  <th scope="col">Data Fim</th>
                                  <th scope="col"></th>
                                </tr>
                              </thead>
                              <tbody> 
                            <?php 
                              foreach ($afazeres as $afazer) {
                                echo "
                                <tr>
                                ".form_open($__CLASS__.'/postAFazer', array())."
                                  <input type='hidden' name='id_afazer' value='".$afazer['id_afazer']."'>
                                  <input type='hidden' name='realizado' value='s'>
                                  <td>".$afazer['afazer']."</td>
                                  <td>".$afazer['dt_inicio']."</td>
                                  <td>".$afazer['dt_fim']."</td>
                                  <td><button type='submit' class='btn btn-sm btn-danger btn-outline'>X</button></td>
                                </form>
                                </tr>";
                              } 
                            ?>
                              </tbody>
                            </table>
                          </div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- /# row -->
                  <div class="row">
                    <div class="col-12 col-sm-12 col-lg-12">
                      <div class="accordion" id="accordionPedidoSolic">
                        <div class="card">
                          <div class="card-header bg-white" id="headingPedidoSolic">
                            <button class="btn btn-link dropdown-toggle" type="button" data-toggle="collapse" data-target="#collapsePedidoSolic" aria-expanded="true" aria-controls="collapsePedidoSolic">
                              Lista de Pedidos Solicitados
                            </button>
                          </div>

                          <div id="collapsePedidoSolic" class="collapse" aria-labelledby="headingPedidoSolic" data-parent="#accordionPedidoSolic">
                            <div class="container">
                              <div class="row p-2" style="color:#373757; font-weight: 600;">
                                <div class="col"> </div>
                                <div class="col">Cliente</div>
                                <div class="col">Pgto</div>
                                <div class="col">Entrega</div>
                                <div class="col">Dt Entrega</div>
                                <div class="col">Valor</div>
                                <div class="col">Taxa</div>
                                <div class="col">Valor Total</div>
                                <div class="col"> </div>
                              </div>
                            </div>
                            <?php 
                              foreach ($PedidosSolicitados as $pedido) {
                                echo "
                                  <div class='container'>
                                    <div class='row p-1 border-top' style='color: #868e96;'>
                                      <div class='col'><a class='btn btn-sm btn-info btn-outline p-1' data-toggle='collapse' href='#collapsePedido".$pedido['id_pedido']."' role='button' aria-expanded='false' aria-controls='collapsePedido".$pedido['id_pedido']."'> + </a></div>
                                      <div class='col'>".$pedido['nome_cliente']."</div>
                                      <div class='col'>".$pedido['forma_pgto']."</div>
                                      <div class='col'>".$pedido['forma_entrega']."</div>
                                      <div class='col'>".$pedido['dthr_entrega']."</div>
                                      <div class='col'>".$pedido['valor']."</div>
                                      <div class='col'>".$pedido['taxa_entrega']."</div>
                                      <div class='col'>".$pedido['valor_total']."</div>
                                      <div class='col'>
                                        ".form_open($__CLASS__.'/postPedidoEntregue', array())."
                                          <input type='hidden' name='id_pedido' value='".$pedido['id_pedido']."'>
                                          <button type='submit' class='btn btn-sm btn-warning btn-outline'>Entregar</button>
                                        </form>
                                        ".form_open($__CLASS__.'/postCancelarPedido', array())."
                                          <input type='hidden' name='id_pedido' value='".$pedido['id_pedido']."'>
                                          <button type='submit' class='btn btn-sm btn-warning btn-outline'>Cancelar</button>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                                ";

                                echo "
                                  <div class='collapse' id='collapsePedido".$pedido['id_pedido']."'>
                                    <div class='card card-body'>
                                      <div class='container'>
                                        <div class='row p-1' style='color:#373757; font-weight: 600;'>
                                          <div class='col'>Cidade</div>
                                          <div class='col'>Data Pedido</div>
                                          <div class='col'>Endereço</div>
                                          <div class='col-3'></div>
                                        </div>
                                        <div class='row p-1' style='color: #868e96;'>
                                          <div class='col'>".$pedido['nome_cidade']."</div>
                                          <div class='col'>".$pedido['data_pedido']."</div>
                                          <div class='col'>".$pedido['end_completo']."</div>
                                          <div class='col'></div>
                                        </div>
                                        <div class='row p-1' style='color: #868e96;'>
                                          <div class='col'></div>
                                          <div class='col'>Produto</div>
                                          <div class='col'>Categoria</div>
                                          <div class='col'>Qntd</div>
                                        </div>
                                        ";
                                foreach ($pedido['itens'] as $item) {
                                  echo "<div class='row p-1' style='color: #868e96;'>
                                          <div class='col'></div>
                                          <div class='col'>".$item['nome_produto']."</div>
                                          <div class='col'>".$item['nome_categoria']."</div>
                                          <div class='col'>".$item['qtde']."</div>
                                        </div>";
                                }
                                echo "
                                      </div>
                                    </div>
                                  </div>";                           
                               
                              } 
                            ?>
                            </div>  
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- /row -->
                <?php else : ?>

                  <div class="row">
                    <div class="col-lg-12">
                      <div class="card nestable-cart">
                        <div class="card-title">
                          <div class="card-title-right-icon">
                            <?= isset($msg_file_create) ? $msg_file_create : ""; ?>
                            <?php echo $output; ?>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                <?php endif; ?>
                  
              </section>
