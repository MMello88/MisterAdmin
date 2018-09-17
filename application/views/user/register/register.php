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
                <div class="card card-login card-plain">
                    <?= form_open("", array("class" => "form")) ?>
                        <div class="header header-primary text-center">
                            <div class="logo-container">
                                <img src="<?= base_url('assets/templateV3/img/avatar.png') ?>" alt="">
                            </div>
                        </div>
                        <div class="content">
                
                        	<div class="form-group form-group-no-border input-lg">
								<label for="username">Nome</label>
								<input type="text" class="form-control" id="username" name="username" placeholder="Informe seu Nome" required>
							</div>
							<div class="form-group form-group-no-border input-lg">
								<label for="email">E-mail</label>
								<input type="email" class="form-control" id="email" name="email" placeholder="Informe seu E-mail" required>
							</div>
							<div class="form-group form-group-no-border input-lg">
								<div class="form-row">
			              			<div class="col-md-6">
										<label for="password">Senha</label>
										<input type="password" class="input-lg form-control" id="password" name="password" placeholder="Informe sua Senha" required>
									</div>
									<div class="col-md-6">
										<label for="password_confirm">Confirmar Senha</label>
										<input type="password" class="form-control" id="password_confirm" name="password_confirm" placeholder="Confirma a Senha" required>
									</div>
								</div>
							</div>
							<div class="form-group input-lg">
								<input type="submit" class="btn btn-primary btn-round btn-block" value="Register">
							</div>

                            
                        </div>

                    </form>
                </div>
            </div>
        </div>