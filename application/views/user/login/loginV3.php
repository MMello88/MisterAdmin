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
                            <div class="logo-container mb-2">
                                <img src="<?= base_url('assets/templateV3/img/avatar.png') ?>" alt="">
                            </div>
                            <h4 class="h1-seo">Loginho</h4>
                        </div>
                        <div class="content">
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons users_circle-08"></i>
                                </span>
                                <input type="email" class="form-control" id="email" name="email" placeholder="E-mail">
                            </div>
                            <div class="input-group form-group-no-border input-lg">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons text_caps-small"></i>
                                </span>
                                <input type="password" id="senha" name="senha" placeholder="Senha" class="form-control" />
                            </div>
                        </div>
                        <div class="footer text-center">
                            <input type="submit" class="btn btn-primary btn-round btn-lg btn-block" value="Login">
                        </div>
                        <div class="pull-left">
                            <h6>
                                <a href="<?= base_url('Portal/register') ?>" class="link">Criar conta</a>
                            </h6>
                        </div>
                        <div class="pull-right">
                            <h6>
                                <a href="<?= base_url('Portal/forgot') ?>" class="link">Esqueceu a Senha</a>
                            </h6>
                        </div>
                    </form>
                </div>
            </div>
        </div>