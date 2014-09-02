<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Resultado busqueda</title>
</head>
<body>

	<h2>Resultado de busqueda:</h2>

	<div class="row">
	
	<c:if test="${empty productos }">
	<p>No se han encontrado coincidencias.</p>
	</c:if>
	
	<c:if test="${fn:length(productos) > 0 }">
	<p>Se han encontrado ${fn:length(productos)} productos.  </p>
	</c:if>
		<c:forEach items="${productos }" var="producto">
			<div class="col-xs-3">

				<a href="#" class="thumbnail"> <img src="${producto.urlImage}"
					alt="125x125">

				</a>
				<div class="caption">
					<h3>${producto.nombre }</h3>
					<p>${producto.descripcion}</p>
					<p>$ ${producto.precio }</p>
					<p>
						<a href="#" class="btn btn-primary" role="button">Detalle</a>
						<sec:authorize access="hasRole('ROLE_CLIENTE')">
							<a href="#" class="btn btn-default" role="button"><span
								class="glyphicon glyphicon-shopping-cart"></span></a>
						</sec:authorize>
					</p>
				</div>

			</div>

		</c:forEach>

	</div>
</body>
</html>