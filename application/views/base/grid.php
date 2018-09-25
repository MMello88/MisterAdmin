                <?php if($this->session->flashdata("msg_flash") !== null) : ?>
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Yes!</strong> <?= $this->session->flashdata("msg_flash") ?>
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
                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-title">
                                    <h4> <?= $set_config['table']['display']; ?> </h4>
                                    <div class="my-3">
                                        <a href="<?= base_url("$segment_class/$segment_funct/add"); ?>" class="btn btn-primary btn-outline btn-rounded">Add <?= $set_config['table']['display']; ?></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                <?php 
                                                    foreach ($set_config['columns'] as $campo => $config) {
                                                        if(isset($config['display_grid']) && $config['display_grid'] == 'true')
                                                            echo "<th>". $config['display_column'] ."</th> ";
                                                    }
                                                    echo "<th>#</th>";
                                                ?>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php 
                                                    $chave = $set_config['table']['chave_pk'];
                                                    foreach ($rows as $obj) {
                                                        echo "<tr>";
                                                        foreach ($set_config['columns'] as $campo => $config)
                                                            if(isset($config['display_grid']) && $config['display_grid'] == 'true')
                                                                echo "<td>". $obj->$campo ."</td>"; 
                                                        echo "<td>
                                                            <span>
                                                                <a href='".base_url("$segment_class/$segment_funct/view/".$obj->$chave)."'><i class='ti-eye color-primary m-l-6' title='Visualizar'></i></a>
                                                                <a href='".base_url("$segment_class/$segment_funct/edit/".$obj->$chave)."'><i class='ti-pencil color-success m-l-6' title='Editar'></i></a>
                                                                <a href='".base_url("$segment_class/$segment_funct/delete/".$obj->$chave)."'><i class='ti-close color-danger m-l-6' title='Deletar'></i></a>
                                                                
                                                            </span>
                                                        </td>";
                                                        echo "</tr>";
                                                    } 
                                                ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <!-- /# column -->
                    </div>
                </section>