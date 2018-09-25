                <?php $obj = $rows[0]; ?>
                <?php $chave = $set_config['table']['chave_pk'] ?>
                
				<section id="main-content">
					<div class="row">
              <?php if(isset($success_message)) : ?>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                  <strong>Yes!</strong> <?= $success_message ?>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
              <?php endif; ?>
               <?php if(isset($erro_message)) : ?>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                  <strong>Ops!</strong> <?= $erro_message ?>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
              <?php endif; ?>
	            <div class="col-lg-12">
                  <div class="card">
                  <?php if (validation_errors()) : ?>
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                      <strong>Ops!</strong> <?= validation_errors() ?>
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                  <?php endif; ?>
                      <div class="card-title">
                          <?= validation_errors() ?>
                          <h4>Deletar o Rigistro Id <?= $obj->$chave ?> da(o) <?= $set_config['table']['display'] ?></h4>
                      </div>
                      <div class="sweetalert m-t-15">
                          <button type="button" class="btn btn-warning btn-outline btn-rounded" data-toggle="modal" data-target="#exampleModal">
                                Deletar
                          </button>
                          <a href="<?= base_url("$segment_class/$segment_funct"); ?>" class="btn btn-primary btn-outline btn-rounded">Voltar</a>
                      </div>
                  </div>
              </div>
					</div>
				</section>




                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Deletar</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <h6>Confirmar o Delete do Registro</h6>
                      </div>
                      <div class="modal-footer">
                        <?php $id = $set_config['layout']['value']; ?>
                        <?= form_open("$segment_class/$segment_funct/delete/$id") ?>
                            <input type="hidden" name="<?= $chave ?>" value="<?= $obj->$chave ?>">
                            <button type="submit" class="btn btn-danger btn-outline btn-rounded">Deletar</button>
                            <button type="button" class="btn btn-secondary btn-outline btn-rounded" data-dismiss="modal">Cancelar</button>
                        <?= form_close(); ?>
                      </div>
                    </div>
                  </div>
                </div>