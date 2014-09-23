<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/img/icono_oneclick.png"
	type="image/png" />
<title>OneClick | Home</title>
<!-- Estilo Css -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

<!-- Javascripts -->
<script src="resources/js/jquery-1.2.11.0.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

<style>
.blue {
	color: #99C7F4;
}
</style>

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

	<c:url var="firstUrl" value="/1" />
	<c:url var="lastUrl" value="/${page.totalPages}" />
	<c:url var="prevUrl" value="/${currentIndex - 1}" />
	<c:url var="nextUrl" value="/${currentIndex + 1}" />

	<div class="container">
		<div class="page-header">


			<img width="400" alt="No se encontro"
				src="resources/img/OneClick.png">

		</div>
	</div>

	<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="">inicio</a>
		</div>

		<!-- NAVBAR Derecha CONTACTO/CATEGORIA/BUSQUEDA -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<!-- class="active" en los li los deja marcados -->
				<!-- ****************************************** -->
				<li><a href="#">Contacto</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Categorias <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<c:forEach items="${categorias }" var="categoria">
							<li><a href="#">${categoria.nombre }</a>
						</c:forEach>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input id="busqueda" type="text" class="form-control"
						placeholder="busqueda">
				</div>
				<button type="button" class="btn btn-default" onClick="buscar()">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>

			<!-- NAVBAR Izquierda LOGIN/CARRITO -->
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="hasRole('ROLE_CLIENTE')">
					<li><a href="#"><span
							class="glyphicon glyphicon-shopping-cart blue"></span> <span>
								&nbsp</span> <span class="badge pull-right">0</span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Bienvenido, <strong><%=SecurityContextHolder.getContext()
						.getAuthentication().getName()%></strong> <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Mis Pedidos</a></li>
							<li><a href="#">Perfil</a></li>
							<li><a href="#">Change password</a></li>
							<li class="divider"></li>
							<li><a href="j_spring_security_logout">Logout</a></li>
						</ul></li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li><a href="login"><strong>Ingresar</strong></a></li>
				</sec:authorize>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<div id="main-container" class="container">

		<sec:authorize access="isAnonymous()">
			<div class="jumbotron">
				<h1>Vamos de compras,</h1>
				<p>Consiga todo lo que necesita para la construccion o las
					labores cotidianas e indispensables del hogas desde nuestro e-shop,
					si ya dispone de una cuenta ingrese desde Sing in, sino creese una
					facilmente desde Sign up!</p>
				<div class="form-group">
					<div class="col-md-8">
						<!-- <a href="login" class="btn btn-success">Ingresar</a> -->
						<a href="save_usuario" id="button2id" name="button2id"
							class="btn btn-primary">Registrarse</a>
					</div>
				</div>
			</div>
		</sec:authorize>

		<h2>Articulos destacados:</h2>


		<div class="row">
			<c:forEach items="${productos }" var="producto">

				<!-- Popup de confirmacion - Boostrap modal -->
				<div class="modal face" id="confirmacion${producto.codigo }"
					tabindex="-1" role="dialog" aria-labelledby="modal"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="model-title">Cuantos ${producto.nombre } desea
									sumar a su carrito.</h4>
							</div>
							<div class="modal-body">

								<!-- Text input-->
								<div>
									<label class="col-md-4 control-label" for="cantidad">Cantidad</label>

									<input id="cantidad" name="cantidad"
										placeholder="cantidad de articulos" class="form-control"
										type="text" />


								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancelar</button>
								<a class="btn btn-primary" href="">Agregar</a>
							</div>
						</div>
					</div>

				</div>
				<!-- Fin del popup -->

				<div class="col-xs-4">

					<a href="get_producto?codigo=${producto.codigo }" class="thumbnail">
						<img width="200" src="${producto.urlImage }" alt="125x125">


					</a>
					<div class="caption">

						<h3>${producto.nombre }</h3>

						<!-- <p>${producto.descripcion }</p> -->

						<p>
							<a href="get_producto?codigo=${producto.codigo }"
								class="btn btn-primary">Detalle</a>
							<sec:authorize access="hasRole('ROLE_CLIENTE')">
								<button data-toggle="modal"
									data-target="#confirmacion${producto.codigo }"
									class="btn btn-default">Carrito</button>
							</sec:authorize>
						</p>

					</div>

				</div>
			</c:forEach>
		</div>

		<!-- Paginacion -->
		<div class="container">
			<ul class="pagination">
				<c:choose>
					<c:when test="${currentIndex == 1}">
						<li class="disabled"><a href="#">&lt;&lt;</a></li>
						<li class="disabled"><a href="#">&lt;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${firstUrl}">&lt;&lt;</a></li>
						<li><a href="${prevUrl}">&lt;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
					<c:url var="pageUrl" value="/${i}" />
					<c:choose>
						<c:when test="${i == currentIndex}">
							<li class="active"><a href="${pageUrl}"><c:out
										value="${i}" /></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageUrl}"><c:out value="${i}" /></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${currentIndex == page.totalPages}">
						<li class="disabled"><a href="#">&gt;</a></li>
						<li class="disabled"><a href="#">&gt;&gt;</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${nextUrl}">&gt;</a></li>
						<li><a href="${lastUrl}">&gt;&gt;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- Fin de paginacion -->

	</div>



</body>
</html>