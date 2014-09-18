<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<link rel="stylesheet" href="resources/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="page-header">
			<img width="400" alt="No se encontro"
				src="resources/img/OneClick.png">
		</div>
	</div>

	<div class="container">

		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">

				<form action="j_spring_security_check" method="POST"
					class="form-signin" role="form">
					<h2 class="form-signin-heading">Ingrese</h2>
					<input name="j_username" type="text" class="form-control"
						placeholder="Username" required autofocus> <input
						name="j_password" type="password" class="form-control"
						placeholder="Password" required>
					<div class="checkbox">
						<label> <input type="checkbox" value="remember-me">
							Remember me
						</label>
					</div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
				</form>


				<div>${error }</div>

				<!-- </div>
	<form action="j_spring_security_check" method="POST">
		<input name="j_username"> <input name="j_password"> <input
			type="submit" value="Ingresar">
	</form>
	<div>${error}</div> -->
			</div>
		</div>
	</div>
</body>
</html>