          <?php $obj = isset($rows[0]) ? $rows[0] : new stdClass(); ?>
          <section id="main-content">
            <div class="row">
              <div class="col-lg-12">
                <div class="card">
                  <div class="card-body">
                    <div class="user-profile">
                      <div class="row">
                        <div class="col-lg-8">
                          <div class="user-profile-name"><?= $set_config['table']['display'] ?></div>

                          <div class="custom-tab user-profile-tab">
                            <ul class="nav nav-tabs" role="tablist">
                              <li role="presentation" class="active">Dados da(o) <?= $set_config['table']['display'] ?></li>
                            </ul>
                            <div class="tab-content">
                              <div role="tabpanel" class="tab-pane active" id="1">
                                <div class="contact-information">
                                  <?php 
                                    foreach ($set_config['columns'] as $campo => $config){
                                      $value = isset($obj->$campo) ? $obj->$campo : "";
                                      if((isset($config['select']) && !empty($config['select'])) && !empty($value)){
                                        $value = $config['select'][$value];
                                      }
                                      
                                      echo "<div class='basic-information'>";
                                      echo "  <span class='contact-title'>".$config['display_column'].":</span>";
                                      echo "  <span class='phone-number'>".$value."</span>";
                                      echo "</div>";
                                    }
                                  ?>
                                  </div>
                                </div>                                
                              </div>
                            </div>
                            <a href="<?= base_url("$PagAnterior"); ?>" class="btn btn-primary btn-outline btn-rounded">Voltar</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>