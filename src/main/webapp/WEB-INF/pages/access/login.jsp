<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Login/Registro - Client/Admin -->
<!-- author : Marco, Acuna -->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="resources/css/bootstrap.min.css" media="screen" />
<link href="resources/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="resources/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="resources/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<!-- Google-code-prettify -->
<link href="resources/js/google-code-prettify/prettify.css"
	rel="stylesheet" />
<style type="text/css" id="enject"></style>

<!-- Javascripts -->
<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>

<script src="resources/js/bootshop.js"></script>
<script src="resources/js/jquery.lightbox-0.5.js"></script>
</head>
<body>

	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row"></div>
			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="1"><img width="100"
						src="resources/img/OneClick-3.png" alt="Bootsshop" /></a>
					<form class="form-inline navbar-search" method="post"
						action="products.html">
						<input id="srchFld" class="srchTxt" type="text" /> <select
							class="srchTxt">
							<option>All</option>
							<c:forEach items="${categorias }" var="categoria">
								<option>${categoria.nombre }</option>
							</c:forEach>
						</select>
						<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
					</form>
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a href="#">Productos</a></li>
						<li class=""><a href="#">Empresa</a></li>
						<li class=""><a href="contact">Contacto</a></li>
						<li class=""><a href="login" role="button"
							data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-success">Login</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End====================================================================== -->
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">

					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<c:forEach items="${categorias }" var="categoria">
							<li class="subMenu"><a> ${categoria.nombre}</a>
								<ul style="display: none">
									<c:forEach items="${categoria.subCategorias}"
										var="subCategoria">
										<li><a class="active" href="products.html"><i
												class="icon-chevron-right"></i>${subCategoria.nombre } </a></li>
									</c:forEach>
								</ul></li>
						</c:forEach>

					</ul>
					<br />


					<div class="thumbnail">
						<img src="resources/img/payment_methods.png"
							title="Bootshop Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Formas de pago</h5>
						</div>
					</div>
				</div>
				<!-- Sidebar end=============================================== -->
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="1">Home</a> <span class="divider">/</span></li>
						<li class="active">Login</li>
					</ul>
					<div id="error">${registro }</div>
					<h3>Login</h3>
					<hr class="soft" />

					<div class="row">
						<div class="span4">
							<div class="well">
								<h5>CREARSE UNA CUENTA</h5>
								<br /> Ingrese un email para crear una cuenta.<br /> <br /> <br />
								<form:form action="register_usuario" method="post"
									modelAttribute="usuario" id="add-user-form">
									<div class="control-group" id="usernameControlGroup">
										<label class="control-label" for="username">E-mail </label>
										<div class="controls">
											<form:input class="span3" path="username" type="text"
												id="username" placeholder="Email" />
											<span class="help-inline"><form:errors path="username" /></span>
											<!--<form:errors id="error_creacion" path="username" class="label label-danger" />-->
										</div>
									</div>
									<div class="controls">
										<button type="submit" class="btn block">Crear cuenta.
										</button>
									</div>
								</form:form>
							</div>
						</div>
						<div class="span1">&nbsp;</div>
						<div class="span4">
							<div class="well">
								<h5>YA ESTA REGISTRADO ?</h5>
								<form action="j_spring_security_check" method="POST">
									<div class="control-group">
										<label class="control-label" for="inputEmail1">Email</label>
										<div class="controls">
											<input name="j_username" class="span3" type="text"
												id="inputEmail1" placeholder="Username">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="inputPassword1">Password</label>
										<div class="controls">
											<input name="j_password" type="password" class="span3"
												id="inputPassword1" placeholder="Password">
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<button type="submit" class="btn">Ingresar</button>
											<a href="#">Olvido su contraseña?</a>
										</div>
									</div>
								</form>
								<div>${error }</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- MainBody End ============================= -->
	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="span3">
						<h5>INFORMACION</h5>
						<a href="contact.html">CONTACTO</a> <a href="register.html">REGISTRARSE</a>
						<a href="legal_notice.html">ASUNTOS LEGALES</a> <a href="tac.html">TERMINOS
							Y CONDICIONES</a> <a href="faq.html">FAQ</a>
					</div>
				</div>

				<div class="span3"></div>

			</div>
			<p class="pull-right">&copy; OneClick.com</p>
		</div>
		<!-- Container End -->
		<script type="text/javascript">
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
								var $form = $('#add-user-form');
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
																	'save_usuario',
																	data,
																	function(
																			response) {
																		$form
																				.find(
																						'.control-group')
																				.removeClass(
																						'error');
																		$form
																				.find(
																						'.help-inline')
																				.empty();
																		$form
																				.find(
																						'.alert')
																				.remove();

																		if (response.status == 'FAIL') {
																			for (var i = 0; i < response.errorMessageList.length; i++) {
																				var item = response.errorMessageList[i];
																				var $controlGroup = $('#'
																						+ item.fieldName
																						+ 'ControlGroup');

																				if (item.message == ' null') {
																					$controlGroup
																							.addClass('error');
																					$controlGroup
																							.find(
																									'.help-inline')
																							.html(
																									"El mail ya esta registrado en el sistema");

																				} else {
																					$controlGroup
																							.addClass('error');
																					$controlGroup
																							.find(
																									'.help-inline')
																							.html(
																									item.message);

																				}
																			}
																		} else {
																			var $alert = $('<div class="alert"></div>');
																			$alert
																					.html(response.result);
																			$alert
																					.prependTo($form
																							.find('fieldset'));
																		}
																	}, 'json');

													e.preventDefault();
													return false;
												});
							});
		</script>
	</div>
</body>
</html>