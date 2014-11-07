<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- COMIENZO DE SIDEBAR -->
<div id="sidebar" class="span3 hidden-xs">

	<!-- CARRITO SIDEBAR -->
	<sec:authorize access="hasRole('ROLE_CLIENTE')">
		<div class="panel panel-default">
			<div class="panel-body">
				<a href="get_carrito"><img src="resources/img/ico-cart.png"
					alt="cart"> <span id="cantidad">0</span> Items en tu carrito
					<span id="total_carrito" class="label label-info"> $0</span></a>
			</div>
		</div>
	</sec:authorize>
	<!-- FIN CARRITO SIDEBAR -->


	<!-- CATEGORIAS DESPLEGABLES -->
	<ul id="sideManu" class="nav nav-tabs nav-stacked">
		<c:forEach items="${categorias }" var="categoria">
			<li class="subMenu"><a> ${categoria.nombre }</a>
				<ul style="display: none">
					<c:forEach items="${categoria.subCategorias}" var="subCategoria">
						<li><a class="active"><i
								class="glyphicon glyphicon-chevron-right"></i>${subCategoria.nombre }
						</a></li>
					</c:forEach>
				</ul></li>
		</c:forEach>
	</ul>
	<!-- FIN DE CATEGORIAS DESPLEGABLES -->


	<!-- IMAGEN PAGOS -->
	<div class="thumbnail">
		<img src="resources/img/payment_methods.png"
			title="Bootshop Payment Methods" alt="Payments Methods">
		<div class="caption">
			<h5>Metodos de pago</h5>
		</div>
	</div>
	<!-- FIN IMAGEN PAGOS -->
</div>

