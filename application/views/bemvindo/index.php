<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="32x32" href="<?= base_url('assets/templateV3/img/avatar-ico.png') ?>">
    <link rel="icon" type="image/png" href="<?= base_url('assets/templateV3/img/avatar-ico.png') ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Bem Vindo ao Mister Web</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="<?= base_url('assets/templateV3/css/now-ui-kit.css?v=1.1.0') ?>" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="<?= base_url('assets/templateV3/css/demo.css') ?>" rel="stylesheet" />
</head>

<body class="index-page sidebar-collapse">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent " color-on-scroll="400">
        <div class="container">
            <div class="navbar-translate">
                <a class="navbar-brand" href="<?= base_url() ?>" rel="tooltip" title="O Melhor e o mais Rápido Gestor" data-placement="bottom">
                    Mister Web
                </a>
                <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-bar bar1"></span>
                    <span class="navbar-toggler-bar bar2"></span>
                    <span class="navbar-toggler-bar bar3"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navigation" data-nav-image="./assets/img/blurred-image-1.jpg">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<?= base_url() ?>" >
                            <i class="now-ui-icons arrows-1_cloud-download-93"></i>
                            <p>Vamos comerçar?</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?= base_url() ?>">
                            <i class="now-ui-icons files_paper"></i>
                            <p>Pacotes</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?= base_url('Portal/login') ?>" >
                            <i class="now-ui-icons users_single-02"></i>
                            <p>Portal</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Curte nós no Facebook" data-placement="bottom" href="#" target="_blank">
                            <i class="fa fa-facebook-square"></i>
                            <p class="d-lg-none d-xl-none">Facebook</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Segue nós no Instagram" data-placement="bottom" href="#" target="_blank">
                            <i class="fa fa-instagram"></i>
                            <p class="d-lg-none d-xl-none">Instagram</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
    <div class="wrapper">
        <div class="page-header clear-filter" filter-color="orange">
            <div class="page-header-image" data-parallax="true" style="background-image: url('<?= base_url('assets/templateV3/img/coxinha.png') ?>');">
            </div>
            <div class="container">
                <div class="content-center brand">
                    <img class="n-logo" src="<?= base_url('assets/templateV3/img/avatar.png') ?>" alt="">
                    <h1 class="h1-seo">Mister Web.</h1>
                    <h3>Sistema de Gestão para seu Restaurante. </h3>
                </div>
                <h6 class="category category-absolute">Trabalhamos para facilitar seu trabalho!</h6>
            </div>
        </div>
        <div class="main">
            <div class="section section-images">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="hero-images-container">
                                <img src="<?= base_url('assets/templateV3/img/hero-image-1.png') ?>" alt="">
                            </div>
                            <div class="hero-images-container-1">
                                <img src="<?= base_url('assets/templateV3/img/hero-image-2.png') ?>" alt="">
                            </div>
                            <div class="hero-images-container-2">
                                <img src="<?= base_url('assets/templateV3/img/hero-image-3.png') ?>" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            

           
            <div class="section section-tabs">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xl-12 ml-auto mr-auto">
                            <p class="category">Tabs with Icons on Card</p>
                            <!-- Nav tabs -->
                            <div class="card">
                                <ul class="nav nav-tabs justify-content-center" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#home" role="tab">
                                            <i class="now-ui-icons objects_umbrella-13"></i> Home
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#profile" role="tab">
                                            <i class="now-ui-icons shopping_cart-simple"></i> Profile
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#messages" role="tab">
                                            <i class="now-ui-icons shopping_shop"></i> Messages
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#settings" role="tab">
                                            <i class="now-ui-icons ui-2_settings-90"></i> Settings
                                        </a>
                                    </li>
                                </ul>
                                <div class="card-body">
                                    <!-- Tab panes -->
                                    <div class="tab-content text-center">
                                        <div class="tab-pane active" id="home" role="tabpanel">
                                            <p>I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at. So when you get something that has the name Kanye West on it, it’s supposed to be pushing the furthest possibilities. I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus.</p>
                                        </div>
                                        <div class="tab-pane" id="profile" role="tabpanel">
                                            <p> I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at. </p>
                                        </div>
                                        <div class="tab-pane" id="messages" role="tabpanel">
                                            <p>I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at. So when you get something that has the name Kanye West on it, it’s supposed to be pushing the furthest possibilities. I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus.</p>
                                        </div>
                                        <div class="tab-pane" id="settings" role="tabpanel">
                                            <p>
                                                "I will be the leader of a company that ends up being worth billions of dollars, because I got the answers. I understand culture. I am the nucleus. I think that’s a responsibility that I have, to push possibilities, to show people, this is the level that things could be at."
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>

            <!-- End Section Tabs -->

            <div class="section" id="carousel">
                <div class="container">
                    <h3 class="title">Javascript components</h3>
                    <div class="row justify-content-center">
                        <div class="col-8">
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner" role="listbox">
                                    <div class="carousel-item active">
                                        <img class="d-block" src="<?= base_url('assets/templateV3/img/bg1.jpg') ?>" alt="First slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <h5>Nature, United States</h5>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block" src="<?= base_url('assets/templateV3/img/bg3.jpg') ?>" alt="Second slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <h5>Somewhere Beyond, United States</h5>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block" src="<?= base_url('assets/templateV3/img/bg4.jpg') ?>" alt="Third slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <h5>Yellowstone National Park, United States</h5>
                                        </div>
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <i class="now-ui-icons arrows-1_minimal-left"></i>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <i class="now-ui-icons arrows-1_minimal-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section section-nucleo-icons">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <h2 class="title">Nucleo Icons</h2>
                            <h5 class="description">
                                Now UI Kit comes with 100 custom icons made by our friends from NucleoApp. The official package contains over 2.100 thin icons which are looking great in combination with Now UI Kit Make sure you check all of them and use those that you like the most.
                            </h5>
                        </div>
                        <div class="col-lg-6 col-md-12">
                            <div class="icons-container">
                                <i class="now-ui-icons ui-1_send"></i>
                                <i class="now-ui-icons ui-2_like"></i>
                                <i class="now-ui-icons transportation_air-baloon"></i>
                                <i class="now-ui-icons text_bold"></i>
                                <i class="now-ui-icons tech_headphones"></i>
                                <i class="now-ui-icons emoticons_satisfied"></i>
                                <i class="now-ui-icons shopping_cart-simple"></i>
                                <i class="now-ui-icons objects_spaceship"></i>
                                <i class="now-ui-icons media-2_note-03"></i>
                                <i class="now-ui-icons ui-2_favourite-28"></i>
                                <i class="now-ui-icons design_palette"></i>
                                <i class="now-ui-icons clothes_tie-bow"></i>
                                <i class="now-ui-icons location_pin"></i>
                                <i class="now-ui-icons objects_key-25"></i>
                                <i class="now-ui-icons travel_istanbul"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section">
                <div class="container text-center">
                    <div class="row justify-content-md-center">
                        <div class="col-md-12 col-lg-8">
                            <h2 class="title">Completed with examples</h2>
                            <h5 class="description">The kit comes with three pre-built pages to help you get started faster. You can change the text and images and you're good to go. More importantly, looking at them will give you a picture of what you can built with this powerful Bootstrap 4 ui kit.</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section section-examples" data-background-color="black">
                <div class="space-50"></div>
                <div class="container text-center">
                    <div class="row">
                        <div class="col">
                            <a href="examples/landing-page.html" target="_blank">
                                <img src="<?= base_url('assets/templateV3/img/landing.jpg') ?>" alt="Image" class="img-raised">
                            </a>
                            <a href="examples/landing-page.html" class="btn btn-simple btn-primary btn-round">View Landing Page</a>
                        </div>
                        <div class="col">
                            <a href="examples/profile-page.html" target="_blank">
                                <img src="<?= base_url('assets/templateV3/img/profile.jpg') ?>" alt="Image" class="img-raised">
                            </a>
                            <a href="examples/profile-page.html" class="btn btn-simple btn-primary btn-round">View Profile Page</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section section-download" id="#download-section" data-background-color="black">
                <div class="container">
                    <div class="row justify-content-md-center">
                        <div class="text-center col-md-12 col-lg-8">
                            <h3 class="title">Do you love this Bootstrap 4 UI Kit?</h3>
                            <h5 class="description">Cause if you do, it can be yours for FREE. Hit the button below to navigate to Creative Tim or Invision where you can find the kit in HTML or Sketch/PSD format. Start a new project or give an old Bootstrap project a new look!</h5>
                        </div>
                        <div class="text-center col-md-12 col-lg-8">
                            <a href="https://www.creative-tim.com/product/now-ui-kit" class="btn btn-primary btn-lg btn-round" role="button">
                                Download HTML
                            </a>
                            <a href="https://www.invisionapp.com/now" target="_blank" class="btn btn-primary btn-lg btn-simple btn-round" role="button">
                                Download PSD/Sketch
                            </a>
                        </div>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="row text-center mt-5">
                        <div class="col-md-8 ml-auto mr-auto">
                            <h2>Want more?</h2>
                            <h5 class="description">We've just launched
                                <a href="http://demos.creative-tim.com/now-ui-kit-pro/presentation.html" target="_blank">Now UI Kit PRO</a>. It has a huge number of components, sections and example pages. Start Your Development With A Badass Bootstrap 4 UI Kit.</h4>
                        </div>
                        <div class="col-md-12">
                            <a href="http://demos.creative-tim.com/now-ui-kit-pro/presentation.html" class="btn btn-neutral btn-round btn-lg" target="_blank">
                                <i class="now-ui-icons arrows-1_share-66"></i> Upgrade to PRO
                            </a>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="row justify-content-md-center sharing-area text-center">
                        <div class="text-center col-md-12 col-lg-8">
                            <h3>Thank you for supporting us!</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sart Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header justify-content-center">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            <i class="now-ui-icons ui-1_simple-remove"></i>
                        </button>
                        <h4 class="title title-up">Modal title</h4>
                    </div>
                    <div class="modal-body">
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default">Nice Button</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--  End Modal -->
        <!-- Mini Modal -->
        <div class="modal fade modal-mini modal-primary" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header justify-content-center">
                        <div class="modal-profile">
                            <i class="now-ui-icons users_circle-08"></i>
                        </div>
                    </div>
                    <div class="modal-body">
                        <p>Always have an access to your profile</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link btn-neutral">Back</button>
                        <button type="button" class="btn btn-link btn-neutral" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--  End Modal -->
        <footer class="footer" data-background-color="black">
            <div class="container"> 
                <div class="copyright">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear())
                    </script>
                    <a href="#">Mister</a>.
                </div>
            </div>
        </footer>
    </div>
</body>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="<?= base_url('assets/templateV3/js/plugins/bootstrap-switch.js') ?>"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="<?= base_url('assets/templateV3/js/plugins/nouislider.min.js') ?>" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="<?= base_url('assets/templateV3/js/plugins/bootstrap-datepicker.js') ?>" type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="<?= base_url('assets/templateV3/js/now-ui-kit.js?v=1.1.0') ?>" type="text/javascript"></script>

</html>