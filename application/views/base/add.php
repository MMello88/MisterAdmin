                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">

                                <div class="card-title">
                                    <h4>Formulário de Cadastro de <?= $set_config['table']['display']; ?></h4>
                                </div>
                                <div class="card-body">
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
                                    <?php if (validation_errors()) : ?>
                                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                      <strong>Ops!</strong> <?= validation_errors() ?>
                                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                      </button>
                                    </div>
                                  <?php endif; ?>
                                    <div class="basic-form">
                                        <?= form_open("$segment_class/$segment_funct/add") ?>
                                        <?php
                                          foreach ($set_config['columns'] as $campo => $config){
                                            $value = "";
                                            if(validation_errors())
                                              $value = set_value($campo);
                                            if (isset($config['default_value']))
                                              $value = $config['default_value'];

                                            echo "<div class='form-group'>";
                                            if ((isset($config['input']['type']) && $config['input']['type'] !== "hidden") || (isset($config['select'])))
                                              echo "  <label>".$config['display_column']."</label>";

                                            if(isset($config['input']))
                                            {
                                                echo "  <input type='".$config['input']['type']."' 
                                                               class='form-control'
                                                               name='".$campo."'
                                                               placeholder='".$config['display_column']."' 
                                                               value='".$value."' 
                                                               ".$config['input']['required'].">";
                                            }
                                            if(isset($config['select']))
                                            {
                                              echo "<select class='custom-select' name='$campo'>";
                                              echo "<option value=''></option>";
                                                foreach ($config['select'] as $key_option => $val_option) {
                                                  if($value === $key_option)
                                                    echo "<option value='$key_option' selected>$val_option</option>";
                                                  else
                                                    echo "<option value='$key_option'>$val_option</option>";
                                                }
                                              echo "</select>";
                                            }

                                            if(form_error($campo) !== null)
                                                echo "<div class='invalid-feedback d-block'>
                                                        ".form_error($campo, '<p class="text-danger">', '</p>')."
                                                      </div>";
                                            echo "</div>";
                                          }
                                        ?>
                                            <input type="submit" class="btn btn-success btn-outline btn-rounded" name="btnSalvar" value="Salvar">
                                            <input type="submit" class="btn btn-success btn-outline btn-rounded" name="btnSalvarVoltar" value="Salvar e Voltar">
                                            <a href="<?= base_url("$segment_class/$segment_funct"); ?>" class="btn btn-primary btn-outline btn-rounded">Voltar</a>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>