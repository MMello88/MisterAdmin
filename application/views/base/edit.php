                <?php $obj = isset($rows[0]) ? $rows[0] : new stdClass(); ?>
                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">

                                <div class="card-title">
                                    <h4>Formulário de Editção de <?= $set_config['table']['display']; ?></h4>
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
                                    <div class="basic-form">
                                        <?php $id = $set_config['layout']['value']; ?>
                                        <?= form_open("$segment_class/$segment_funct/{$link_chave_pai}edit/$id") ?>
                                        <?php
                                          foreach ($set_config['columns'] as $campo => $config)
                                          {
                                            $value = isset($obj->$campo) ? $obj->$campo : "";
                                            
                                            echo "<div class='form-group'>";
                                            if ((isset($config['input']) && $config['input']['type'] !== "hidden") || isset($config['select']))
                                              echo "  <label>".$config['display_column']."</label>";
                                            
                                            
                                            if(isset($config['select']) && !empty($config['select']))
                                            {
                                              echo "<select class='custom-select'
                                                            name='$campo'>";
                                              echo "<option value=''></option>";
                                                foreach ($config['select'] as $key_option => $val_option) {
                                                  if($value == $key_option)
                                                    echo "<option value='$key_option' selected>$val_option</option>";
                                                  else
                                                    echo "<option value='$key_option'>$val_option</option>";
                                                }
                                              echo "</select>";
                                            } else if(isset($config['input'])) {
                                                echo "  <input type='".$config['input']['type']."' 
                                                               class='form-control'
                                                               name='".$campo."'
                                                               placeholder='".$config['display_column']."'
                                                               value='".$value."' 
                                                               ".$config['input']['required'].">";
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
                                            <a href="<?= base_url("$PagAnterior"); ?>" class="btn btn-primary btn-outline btn-rounded">Voltar</a>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>