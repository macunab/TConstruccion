<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneClick | Categoria</title>
</head>
<body>
	<div id="main-container" class="container">

		<h2>${categoria.nombre } :</h2>


		<div class="row">
			<c:forEach items="${productos }" var="producto">

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