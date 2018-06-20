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
			  <strong>Wow!</strong> <?= $error ?>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
		<?php endif; ?>
		<div class="card card-register mx-auto mt-5">
	      <div class="card-header">Register an Account</div>
	      <div class="card-body">
			<?= form_open() ?>
				<div class="form-group">
					<label for="username">Username</label>
					<input type="text" class="form-control" id="username" name="username" placeholder="Enter a username" required>
				</div>
				<div class="form-group">
					<label for="email">Email</label>
					<input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
				</div>
				<div class="form-group">
					<div class="form-row">
              			<div class="col-md-6">
							<label for="password">Password</label>
							<input type="password" class="form-control" id="password" name="password" placeholder="Enter a password" required>
						</div>
						<div class="col-md-6">
							<label for="password_confirm">Confirm password</label>
							<input type="password" class="form-control" id="password_confirm" name="password_confirm" placeholder="Confirm your password" required>
						</div>
					</div>
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-primary btn-block" value="Register">
				</div>
			</form>
        <div class="text-center">
          <a class="d-block small mt-3" href="login">Login Page</a>
          <a class="d-block small" href="forgot-password">Forgot Password?</a>
        </div>
      </div>
    </div>
</div><!-- .container -->