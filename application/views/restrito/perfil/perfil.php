          <section id="main-content">
            <div class="row">
              <div class="col-lg-12">
                <div class="card">
                  <div class="card-body">
                    <div class="user-profile">
                      <div class="row">
                        <div class="col-lg-8">
                          <div class="user-profile-name"><?= $usuario->nome ?></div>
                          <!--<div class="user-Location"><i class="ti-location-pin"></i> New York, New York</div>-->
                          <div class="user-job-title"><?= $usuario->ativo == "a" ? "Ativo" : "Desativado" ?></div>

                          <div class="custom-tab user-profile-tab">
                            <ul class="nav nav-tabs" role="tablist">
                              <li role="presentation" class="active">Sobre</li>
                            </ul>
                            <div class="tab-content">
                              <div role="tabpanel" class="tab-pane active" id="1">
                                <div class="contact-information">
                                  <h4>Informação de Contato</h4>
                                  <div class="phone-content">
                                    <span class="contact-title">Telefone de Contato:</span>
                                    <span class="phone-number"><?= $usuario->telefone ?></span>
                                  </div>
                                  <div class="address-content">
                                    <span class="contact-title">Endereço Completo:</span>
                                    <span class="mail-address"><?= $usuario->end_completo ?></span>
                                  </div>
                                  <div class="email-content">
                                    <span class="contact-title">Email:</span>
                                    <span class="contact-email"><?= $usuario->email ?></span>
                                  </div>
                                </div>
                                <div class="basic-information">
                                  <h4>Informação Basica</h4>
                                  <div class="birthday-content">
                                    <span class="contact-title">Data de Cadastro:</span>
                                    <span class="birth-date"><?= $usuario->dt_cadastro ?> </span>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <a href="<?= base_url('Perfil/edit'); ?>" class="btn btn-primary btn-outline btn-rounded">Editar Perfil</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /# row -->
            <div class="row">
              <div class="col-lg-6">
                <div class="card">
                  <div class="card-title">
                    <h4>Recent Project </h4>

                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-hover ">
                        <thead>
                          <tr>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Price</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>Kolor Tea Shirt For Man</td>
                            <td><span class="badge badge-primary">Ongoing</span></td>
                            <td>January 22</td>
                            <td class="color-primary">$21.56</td>
                          </tr>
                          <tr>
                            <td>Kolor Tea Shirt For Women</td>
                            <td><span class="badge badge-success">Complete</span></td>
                            <td>January 30</td>
                            <td class="color-success">$55.32</td>
                          </tr>
                          <tr>
                            <td>Blue Backpack For Baby</td>
                            <td><span class="badge badge-danger">Rejected</span></td>
                            <td>January 25</td>
                            <td class="color-danger">$14.85</td>
                          </tr>
                          <tr>
                            <td>Kolor Tea Shirt For Man</td>
                            <td><span class="badge badge-pr
                              imary">Ongoing</span></td>
                            <td>January 22</td>
                            <td class="color-primary">$21.56</td>
                          </tr>
                          <tr>
                            <td>Kolor Tea Shirt For Women</td>
                            <td><span class="badge badge-success">Complete</span></td>
                            <td>January 30</td>
                            <td class="color-success">$55.32</td>
                          </tr>
                          <tr>
                            <td>Blue Backpack For Baby</td>
                            <td><span class="badge badge-danger">Rejected</span></td>
                            <td>January 25</td>
                            <td class="color-danger">$14.85</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <a href="<?= base_url('Empresa/add'); ?>" class="btn btn-primary btn-outline btn-rounded">Add Empresa</a>
                  </div>
                </div>
              </div>
              <!-- /# column -->
              <div class="col-lg-6">
                <div class="card">
                  <div class="card-title">
                    <h4>Recent Comments </h4>

                  </div>
                  <div class="recent-comment">
                    <div class="media">
                      <div class="media-left">
                        <a href="#"><img class="media-object" src="assets/images/avatar/1.jpg" alt="..."></a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading">john doe</h4>
                        <p>Cras sit amet nibh libero, in gravida nulla. </p>
                        <div class="comment-action">
                          <div class="badge badge-success">Approved</div>
                          <span class="m-l-10">
                          <a href="#"><i class="ti-check color-success"></i></a>
                          <a href="#"><i class="ti-close color-danger"></i></a>
                          <a href="#"><i class="fa fa-reply color-primary"></i></a>
                        </span>
                        </div>
                        <p class="comment-date">October 21, 2017</p>
                      </div>
                    </div>
                    <div class="media">
                      <div class="media-left">
                        <a href="#"><img class="media-object" src="assets/images/avatar/2.jpg" alt="..."></a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading">Mr. John</h4>
                        <p>Cras sit amet nibh libero, in gravida nulla. </p>
                        <div class="comment-action">
                          <div class="badge badge-warning">Pending</div>
                          <span class="m-l-10">
                          <a href="#"><i class="ti-check color-success"></i></a>
                          <a href="#"><i class="ti-close color-danger"></i></a>
                          <a href="#"><i class="fa fa-reply color-primary"></i></a>
                        </span>
                        </div>
                        <p class="comment-date">October 21, 2017</p>
                      </div>
                    </div>
                    <div class="media no-border">
                      <div class="media-left">
                        <a href="#"><img class="media-object" src="assets/images/avatar/3.jpg" alt="..."></a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading">Mr. John</h4>
                        <p>Cras sit amet nibh libero, in gravida nulla. </p>
                        <div class="comment-action">
                          <div class="badge badge-danger">Rejected</div>
                          <span class="m-l-10">
                          <a href="#"><i class="ti-check color-success"></i></a>
                          <a href="#"><i class="ti-close color-danger"></i></a>
                          <a href="#"><i class="fa fa-reply color-primary"></i></a>
                        </span>
                        </div>
                        <div class="comment-date">October 21, 2017</div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /# card -->
              </div>
              <!-- /# column -->
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="footer">
                  <p>2018 © Admin Board. - <a href="#">example.com</a></p>
                </div>
              </div>
            </div>
          </section>