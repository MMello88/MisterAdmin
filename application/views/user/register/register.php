<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
		<div class="page-header-image" style="background-image:url(<?= base_url('assets/templateV3/img/header.jpg') ?>)"></div>
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
            <?php if (isset($erro_cadastro)) : ?>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                  <strong>Ops!</strong> <?= $erro_cadastro ?>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
            <?php endif; ?>
                <div class="card card-login card-plain">
                    <?= form_open("Portal/register", array("class" => "form")) ?>
                        <div class="header header-primary text-center">
                            <div class="logo-container mb-2">
                                <img src="<?= base_url('assets/templateV3/img/avatar.png') ?>" alt="">
                            </div>
                            <h4 class="h1-seo">Registra-se</h4>
                        </div>
                        <div class="content">
                        	<div class="form-group form-group-no-border input-lg">
								<label for="nome">Nome</label>
								<input type="text" class="form-control" id="nome" name="nome" placeholder="Informe seu Nome" required>
							</div>
							<div class="form-group form-group-no-border input-lg">
								<label for="email">E-mail</label>
								<input type="email" class="form-control" id="email" name="email" placeholder="Informe seu E-mail" required>
							</div>
							<div class="form-group form-group-no-border input-lg">
								<div class="form-row">
			              			<div class="col-md-6">
										<label for="senha">Senha</label>
										<input type="password" class="input-lg form-control" id="senha" name="senha" placeholder="Informe sua Senha" required>
									</div>
									<div class="col-md-6">
										<label for="resenha">Confirmar Senha</label>
										<input type="password" class="form-control" id="resenha" name="resenha" placeholder="Confirma a Senha" required>
									</div>
								</div>
							</div>
							<div class="form-group input-lg mt-3">
								<input type="submit" class="btn btn-primary btn-round btn-block" value="Register">
							</div>
                        </div>
                    </form>
                </div>
            </div>
        </div>