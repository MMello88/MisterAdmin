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
  <link rel="shortcut icon" sizes="32x32" href="<?= base_url('assets/templateGrocery/ico/32.png'); ?>">


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <!-- Grocery Theme CSS-->
  <?php if (isset($css_files)) : ?>
    
  <?php foreach($css_files as $file): ?>
  <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
  <?php endforeach; ?>

  <?php endif; ?>


  <?php if (empty($css_files)) { ?>
  <!-- Bootstrap core CSS-->
  <!--<link href="<?= base_url('assets/templateGrocery/template_admin/vendor/bootstrap/css/bootstrap.min.css'); ?>" rel="stylesheet">-->
  <?php } ?>

  <script src="<?= base_url('assets/templateGrocery/tamplate_focus/assets/js/lib/jquery.min.js'); ?>"></script>

<script type="text/javascript">


$(document).ready(function(){
  setInterval(function() { // Do this
    $.get("<?= base_url($__CLASS__."/getStatusPedido"); ?>", function(data){
      data = jQuery.parseJSON(data);
      $("#result_aberto").html(data.aberto);
      $("#result_fechado").html(data.fechado);
    })
  }, 30000);
});
 
</script>

  <!-- Styles -->

  <link href="<?= base_url('assets/templateGrocery/tamplate_focus/assets/css/lib/weather-icons.css'); ?>" rel="stylesheet" />
  <link href="<?= base_url('assets/templateGrocery/tamplate_focus/assets/css/lib/owl.carousel.min.css'); ?>" rel="stylesheet" />
  <link href="<?= base_url('assets/templateGrocery/tamplate_focus/assets/css/lib/owl.theme.default.min.css'); ?>" rel="stylesheet" />
  <link href="<?= base_url('assets/templateGrocery/tamplate_focus/assets/css/lib/font-awesome.min.css'); ?>" rel="stylesheet">
  <link href="<?= base_url('assets/templateGrocery/tamplate_focus/assets/css/lib/themify-icons.css'); ?>" rel="stylesheet">
  <link href="<?= base_url('assets/templateGrocery/tamplate_focus/assets/css/lib/menubar/sidebar.css'); ?>" rel="stylesheet">
  <!--<link href="<?= base_url('assets/templateGrocery/tamplate_focus/assets/css/lib/bootstrap.min.css'); ?>" rel="stylesheet">-->

  <link href="<?= base_url('assets/templateGrocery/tamplate_focus/assets/css/lib/helper.css'); ?>" rel="stylesheet">
  <link href="<?= base_url('assets/templateGrocery/tamplate_focus/assets/css/style.css'); ?>" rel="stylesheet">
</head>

<body>
  <!-- # sidebar -->
  <div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
      <div class="nano">
          <div class="nano-content">
              <div class="logo"><a href="<?= site_url('Dashboard/index')?>"><!-- <img src="assets/templateGrocery/images/logo.png" alt="" /> --><span>Mister Administrador</span></a></div>

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
                                                  <img class="pull-left m-r-10 avatar-img" src="assets/templateGrocery/images/avatar/3.jpg" alt="" />
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
						  
                              <div class="drop-down">
                                  <div class="dropdown-content-heading">
                                      <span class="text-left">2 New Messages</span>
                                      <a href="email.html"><i class="ti-pencil-alt pull-right"></i></a>
                                  </div>
                                  <div class="dropdown-content-body">
                                      <ul>
                                          <li class="notification-unread">
                                              <a href="#">
                                                  <!--<img class="pull-left m-r-10 avatar-img" src="assets/templateGrocery/images/avatar/1.jpg" alt="" />--
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

                          </li>-->
                          <li class="header-icon dib"><span class="user-avatar"><?= $this->session->userdata('nome_user'); ?> <i class="ti-angle-down f-s-10"></i></span>
                              <div class="drop-down dropdown-profile">
                                  <!--<div class="dropdown-content-heading">
                                  </div>-->
                                  <div class="dropdown-content-body">
                                      <ul>
                                          <li><a href="<?= base_url('Perfil') ?>"><i class="ti-user"></i> <span>Perfil</span></a></li>
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