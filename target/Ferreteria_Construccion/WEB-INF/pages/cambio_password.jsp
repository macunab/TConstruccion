<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Cambio de Password - Client -->
<!-- author : Marco, Acuna -->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneClick | Cambio password</title>

<link id="callCss" rel="stylesheet"
	href="resources/css/bootstrap.min.css" media="screen" />
<link href="resources/css/base.css" rel="stylesheet" media="screen" />

<link href="resources/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="resources/css/font-awesome.css" rel="stylesheet"
	type="text/css">


<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>

<script src="resources/js/bootshop.js"></script>
<script src="resources/js/jquery.lightbox-0.5.js"></script>
</head>
<body>
	
	
	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row"></div>

			
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
						<input id="nav-busqueda" class="srchTxt" type="text" /> <select
							class="srchTxt" id="categorias">
							<option value="All">All</option>
							<c:forEach items="${categorias }" var="categoria">
								<option value="${categoria.nombre }">${categoria.nombre }</option>
							</c:forEach>
						</select>
						<button type="button" id="submitButton" class="btn btn-primary"
							onClick="buscar()">Go</button>
					</form>
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a href="sendAccount">Productos</a></li>
						<li class=""><a href="#">Empresa</a></li>
						<li class=""><a href="contacto">Contacto</a></li>
						<sec:authorize access="hasRole('ROLE_CLIENTE')">
							<li><a href="j_spring_security_logout">Salir</a></li>

						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<li class=""><a href="login" role="button"
								style="padding-right: 0"><span
									class="btn btn-large btn-success">Ingresar</span></a></li>
						</sec:authorize>

					</ul>
				</div>
			</div>
		</div>
	</div> -->
<%@ include file="header.jsp"%>
<!-- Header End====================================================================== -->

<!-- MAIN BEGIN -->
<div id="mainBody">
	<div class="container">
		<div class="row">

			<!-- Sidebar ================================================== -->
			<%@ include file="side_bar.jsp"%>
			<!-- Sidebar end=============================================== -->

			<div id="main-articulos" class="span9">
				<ul class="breadcrumb">
					<li><a href="1">Home</a> <span class="divider">/</span></li>
					<li class="active">Cambiar Contraseña</li>
				</ul>
				<h3>Cambio de Contraseña</h3>
				<hr class="soft" />
				<div class="well">
					<form:form id="change-password-form" class="form-horizontal">

						<div class="control-group" id="passwordActualControlGroup">
							<label class="control-label" for="passwordActual">Password
								Actual <sup>*</sup>
							</label>
							<div class="controls">
								<input type="text" id="passwordActual" name="passwordActual"
									placeholder="Contraseña actual"> <span
									class="help-inline"><form:errors path="username" /></span>
							</div>
						</div>

						<div class="control-group" id="passwordNuevoControlGroup">
							<label class="control-label" for="passwordNuevo">Nuevo
								Password <sup>*</sup>
							</label>
							<div class="controls">
								<input type="text" id="passwordNuevo" name="passwordNuevo"
									placeholder="Contraseña nueva"> <span
									class="help-inline"><form:errors path="username" /></span>
							</div>
						</div>

						<div class="control-group" id="passwordRepeatControlGroup">
							<label class="control-label" for="passwordRepeat">Repetir
								Password <sup>*</sup>
							</label>
							<div class="controls">
								<input type="text" id="passwordRepeat" name="passwordRepeat"
									placeholder="Contraseña nueva"> <span
									class="help-inline"><form:errors path="username" /></span>
							</div>
						</div>

						<input class="btn " type="submit" value="Guardar" />
					</form:form>
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
				<h5>ACCOUNT</h5>
				<a href="login.html">YOUR ACCOUNT</a> <a href="login.html">PERSONAL
					INFORMATION</a> <a href="login.html">ADDRESSES</a> <a href="login.html">DISCOUNT</a>
				<a href="login.html">ORDER HISTORY</a>
			</div>
			<div class="span3">
				<h5>INFORMATION</h5>
				<a href="contact.html">CONTACT</a> <a href="register.html">REGISTRATION</a>
				<a href="legal_notice.html">LEGAL NOTICE</a> <a href="tac.html">TERMS
					AND CONDITIONS</a> <a href="faq.html">FAQ</a>
			</div>
			<div class="span3">
				<h5>OUR OFFERS</h5>
				<a href="#">NEW PRODUCTS</a> <a href="#">TOP SELLERS</a> <a
					href="special_offer.html">SPECIAL OFFERS</a> <a href="#">MANUFACTURERS</a>
				<a href="#">SUPPLIERS</a>
			</div>
			<div id="socialMedia" class="span3 pull-right">
				<h5>SOCIAL MEDIA</h5>
				<a href="#"><img width="60" height="60"
					src="themes/images/facebook.png" title="facebook" alt="facebook" /></a>
				<a href="#"><img width="60" height="60"
					src="themes/images/twitter.png" title="twitter" alt="twitter" /></a> <a
					href="#"><img width="60" height="60"
					src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
			</div>
		</div>
		<p class="pull-right">&copy; OneClick Company</p>
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
							var $form = $('#change-password-form');
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

																			$controlGroup
																					.addClass('error');
																			$controlGroup
																					.find(
																							'.help-inline')
																					.html(
																							item.message);

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