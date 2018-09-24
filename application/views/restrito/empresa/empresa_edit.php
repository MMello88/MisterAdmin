          <section id="main-content">
            <div class="row">
              <div class="col-lg-12">
                <div class="card">
                  <div class="card-body">
                    <div class="user-profile">
                      <div class="row">
                        <div class="col-lg-8">
                          <div class="user-profile-name">Cadastro de Empresa</div>


                          <div class="custom-tab user-profile-tab">
                            <ul class="nav nav-tabs" role="tablist">
                              <li role="presentation" class="active">Empresa</li>
                            </ul>
                            
                            <?php if(isset($msg_result)) : ?>
                              <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <strong>Ops!</strong> <?= $msg_result ?>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
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
                            <div class="tab-content mt-3">
                              <div role="tabpanel" class="tab-pane active" id="1">
                              <?php if (isset($usuario)) : ?>
                                <?= form_open('Empresa/salvar'); ?>
                                  <input type="hidden" name="id_usuario" value="<?= $usuario->id_usuario ?>">
                                  <input type="hidden" name="nome" value="<?= $usuario->nome ?>">
                                  <div class="contact-information">
                                    
                                    <div class="phone-content">
                                      <span class="contact-title pb-1">Telefone de Contato:</span>
                                      <input type="text" class="form-control" name="telefone" id="telefone" value="<?= $usuario->telefone ?>">
                                    </div>
                                    <div class="address-content mt-2">
                                      <span class="contact-title pb-1">Endereço Completo:</span>
                                      <input type="text" class="form-control" name="end_completo" id="end_completo" value="<?= $usuario->end_completo ?>">
                                    </div>
                                    <div class="email-content mt-3">
                                      <span class="contact-title">Email:</span>
                                      <span class="contact-email"><?= $usuario->email ?></span>
                                    </div>
                                  </div>
                                  <a href="<?= base_url('Perfil'); ?>" class="btn btn-default btn-outline btn-rounded">Cancelar</a>
                                  <button type="submit" class="btn btn-warning btn-outline btn-rounded">Salvar</button>
                                
                                <?= form_close(); ?>
                              <?php endif; ?>
                              </div>
                                
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>