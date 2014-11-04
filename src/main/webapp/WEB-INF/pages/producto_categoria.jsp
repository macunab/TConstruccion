<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OneClick | Categoria</title>
</head>
<body>
		<ul class="breadcrumb">
					<li class="active">Home</li>
				</ul>
				<h3>
					Productos <small class="pull-right">
						${fn:length(productos)} productos disponibles </small>
				</h3>
				<hr class="soft" />
				<p>En OneClick.com encontraras todo lo que necesites al mejor
					precio, desde maquinaria industrial hasta insumos basicos para el
					hogar y la construccion, Si no encuentras lo que buscas no dudes en
					consultarnos por medio de la seccion de contacto.</p>
				<hr class="soft" />
				<form class="form-horizontal span6">
					<div class="control-group">
						<label class="control-label alignL">Ordenar por </label> <select>
							<option>Precio mas alto</option>
							<option>Productos con stock</option>
							<option>Precio mas bajo</option>
						</select>
					</div>
				</form>

				<!-- TAB CONTENT - visualizacion de productos -->
				<div id="myTab" class="pull-right">
					<a href="#listView" data-toggle="tab"><span
						class="btn btn-large"><i class="icon-list"></i></span></a> <a
						href="#blockView" data-toggle="tab"><span
						class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
				</div>
				<br class="clr" />
				<div class="tab-content">
					<!-- Vista en lista -->
					<div class="tab-pane" id="listView">

						<c:forEach items="${productos }" var="producto">

							<!-- MODAL DE AGREGAR AL CARRITO -->
							<div id="confirmacion${producto.codigo }"
								class="modal hide fade in" tabindex="-1" role="dialog"
								aria-labelledby="login" aria-hidden="false">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3>Cuantos ${producto.nombre } desea sumar a su carrito.</h3>
								</div>
								<div class="modal-body">
									<form class="form-horizontal loginFrm">
										<div class="control-group">

											<label class="col-md-4 control-label" for="cantidad">Cantidad</label>

											<input id="cantidad_${producto.codigo }"
												placeholder="cantidad de articulos" class="form-control"
												type="text" />
										</div>


									</form>
									<button onClick="addCarrito(${producto.codigo});"
										class="btn btn-primary" data-dismiss="modal">Agregar</button>
									<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
								</div>
							</div>

							<!-- FIN DE AGREGAR CARRITO -->

							<div class="row">
								<div class="span2">
									<img src="${producto.urlImage}" alt="Sin imagen" />
								</div>
								<div class="span4">
									<h3>${producto.nombre }</h3>
									<hr class="soft" />
									<h5>Stock : ${producto.stock }</h5>
									<p>${producto.descripcion }</p>
									<a class="btn btn-small pull-right"
										href="get_producto?codigo=${producto.codigo }">Ver
										Detalles</a> <br class="clr" />
								</div>
								<div class="span3 alignR">
									<form class="form-horizontal qtyFrm">
										<h3>$${producto.precio }</h3>
										<br />

										<c:choose>
											<c:when test="${producto.stock >= 1 }">
												<sec:authorize access="hasRole('ROLE_CLIENTE')">
													<button data-toggle="modal"
														data-target="#confirmacion${producto.codigo }"
														class="btn btn-success button-right">
														Add to <span class="icon-shopping-cart"></span>
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

										<!-- <a href="product_details.html" class="btn btn-large"><i
												class="icon-zoom-in"></i></a> -->
										<a href="get_producto?codigo=${producto.codigo }"
											class="btn btn-default"> <span class="icon-zoom-in"></span>Ver
										</a>


									</form>
								</div>
							</div>
							<hr class="soft" />
						</c:forEach>

					</div>

					<!-- Vista en bloques -->
					<!-- ****************************************** -->
					<div class="tab-pane  active" id="blockView">
						<ul class="thumbnails">
							<c:forEach items="${productos }" var="producto">

								<!-- MODAL DE AGREGAR AL CARRITO -->
								<div id="confirmacion_bloque${producto.codigo }"
									class="modal hide fade in" tabindex="-1" role="dialog"
									aria-labelledby="login" aria-hidden="false">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h3>Cuantos ${producto.nombre } desea sumar a su carrito.</h3>
									</div>
									<div class="modal-body">
										<form class="form-horizontal loginFrm">
											<div class="control-group">

												<label class="col-md-4 control-label" for="cantidad">Cantidad</label>

												<input id="cantidad_${producto.codigo }" name="cantidad_p"
													placeholder="cantidad de articulos" class="form-control"
													type="text" />
											</div>


										</form>
										<button onClick="addCarrito(${producto.codigo});"
											class="btn btn-primary" data-dismiss="modal">Agregar</button>
										<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
									</div>
								</div>
								<!-- FIN DE AGREGAR CARRITO -->

								<li class="span3">
									<div class="thumbnail">
										<a href="get_producto?codigo=${producto.codigo }"><img
											src="${producto.urlImage }" alt="" /></a>
										<div class="caption">
											<h5>${producto.nombre }</h5>
											<p></p>
											<h4 style="text-align: center">
												<a class="btn"
													href="get_producto?codigo=${producto.codigo }"> <i
													class="icon-zoom-in"></i></a>

												<c:choose>
													<c:when test="${producto.stock >= 1 }">
														<sec:authorize access="hasRole('ROLE_CLIENTE')">
															<!-- <a data-toggle="modal"
																	data-target="#confirmacion_bloque${producto.codigo }"
																	class="btn btn-primary"> Add to <i
																	class=" icon-shopping-cart"></i>
																</a> -->
															<button data-toggle="modal"
																data-target="#confirmacion_bloque${producto.codigo }"
																class="btn btn-success button-right">
																Add to <span class="icon-shopping-cart"></span>
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

												<a class="btn btn-primary" href="#">$${producto.precio }</a>
											</h4>
										</div>
									</div>
								</li>
							</c:forEach>

						</ul>
						<hr class="soft" />
					</div>
					<!-- Fin de Vista en Bloque -->

				</div>

				<!-- Paginacion -->
				<!-- *********************************************** -->
				<!-- <div class="pagination">
					<ul>
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
				</div> -->
				<!-- Fin Paginacion -->

				<br class="clr" />

</body>
</html>