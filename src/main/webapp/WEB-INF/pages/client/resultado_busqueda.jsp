<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="row">


	<div class="col-xs-0 col-sm-3">
		<%@ include file="inc/sidebar.jsp"%>
	</div>

	<div class="col-xs-12 col-sm-9">
		<ol class="breadcrumb">
			<li><a href="1">Home</a></li>
			<li class="active">Resultado de busqueda</li>
		</ol>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<strong>Bienvenido a OneClick.com</strong>
				</h3>
			</div>
			<div class="panel-body">

				<h3>
					Productos <small class="pull-right"> ${totalProductos }
						productos disponibles </small>
				</h3>
				<hr class="soft" />

				<!-- Ordenar por -->
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown">
						Ordenar Por <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Mayor precio</a></li>
						<li><a href="#">Menor precio</a></li>
						<li class="divider"></li>
						<li><a href="#">Con stock</a></li>
						<li><a href="#">Ultimos productos</a></li>
					</ul>
				</div>

				<br class="clr" />

				<!-- SI NO SE ENCUENTRAN PRODUCTOS -->
				<c:choose>
					<c:when test="${totalProductos < 1 }">

						<div class='alert alert-warning alert-dismissible' role='alert'>
							<button type='button' class='close' data-dismiss='alert'>
								<span aria-hidden='true'>&times;</span><span class='sr-only'></span>
							</button>
							<strong>Resultado de busqueda: </strong> No se ha encontrado el
							producto buscado.
						</div>

					</c:when>
					<c:otherwise>

					</c:otherwise>

				</c:choose>
				<!-- ************************************************** -->
				<!-- TABS DE VISTA DE PRODUCTOS -->
				<!-- ************************************************** -->
				<div id="myTab" class="pull-right">
					<a href="#listView" data-toggle="tab"><span
						class="btn btn-large"><i class="glyphicon glyphicon-list"></i></span></a>
					<a href="#blockView" data-toggle="tab"><span
						class="btn btn-large btn-primary"><i
							class="glyphicon glyphicon-th-large"></i></span></a>
				</div>
				<br class="clr" /> <br class="clr" />
				<!-- ************************************************** -->
				<!-- CONTENIDO DE LOS TABS -->
				<!-- ************************************************** -->
				<div class="tab-content">
					<!-- ************************************************** -->
					<!-- VISTA EN LISTA -->
					<!-- ************************************************** -->
					<div class="tab-pane" id="listView">
						<c:forEach items="${productos }" var="producto">
							<div class="row">
								<div class="col-xs-6 col-sm-3">
									<div class="span2">
										<img style="max-width: 150px;"
											src="resources/img/martillo.jpg" alt="Sin imagen" />
									</div>
								</div>
								<div class="col-xs-0 col-sm-6 hidden-xs">
									<div class="span4">
										<h3>${producto.nombre }</h3>
										<hr class="soft" />
										<p>${producto.descripcion }</p>
										<h5>Stock : ${producto.stock }</h5>
									</div>
								</div>
								<div class="col-xs-6 col-sm-3">
									<div class="span4">
										<br class="clr" />
									</div>
									<div class="span3 alignR">
										<form class="form-horizontal qtyFrm">
											<h3>$${producto.precio }</h3>
											<br />
											<c:choose>
												<c:when test="${producto.stock >= 1 }">
													<sec:authorize access="hasRole('ROLE_CLIENTE')">
														<button OnClick="getModal(${producto.codigo});"
															class="btn btn-success button-right">
															Comprar <span class="icon-shopping-cart"></span>
														</button>
													</sec:authorize>
													<sec:authorize access="isAnonymous()">
														<button class="btn btn-success button-right" disabled>
															<span class="icon-ok"></span> En Stock
														</button>
													</sec:authorize>
												</c:when>
												<c:otherwise>
													<button class="btn btn-danger button-right" disabled>
														<span class="icon-remove"></span> Sin stock
													</button>
												</c:otherwise>
											</c:choose>
											<a href="get_producto?codigo=${producto.codigo }"
												class="btn btn-default"> <span
												class="glyphicon glyphicon-zoom-in"></span> <strong
												class="hidden-xs">Ver</strong>
											</a>
										</form>
									</div>
								</div>
								<!-- FIN COL 2 -->
							</div>
							<hr class="soft" />
						</c:forEach>

					</div>
					<!-- ************************************************** -->
					<!-- VISTA EN BLOQUES -->
					<!-- ****************************************** -->
					<div class="tab-pane  active" id="blockView">
						<ul class="thumbnails">
							<div class="row">
								<c:forEach items="${productos }" var="producto">
									<div class="col-xs-12 col-sm-4">
										<div class="thumbnail">
											<img style="max-width: 150px;"
												src="resources/img/martillo.jpg" alt="...">
											<div class="caption">
												<h3 class="text-center">${producto.nombre }</h3>
												<p class="text-center">
													<a class="btn"
														href="get_producto?codigo=${producto.codigo }"> <i
														class="glyphicon glyphicon-zoom-in"></i></a>
													<c:choose>
														<c:when test="${producto.stock >= 1 }">
															<sec:authorize access="hasRole('ROLE_CLIENTE')">
																<button OnClick="getModal(${producto.codigo});"
																	class="btn btn-success button-right">
																	Comprar <span class="icon-shopping-cart"></span>
																</button>
															</sec:authorize>
															<sec:authorize access="isAnonymous()">
																<button class="btn btn-success button-right" disabled>
																	<span class="icon-ok"></span> En Stock
																</button>
															</sec:authorize>
														</c:when>
														<c:otherwise>
															<button class="btn btn-danger button-right" disabled>
																<span class="icon-remove"></span> Sin stock
															</button>
														</c:otherwise>
													</c:choose>
													<a class="btn btn-primary" href="#">$${producto.precio
														}</a>
												</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</ul>
						<hr class="soft" />
					</div>
					<!-- ************************************************** -->
					<!-- Fin de Vista en Bloque -->
					<!-- ************************************************** -->
				</div>

				<!-- ************************************************** -->
				<!-- Paginacion -->
				<!-- *********************************************** -->
				<nav class="text-center">
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
				</nav>
				<!-- ************************************************** -->
				<!-- Fin Paginacion -->
				<!-- ************************************************** -->
				<br class="clr" />

			</div>
		</div>

	</div>
</div>
<!-- ************************************************** -->
<!-- MODAL DE AGREGAR AL CARRITO -->
<!-- ************************************************** -->
<div id="agregarCarrito" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">Agregue un articulo a su carrito</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div id="modalcarrito" class="col-xs-9">
						<div class="form-group" id="cantidadcarritoControlGroup">
							<div class="input-group">
								<span class="input-group-addon">Cantidad</span> <input
									type="number" id="cantidadcarrito" class="form-control"
									onKeyPress="return numbersonly(this, event)" min="1"
									placeholder="Indique la cantidad que desea">
							</div>
							<span class="help-inline"></span>
						</div>
					</div>
					<div class="col-xs-3">
						<button type="button" class="btn btn-info disabled">
							<span class="glyphicon glyphicon-shopping-cart"></span>

						</button>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
				<button id="btnConfirmacion" type="button" class="btn btn-primary"
					onClick="">Si</button>
			</div>
		</div>
	</div>
</div>
<!-- ************************************************** -->
<!-- FIN DE AGREGAR CARRITO -->
<!-- ************************************************** -->
<script src="resources/js/ferreteria.js"></script>