        <div class="page-header-image" style="background-image:url(<?= base_url('assets/templateV3/img/coxinha.png') ?>)"></div>
        <div class="container">
            <div class="col-md-4 content-center">
            <?php if (validation_errors()) : ?>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                  <strong>Ops!</strong> <?= validation_errors() ?>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
            <?php endif; ?>
            <?php if (isset($error)) : ?>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                  <strong>Ops!</strong> <?= $error ?>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
            <?php endif; ?>
                <div class="card card-login card-plain">
                    <?= form_open("", array("class" => "form")) ?>
                        <div class="header header-primary text-center">
                            <div class="logo-container">
                                <img src="<?= base_url('assets/templateV3/img/avatar.png') ?>" alt="">
                            </div>
                        </div>
                        <div class="content">
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span>
                                <input type="text" class="form-control" id="user" name="user" placeholder="E-mail">
                            </div>
                            <div class="footer text-center">
                                <input type="submit" class="btn btn-primary btn-round btn-lg btn-block" value="Recuperar">
                            </div>
                        </div>
                        

                    </form>
                </div>
            </div>
        </div>