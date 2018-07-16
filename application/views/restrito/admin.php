<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Mister Salgadinhos - Administrador</title>

  <!-- ================= Favicon ================== -->
  <!-- Standard -->
  <link rel="shortcut icon" sizes="32x32" href="<?= base_url('assets/ico/32.png'); ?>">


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <!-- Grocery Theme CSS-->
  <?php foreach($css_files as $file): ?>
  <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
  <?php endforeach; ?>


  <?php if (empty($css_files)) { ?>
  <!-- Bootstrap core CSS-->
  <!--<link href="<?= base_url('assets/template_admin/vendor/bootstrap/css/bootstrap.min.css'); ?>" rel="stylesheet">-->
  <?php } ?>

  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/jquery.min.js'); ?>"></script>

<script type="text/javascript">
$(document).ready(function(){
  console.log('asdf');
  setInterval(function() { // Do this
    $.get("<?= base_url("Dashboard/getStatusPedido"); ?>", function(data){
      console.log('1');
      data = jQuery.parseJSON(data);
      $("#result_aberto").html(data.aberto);
      $("#result_fechado").html(data.fechado);
    })
  }, 30000);
});
 
</script>

  <!-- Styles -->

  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/weather-icons.css'); ?>" rel="stylesheet" />
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/owl.carousel.min.css'); ?>" rel="stylesheet" />
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/owl.theme.default.min.css'); ?>" rel="stylesheet" />
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/font-awesome.min.css'); ?>" rel="stylesheet">
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/themify-icons.css'); ?>" rel="stylesheet">
  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/menubar/sidebar.css'); ?>" rel="stylesheet">
  <!--<link href="<?= base_url('assets/tamplate_focus/assets/css/lib/bootstrap.min.css'); ?>" rel="stylesheet">-->

  <link href="<?= base_url('assets/tamplate_focus/assets/css/lib/helper.css'); ?>" rel="stylesheet">
  <link href="<?= base_url('assets/tamplate_focus/assets/css/style.css'); ?>" rel="stylesheet">
</head>

<body>
  <!-- # sidebar -->
  <div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
      <div class="nano">
          <div class="nano-content">
              <div class="logo"><a href="<?= site_url('Dashboard/index')?>"><!-- <img src="assets/images/logo.png" alt="" /> --><span>Mister Administrador</span></a></div>

              <ul>
                <?php 
                  foreach ($menus as $menu) {
                    if (!is_null($menu['menu_titulo'])){
                      echo "<li class='label'>".$menu['menu_titulo']."</li>";
                    }
                    echo "<li class=''><a class='sidebar-sub-toggle'><i class='".$menu['tag_i']."'></i> ".$menu['nome_menu']." <span class='sidebar-collapse-icon ti-angle-down'></span></a>";
                    echo "  <ul>";
                    foreach ($menu['submenus'] as $submenu) {
                      echo "    <li><a href='".site_url($submenu['nome_controller']."/".$submenu['nome_function'])."'>".$submenu['nome_submenu']."</a></li>";
                    }
                    echo "  </ul>";
                    echo "</li>";                
                  }
                ?>
                <li class="label"><?= $this->session->userdata('nome_user'); ?></li>
                <li><a href="<?= base_url('User/logout') ?>"><i class="ti-close"></i> Logout</a></li>
              </ul>
          </div>
      </div>
  </div>
  <!-- /# sidebar -->

  <!-- # cabeçalho -->
  <div class="header">
      <div class="container-fluid">
          <div class="row">
              <div class="col-lg-12">
                  <div class="float-left">
                      <div class="hamburger sidebar-toggle">
                          <span class="line"></span>
                          <span class="line"></span>
                          <span class="line"></span>
                      </div>
                  </div>
                  <div class="float-right">
                      <ul>
						  <!--
                          <li class="header-icon dib"><i class="ti-bell"></i>
                              <div class="drop-down">
                                  <div class="dropdown-content-heading">
                                      <span class="text-left">Recent Notifications</span>
                                  </div>
                                  <div class="dropdown-content-body">
                                      <ul>
                                          <li>
                                              <a href="#">
                                                  <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/3.jpg" alt="" />
                                                  <div class="notification-content">
                                                      <small class="notification-timestamp pull-right">02:34 PM</small>
                                                      <div class="notification-heading">Mr. John</div>
                                                      <div class="notification-text">5 members joined today </div>
                                                  </div>
                                              </a>
                                          </li>
                                          <li class="text-center">
                                              <a href="#" class="more-link">See All</a>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </li>
                          <li class="header-icon dib"><i class="ti-email"></i>
						  -->
                              <div class="drop-down">
                                  <div class="dropdown-content-heading">
                                      <span class="text-left">2 New Messages</span>
                                      <a href="email.html"><i class="ti-pencil-alt pull-right"></i></a>
                                  </div>
                                  <div class="dropdown-content-body">
                                      <ul>
                                          <li class="notification-unread">
                                              <a href="#">
                                                  <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/1.jpg" alt="" />
                                                  <div class="notification-content">
                                                      <small class="notification-timestamp pull-right">02:34 PM</small>
                                                      <div class="notification-heading">Michael Qin</div>
                                                      <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                  </div>
                                              </a>
                                          </li>
                                          <li class="text-center">
                                              <a href="#" class="more-link">See All</a>
                                          </li>
                                      </ul>
                                  </div>
                              </div>
                          </li>
                          <li class="header-icon dib"><span class="user-avatar"><?= $this->session->userdata('nome_user'); ?> <i class="ti-angle-down f-s-10"></i></span>
                              <div class="drop-down dropdown-profile">
                                  <!--<div class="dropdown-content-heading">
                                  </div>-->
                                  <div class="dropdown-content-body">
                                      <ul>
                                          <!--<li><a href="#"><i class="ti-user"></i> <span>Profile</span></a></li>-->
                                          <li><a href="<?= base_url('User/logout') ?>"><i class="ti-power-off"></i> <span>Logout</span></a></li>
                                      </ul>
                                  </div>
                              </div>
                          </li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- /# cabeçalho -->

  <div class="content-wrap">
      <div class="main">
          <div class="container-fluid">
              <!-- /# main titulo -->
              <div class="row"> 
                  <div class="col-lg-8 p-r-0 title-margin-right">
                      <div class="page-header">
                          <div class="page-title">
                              <h1><?= $this->session->userdata('nome_user'); ?>, <span>Seja bem vindo</span></h1>
                          </div>
                      </div>
                  </div>
                  <!-- /# column -->

                  <div class="col-lg-4 p-l-0 title-margin-left">
                    <div class="page-header">
                      <div class="page-title">
                        <ol class="breadcrumb">
  												<li class="breadcrumb-item"><?= isset($navigation_back) ? $navigation_back : ""; ?></li>
                        </ol>
                      </div>
                    </div>
                  </div>
                  <!-- /# column -->
              </div>
              <!-- /# fim main titulo -->

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

                  <div class="row">
                    <div class="col-12 col-sm-12 col-lg-12">
                      <div class="card">
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
                          foreach ($estoques as $estoq) {
                            $alerta = $estoq['estoque_baixo'] == 1 ? "<span class='badge badge-danger pull-right'><i class='ti-alert'></i></span>" : "";
                            echo "
                            <tr>
                            ".form_open($__CLASS__.'/postMoviEstoque', array())."
                              <input type='hidden' name='id_loja' value='".$estoq['id_loja']."'>
                              <input type='hidden' name='id_produto' value='".$estoq['id_produto']."'>
                              <td>".$estoq['nome_fantasia']."</td>
                              <td>{$alerta} ".$estoq['produto']."</td>
                              <td>".$estoq['qtde_total']."</td>
                              <td>".$estoq['qtde_minima']."</td>
                              <td><input type='numeric' name='qtde_movimentacao' class='form-control form-control-sm mb-2' placeholder='Nova Quantidade'></td>
                              <td><select class='custom-select' name='tipo_movimentacao'><option value='e' selected>Entrada</option><option value='s'>Saída</option></select></td>
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
                  <!-- /# row -->
                  <div class="row">
                    <div class="col-12 col-sm-12 col-lg-12">
                      <div class="card">
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
                  <!-- /# row -->
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

                  

                  <div class="row">
                      <div class="col-lg-12">
                          <div class="footer">
                              <p>2018 © Mister Salgadinhos. - <a href="<?= site_url(); ?>"><?= site_url(); ?></a></p>
                          </div>
                      </div>
                  </div>
              </section>
          </div>
      </div>
  </div>
  <div id="search">
      <button type="button" class="close">×</button>
      <form>
          <input type="search" value="" placeholder="type keyword(s) here" />
          <button type="submit" class="btn btn-primary">Search</button>
      </form>
  </div>
  <!-- jquery vendor -->
  
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/jquery.nanoscroller.min.js'); ?>"></script>
  <!-- nano scroller -->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/menubar/sidebar.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/preloader/pace.min.js'); ?>"></script>
  <!-- sidebar -->
  <!--<script src="<?= base_url('assets/tamplate_focus/assets/js/lib/bootstrap.min.js'); ?>"></script>-->

  <!-- bootstrap -->

  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/circle-progress/circle-progress.min.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/circle-progress/circle-progress-init.js'); ?>"></script>

  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/morris-chart/raphael-min.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/morris-chart/morris.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/morris-chart/morris-init.js'); ?>"></script>

  <!--  flot-chart js -->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/flot-chart/jquery.flot.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/flot-chart/jquery.flot.resize.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/flot-chart/flot-chart-init.js'); ?>"></script>
  <!-- // flot-chart js -->


  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/jquery.vmap.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/jquery.vmap.min.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/jquery.vmap.sampledata.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.world.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.algeria.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.argentina.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.brazil.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.france.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.germany.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.greece.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.iran.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.iraq.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.russia.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.tunisia.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.europe.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/country/jquery.vmap.usa.js'); ?>"></script>
  <!-- scripit init-->
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/vector-map/vector.init.js'); ?>"></script>

  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/weather/jquery.simpleWeather.min.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/weather/weather-init.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/owl-carousel/owl.carousel.min.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/lib/owl-carousel/owl.carousel-init.js'); ?>"></script>
  <script src="<?= base_url('assets/tamplate_focus/assets/js/scripts.js'); ?>"></script>
  <!-- scripit init-->


    <?php foreach($js_files as $file): ?>
        <script src="<?php echo $file; ?>"></script>
    <?php endforeach; ?>




</body>
</html>
