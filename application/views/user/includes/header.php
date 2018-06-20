<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Mister Salgadinhos - Administrador</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">
  <link rel="shortcut icon" sizes="32x32" href="<?= base_url('assets/ico/32.png'); ?>">

	<!-- css -->
  <!-- Bootstrap core CSS-->
  <link href="<?= base_url('assets/css/bootstrap.min.css') ?>" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="<?= base_url('assets/css/login/font-awesome.min.css') ?>" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="<?= base_url('assets/css/login/sb-admin.min.css') ?>" rel="stylesheet">
</head>
<body class="bg-dark pt-5">

    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="<?php echo base_url(""); ?>">Mister Administrador</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
  				  <li class="nav-item"><a class="nav-link" href="<?= base_url('logout') ?>">Logout</a></li>
  				  <!--<li class="nav-item"><a class="nav-link" href="">Register</a></li>
  				  <li class="nav-item"><a class="nav-link" href="">Login</a></li>-->
          </li>
        </ul>
      </div>
    </nav>


	<main id="site-content" role="main">
