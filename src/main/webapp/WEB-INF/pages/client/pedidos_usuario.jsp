<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>OneClick | Pedidos</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,400,600,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="resources/css/custom-style.css">
</head>
<body>
	<%@ include file="inc/header.jsp"%>

	<div id="main-body">
		<div class="container">
			<div class="row">
				<div class="col-xs-0 col-sm-3">
					<%@ include file="inc/sidebar.jsp"%>
				</div>

				<div class="col-xs-12 col-sm-9">
					<ol class="breadcrumb">
						<li><a href="">Home</a></li>
						<li class="active">Pedidos</li>
					</ol>


					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<strong>Historial de pedidos</strong>
							</h3>
						</div>
						<div class="panel-body">
							<h3>
								Pedidos procesando: [ <small>${fn:length(procesando)}
									pedido(s) </small>]
							</h3>
							<hr class="soft" />
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Codigo</th>
										<th>Estado</th>
										<th>Accion</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${procesando }" var="pedidos">

										<tr>
											<td>${pedidos.codigoPedido }</td>
											<td>Procesando validacion ...<br />
											</td>
											<td>
												<button class="btn btn-danger" type="button">
													<span class="glyphicon glyphicon-remove"></span>Cancelar
												</button>
											</td>

										</tr>
									</c:forEach>


								</tbody>
							</table>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<%@ include file="inc/footer.jsp"%>
	<script src="resources/js/jquery-1.2.11.0.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="resources/js/ferreteria.js"></script>


</body>
</html>