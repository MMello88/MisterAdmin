<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="container pt-3">
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
	<div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        
        <?= form_open() ?>
			<div class="form-group">
				<label for="user">E-mail</label>
				<input type="text" class="form-control" id="user" name="user" placeholder="Seu Usuário" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="Sua Senha" required>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block" value="Login">
			</div>
		</form>

        <!--<div class="text-center">
          <a class="d-block small mt-3" href="register">Register an Account</a>
          <a class="d-block small" href="forgot-password">Forgot Password?</a>
        </div>-->
      </div>
    </div>
</div><!-- .container -->