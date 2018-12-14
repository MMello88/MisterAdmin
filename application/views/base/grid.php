                <?php if($this->session->flashdata("msg_flash") !== null) : ?>
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Yes!</strong> <?= $this->session->flashdata("msg_flash") ?>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                <?php endif; ?>
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
              
                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-title">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <h4> <?= $set_config['table']['display']; ?> </h4>
                                            <div class="my-3">
                                                <a href="<?= base_url("$segment_class/$segment_funct/{$link_chave_pai}add"); ?>" class="btn btn-primary btn-outline btn-rounded">Add <?= $set_config['table']['display']; ?></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 ml-auto">
                                            <?= form_open(base_url("$segment_class/$segment_funct/{$link_chave_pai}search")); ?>
                                                <div class="row">
                                                    <div class="col-5">
                                                        <select class="form-control" name="search_field">
                                                            <?php 
                                                                echo "<option value=''>Pesquisar por: </option>";
                                                                foreach ($set_config['columns'] as $campo => $conf) {
                                                                    if ($conf['display_grid'] == 'TRUE') {
                                                                        echo "<option value='$campo'>".$conf['display_column']."</option>";
                                                                    }
                                                                }
                                                            ?>
                                                            
                                                        </select>
                                                    </div>
                                                    <div class="col-7">
                                                        <div class="input-group input-group-default">
                                                            <input type="text" placeholder="Search Default" name="search_value" class="form-control">
                                                            <span class="input-group-btn btn-group-right"><button class="btn btn-primary" type="submit"><i class="ti-search"></i></button></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?= form_close(); ?>
                                            <?php 
                                                if ($this->set_config['layout']['view'] == 'search') {
                                                    echo "
                                                    <div class='d-flex justify-content-end mt-3'>
                                                        <a href='".base_url("$segment_class/$segment_funct/$link_chave_pai")."' class='btn btn-danger btn-outline btn-rounded'>Limpar Pesquisa</a>
                                                    </div>";
                                                }
                                            ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                <?php 
                                                    foreach ($set_config['columns'] as $campo => $config) {
                                                        if(isset($config['display_grid']) && $config['display_grid'] === 'TRUE')
                                                            echo "<th>". $config['display_column'] ."</th> ";
                                                    }
                                                    echo "<th>#</th>";
                                                ?>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php 
                                                    $chave = $set_config['table']['chave_pk'];
                                                    if(isset($rows)){
                                                        foreach ($rows as $obj) {
                                                            echo "<tr>";
                                                            foreach ($set_config['columns'] as $campo => $config)
                                                                if(isset($config['display_grid']) && $config['display_grid'] == 'TRUE'){   
                                                                    if((isset($config['select']) && !empty($config['select']) && !empty($obj->$campo))) {
                                                                        $campo_calculado = isset($config['select'][$obj->$campo]) ? $config['select'][$obj->$campo] : "Codigo não Encontrado";
                                                                        echo "<td>". $campo_calculado ."</td>";
                                                                    } else {
                                                                        echo "<td>". $obj->$campo ."</td>";
                                                                    }
                                                                }
                                                            echo "<td>
                                                                <span>
                                                                    <a href='".base_url("$segment_class/$segment_funct/{$link_chave_pai}view/".$obj->$chave)."'><i class='ti-eye color-primary m-l-6' title='Visualizar'></i></a>
                                                                    <a href='".base_url("$segment_class/$segment_funct/{$link_chave_pai}edit/".$obj->$chave)."'><i class='ti-pencil color-success m-l-6' title='Editar'></i></a>
                                                                    <a href='".base_url("$segment_class/$segment_funct/{$link_chave_pai}delete/".$obj->$chave)."'><i class='ti-close color-danger m-l-6' title='Deletar'></i></a>";
                                                            if(isset($set_config['dropdown']) && !empty($set_config['dropdown'])){
                                                                echo "
                                                                        <div class='btn-group m-l-6'>
                                                                          <button type='button' class='btn btn-info dropdown-toggle btn-sm' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                                                                            Mais
                                                                          </button>
                                                                          <div class='dropdown-menu'>
                                                                        ";
                                                                foreach ($set_config['dropdown'] as $dropdown) {
                                                                    
                                                                      $function = $dropdown['function'];
                                                                      if(is_array($dropdown['param'])){
                                                                          $param = "";
                                                                          foreach($dropdown['param'] as $value_param)
                                                                            $param .= $obj->$value_param . "/";
                                                                      } else {
                                                                        $param = $dropdown['param'];
                                                                        if(!empty($param))
                                                                            $param = $obj->$param;
                                                                      }
                                                                      $link = base_url("$segment_class/$function/$param");
                                                                      $display = $dropdown['display'];
                                                                      echo "<a class='dropdown-item' href='$link'>$display</a>
                                                                        <div class='dropdown-divider'></div>";
                                                                  }
                                                                echo "  </div>
                                                                  </div>";
                                                            }
                                                            echo "  
                                                                    </span>
                                                                </td>
                                                            </tr>";
                                                        }
                                                    }
                                                ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                
                                <nav>
                                  <ul class="pagination">
                                    <?php echo $this->pagination->create_links(); ?>
                                  </ul>
                                </nav>
                            </div>
                        </div>
                       
                        <!-- /# column -->
                    </div>
                </section>