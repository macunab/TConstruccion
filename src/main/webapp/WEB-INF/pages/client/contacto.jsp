<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>OneClick | Contactenos</title>
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
					<strong>Pongamonos en contacto!</strong>
				</h3>
			</div>
			<div class="panel-body">

				<div class="row">

					<div class="col-xs-0 col-sm-2 hidden-xs">
						<h3>Donde nos podes encontar?</h3>
						<p>Estamos a un paso del centro de Cordoba.</p>
						<p>Rondo 145</p>
						<p>CA 5015</p>
						<p>Tel: (0351) 154456576</p>

					</div>
					<div class="col-xs-0 col-sm-2 hidden-xs">
						<h3>Horarios de atencion:</h3>
						<p>
							<strong>Lunes a Viernes</strong>
						</p>
						<p>09:00 am - 20:30 pm</p>
						<p>
							<strong>Sabados</strong>
						</p>
						<p>09:00 am - 14:30 pm</p>

					</div>


					<div class="col-xs-12 col-sm-8">
						<form:form action="contacto" id="formulario-contacto"
							method="POST" modelAttribute="contacto" class="form-horizontal">
							<fieldset>

								<!-- INPUT EMAIL-->
								<div class="form-group" id="nombreControlGroup">
									<label class="col-md-4 control-label" for="nombre"></label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-pencil"></span>
											</span>
											<form:input path="nombre" type="text" class="form-control"
												placeholder="Nombre" />
										</div>
										<span class="help-inline"><form:errors path="nombre" /></span>
									</div>
								</div>

								<!-- INPUT EMAIL-->
								<div class="form-group" id="emailControlGroup">
									<label class="col-md-4 control-label" for="email"></label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> @ </span>
											<form:input path="email" type="text" class="form-control"
												placeholder="Email" />
										</div>
										<span class="help-inline"><form:errors path="email" /></span>
									</div>
								</div>


								<!-- TEXTAREA MENSAJE -->
								<div class="form-group" id="mensajeControlGroup">
									<label class="col-md-4 control-label" for="mensaje"> </label>
									<div class="col-md-6">
										<form:textarea path="mensaje" rows="15" cols="40"
											class="form-control" id="mensaje" name="mensaje"></form:textarea>
										<span class="help-inline"><form:errors path="mensaje" /></span>
									</div>
								</div>

								<!-- INGRESAR AL SISTEMA -->
								<div class="form-group">
									<label class="col-md-4 control-label" for="enviar"></label>
									<div class="col-md-4">
										<button type="submit" id="enviar" name="enviar"
											class="btn btn-inverse">Enviar</button>
									</div>
								</div>

							</fieldset>
						</form:form>

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
	<script src="resources/js/ferreteria.js"></script>
	<ckeditor:replace replace="mensaje" basePath="resources/ckeditor/" />
</body>
</html>