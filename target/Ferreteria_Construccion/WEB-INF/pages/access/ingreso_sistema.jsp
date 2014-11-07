<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>OneClick | Ingresar</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,400,600,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="resources/css/custom-style.css">
</head>
<body>
	<%@ include file="../client/inc/header.jsp"%>

	<div class="container">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>Ingrese al sistem y empieze a comprar!</strong>
				</h3>
			</div>
			<div class="panel-body">

				<div class="row">

					<div class="col-xs-12 col-sm-6">
						<div id="alert-message">${error }</div>
						<form action="j_spring_security_check" method="POST"
							class="form-horizontal">
							<fieldset>

								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-4 control-label" for="username">Email</label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> @ </span> <input
												name="j_username" type="text" class="form-control"
												placeholder="Email" />

										</div>

									</div>
								</div>

								<!-- Password input-->
								<div class="form-group">
									<label class="col-md-4 control-label" for="password">Password</label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-asterisk"></span>
											</span> <input name="j_password" type="password"
												class="form-control" placeholder="Password" />

										</div>

									</div>
								</div>

								<!-- INGRESAR AL SISTEMA -->
								<div class="form-group">
									<label class="col-md-4 control-label" for="ingresar"></label>
									<div class="col-md-4">
										<button type="submit" id="ingresar" name="ingresar"
											class="btn btn-inverse">Ingresar</button>
									</div>
								</div>

							</fieldset>
						</form>

					</div>

					<div class="col-xs-12 col-sm-6">

						<p>No tienes una cuenta??</p>
						<a href="registrarse">Create una con simples pasos!</a>
					</div>
				</div>


			</div>
		</div>
	</div>


	<%@ include file="../client/inc/footer.jsp"%>
	<script src="resources/js/jquery-1.2.11.0.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

</body>
</html>