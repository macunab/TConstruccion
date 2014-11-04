<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Formulario Contacto - Client -->
<!-- author : Marco, Acuna -->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<title>OneClick | Contacto</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


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
<script type="text/javascript">
	function buscar() {
		$.ajax({
			type : "get",
			url : "busqueda_producto",
			cache : false,
			data : 'busqueda=' + $('#busqueda').val(),
			success : function(data) {
				$('#main-container').html(data);
			},
		});
	}
</script>
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
<div id="mainBody">
	<div class="container">
		<hr class="soften">
		<h1>Visitanos</h1>
		<hr class="soften" />
		<div class="row">
			<div class="span4">
				<h4>Detalles de Contacto</h4>
				<p>
					Rondo 145,<br /> CA 5000, ARG <br /> <br />
					ferreteria.oneclick@gmail.com<br /> ﻿Tel 123-456-6780<br /> Fax
					123-456-5679<br /> web:oneclick.com
				</p>
			</div>

			<div class="span4">
				<h4>Horarios de atencion</h4>
				<h5>Lunes - Viernes</h5>
				<p>
					09:00am - 09:00pm<br /> <br />
				</p>
				<h5>Sabados</h5>
				<p>
					09:00am - 07:00pm<br /> <br />
				</p>

			</div>
			<div class="span4">
				<h4>Email</h4>
				<form:form action="contacto" method="post"
					modelAttribute="mensajeDto" class="form-horizontal">
					<fieldset>
						<div class="control-group">

							<form:input path="nombre" type="text" placeholder="name"
								class="input-xlarge" />
							<form:errors path="nombre" class="label label-danger" />

						</div>
						<div class="control-group">

							<form:input path="email" type="text" placeholder="email"
								class="input-xlarge" />
							<form:errors path="email" class="label label-danger" />

						</div>

						<div class="control-group">
							<form:textarea path="mensaje" rows="3" id="textarea"
								class="input-xlarge"></form:textarea>
							<form:errors path="mensaje" class="label label-danger" />

						</div>

						<button class="btn btn-large" type="submit">Send Messages</button>

					</fieldset>
				</form:form>
			</div>
		</div>
		<div class="row"></div>
	</div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
<div id="footerSection">
	<div class="container">
		<div class="row">
			<div class="span3">
				<!-- <h5>ACCOUNT</h5>
					<a href="login.html">YOUR ACCOUNT</a> <a href="login.html">PERSONAL
						INFORMATION</a> <a href="login.html">ADDRESSES</a> <a
						href="login.html">DISCOUNT</a> <a href="login.html">ORDER
						HISTORY</a> -->
			<!-- 	<h5>INFORMATION</h5>
				<a href="contact.html">CONTACT</a> <a href="register.html">REGISTRATION</a>
				<a href="legal_notice.html">LEGAL NOTICE</a> <a href="tac.html">TERMS
					AND CONDITIONS</a> <a href="faq.html">FAQ</a>
			</div>
			<div class="span3"></div>
			<div class="span3"> -->
				<!-- 	<h5>OUR OFFERS</h5>
					<a href="#">NEW PRODUCTS</a> <a href="#">TOP SELLERS</a> <a
						href="special_offer.html">SPECIAL OFFERS</a> <a href="#">MANUFACTURERS</a>
					<a href="#">SUPPLIERS</a> -->
			</div>
			<div id="socialMedia" class="span3 pull-right">
				<!-- <h5>SOCIAL MEDIA</h5>
					<a href="#"><img width="60" height="60"
						src="themes/images/facebook.png" title="facebook" alt="facebook" /></a>
					<a href="#"><img width="60" height="60"
						src="themes/images/twitter.png" title="twitter" alt="twitter" /></a>
					<a href="#"><img width="60" height="60"
						src="themes/images/youtube.png" title="youtube" alt="youtube" /></a> -->
			</div>
		</div>
		<p class="pull-right">&copy; OneClick.com</p>
	</div>
	<!-- Container End -->
</div>
</body>
</html>