<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneClick | Registrarse</title>
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
					<strong>Registro de cuenta nueva</strong>
				</h3>
			</div>
			<div class="panel-body">

				<div class="row">

					<div class="col-xs-12 col-sm-6">
						<div class="alert alert-success text-center" role="alert">
						<strong>Ok</strong> <p> Cuenta creada con exito!!!!</p>
						</div>
					</div>

					<div class="col-xs-0 col-sm-6 hidden-xs">

						<h3>Empeza a comprar!</h3>
						<p>Acabas de registrarte con exito en OneClick.com, te hemos enviado 
						un mail al correo que proporcionaste durante la creacion de la cuenta
						para completar el proceso de creacion activa tu cuenta desde el mail que te enviamos,
						o sigue navegando por OneClick en busca del articulos que deseas!</p>
						<a href="1" >Seguir navegando</a>
 
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