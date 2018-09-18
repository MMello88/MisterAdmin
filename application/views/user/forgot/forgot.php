        <div class="page-header-image" style="background-image:url(<?= base_url('assets/templateV3/img/coxinha.png') ?>)"></div>
        <div class="container">
            <div class="col-md-4 content-center">
            <?php if (isset($email_nao_encontrado)) : ?>
                <div class="alert alert-danger alert-dismissible" id="message-danger" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true" class="closeX">&times;</span>
                    </button>
                    <p id="msgError"><?= $email_nao_encontrado ?></p>
                </div>
            <?php endif; ?>

            <?php if (isset($email_encontrado)) : ?>
                <div class="alert alert-success alert-dismissible" id="message-danger"  role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true" class="closeX">&times;</span>
                    </button>
                    <p id="msgError"><?= $email_encontrado ?></p>
                </div>
            <?php endif; ?>

            <?php if (isset($recuperado_sucesso)) : ?>
                <div class="alert alert-success alert-dismissible" id="message-danger" 
                    <?= isset($recuperado_sucesso) ? "" : "style=\"display: none;\""; ?> role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true" class="closeX">&times;</span>
                    </button>
                    <p id="msgError"><?= $recuperado_sucesso ?></p>
                </div>
            <?php endif; ?>

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

                    <?php if (empty($hash)) : ?>
                        <?= form_open("Portal/forgot", array("class" => "form")) ?>
                            <div class="header header-primary text-center">
                                <div class="logo-container mb-2">
                                    <img src="<?= base_url('assets/templateV3/img/avatar.png') ?>" alt="">
                                </div>
                                <h4 class="h1-seo">Recuperar Senha</h4>
                            </div>
                            <div class="content">
                                <div class="input-group form-group-no-border input-lg">
                                    <span class="input-group-addon">
                                        <i class="now-ui-icons users_circle-08"></i>
                                    </span>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="E-mail">
                                </div>
                                <div class="footer text-center">
                                    <input type="submit" class="btn btn-primary btn-round btn-lg btn-block" value="Recuperar">
                                </div>
                            </div>
                        </form>
                    <?php else : ?>
                        <?= form_open("Portal/forgot/$hash", array("class" => "form")) ?>
                            <div class="header header-primary text-center">
                                <div class="logo-container mb-2">
                                    <img src="<?= base_url('assets/templateV3/img/avatar.png') ?>" alt="">
                                </div>
                                <h4 class="h1-seo">Recuperar Senha</h4>
                            </div>
                            <div class="content">
                                <div class="input-group form-group-no-border input-lg">
                                    <span class="input-group-addon">
                                        <i class="now-ui-icons users_circle-08"></i>
                                    </span>
                                    <input type="password" class="form-control" id="senha" name="senha" placeholder="Informe a nova Senha">
                                </div>
                                <div class="footer text-center">
                                    <input type="submit" class="btn btn-primary btn-round btn-lg btn-block" value="Recuperar">
                                </div>
                            </div>
                        </form>
                    <?php endif; ?>
                </div>
            </div>
        </div>