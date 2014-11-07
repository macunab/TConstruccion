<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>OneClick | Cambio password</title>
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
					<strong>Cambio de password de cuenta</strong>
				</h3>
			</div>
			<div class="panel-body">

				<div class="row">

					<div class="col-xs-12 col-sm-6">
						<form:form id="formulario-password" class="form-horizontal">
							<fieldset>

								<!-- Password actual input-->
								<div class="form-group" id="passwordActualControlGroup">
									<label class="col-md-4 control-label" for="passwordActual">Password
										actual</label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-asterisk"></span>
											</span> <input type="password" class="form-control"
												placeholder="Password" id="passwordActual"
												name="passwordActual" />

										</div>
										<span class="help-inline"><form:errors
												path="passwordActual" /></span>
									</div>
								</div>

								<!-- Password nuevo input-->
								<div class="form-group" id="passwordNuevoControlGroup">
									<label class="col-md-4 control-label" for="passwordNuevo">Password
										nuevo</label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-asterisk"></span>
											</span> <input type="password" class="form-control"
												placeholder="Password" id="passwordNuevo"
												name="passwordNuevo" />

										</div>
										<span class="help-inline"><form:errors
												path="passwordNuevo" /></span>
									</div>
								</div>

								<!--Repeat password input-->
								<div class="form-group" id="passwordRepeatControlGroup">
									<label class="col-md-4 control-label" for="passwordRepeat">Repetir
										password</label>
									<div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon"> <span
												class="glyphicon glyphicon-asterisk"></span>
											</span> <input type="password" class="form-control"
												placeholder="Password" id="passwordRepeat"
												name="passwordRepeat" />

										</div>
										<span class="help-inline"><form:errors
												path="passwordRepeat" /></span>
									</div>
								</div>
								<!-- INGRESAR AL SISTEMA -->
								<div class="form-group">
									<label class="col-md-4 control-label" for="registrarse"></label>
									<div class="col-md-4">
										<button type="submit" id="registrarse" name="registrarse"
											class="btn btn-inverse">Guardar</button>
									</div>
								</div>

							</fieldset>
						</form:form>

					</div>

					<div class="col-xs-0 col-sm-6 hidden-xs">

						<h3>Facil y seguro</h3>
						<p>Cambie rapidamente de password para mantener la seguridad
							de su cuenta , simplemente ingrese su password actual y el
							password que desee en las casillas correspondiente</p>

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
	<script>
		function collectFormData(fields) {
			var data = {};
			for (var i = 0; i < fields.length; i++) {
				var $item = $(fields[i]);
				data[$item.attr('name')] = $item.val();
			}

			return data;
		}

		$(document)
				.ready(
						function() {

							var $form = $('#formulario-password');
							$form
									.bind(
											'submit',
											function(e) {
												// Ajax validation
												var $inputs = $form
														.find('input');
												var data = collectFormData($inputs);

												$
														.post(
																'cambio_passwd',
																data,
																function(
																		response) {
																	$form
																			.find(
																					'.form-group')
																			.removeClass(
																					'has-error');
																	$form
																			.find(
																					'.help-inline')
																			.empty();

																	if (response.status == 'FAIL') {
																		for (var i = 0; i < response.errorMessageList.length; i++) {
																			var item = response.errorMessageList[i];
																			var $controlGroup = $('#'
																					+ item.fieldName
																					+ 'ControlGroup');

																			$controlGroup
																					.addClass('has-error');
																			$controlGroup
																					.find(
																							'.help-inline')
																					.html(
																							item.message);

																		}
																	} else {

																		window.location.href = "1";
																	}
																}, 'json');

												e.preventDefault();
												return false;
											});
						});
	</script>
</body>
</html>