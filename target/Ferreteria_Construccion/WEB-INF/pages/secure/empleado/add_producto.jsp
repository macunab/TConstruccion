<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Alta Producto - Admin -->
<!-- author : Marco, Acuna -->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alta producto | admin</title>
<link rel="shortcut icon" href="../resources/img/icono_oneclick.png"
	type="image/png" />
<link rel="stylesheet" href="../resources/css/admin-bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="../resources/css/admin-bootstrap-theme.min.css">
<link rel="stylesheet" href="../resources/css/dashboard.css">

</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> Administracion</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<!-- <li><a href="#">Dashboard</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li> -->
					<li><a
						href="/Ferreteria_Construccion/j_spring_security_logout">Logout</a></li>
				</ul>
				<!--<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>-->
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><div class="thumbnail">
							<img width="150" src="../resources/img/OneClick.png"
								alt="oneClick">
						</div></li>
					<li><a href="/Ferreteria_Construccion/secure/home_page">Principal</a></li>
					<li><a href="/Ferreteria_Construccion/secure/usuario_home/1">Usuarios</a></li>
					<li class="active"><a
						href="/Ferreteria_Construccion/secure/producto_home/1">Productos</a></li>
					<!-- <li><a href="#">Pedidos</a></li>
				</ul>

				<ul class="nav nav-sidebar">
					<li><a href="">Reportes</a></li>
				</ul> -->
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h3 class="page-header">Nuevo Producto</h3>

				<p>Las casillas con el simbolo * son casillas obligatorias.</p>
				<hr class="soft" />

				<form:form id="add-producto-form" class="form-horizontal"
					action="save_producto" method="POST" modelAttribute="producto"
					enctype="multipart/form-data">
					<fieldset>

						<!-- INPUT CODIGO-->
						<div class="form-group" id="codigoControlGroup">
							<label class="col-md-4 control-label" for="codigo">Codigo
								*</label>
							<div class="col-md-4">
								<form:input id="codigo" path="codigo" name="codigo"
									placeholder="Codigo de barra" class="form-control input-md"
									type="text" onKeyPress="return numbersonly(this, event)" />
								<span class="help-inline"><form:errors path="codigo" /></span>
							</div>

						</div>

						<!-- INPUT NOMBRE-->
						<div class="form-group" id="nombreControlGroup">
							<label class="col-md-4 control-label" for="nombre">Nombre</label>
							<div class="col-md-4">
								<form:input id="nombre" path="nombre" name="nombre"
									placeholder="nombre" class="form-control input-md" type="text" />
								<span class="help-inline"><form:errors path="nombre" /></span>

							</div>

						</div>

						<!-- INPUT PRECIO VENTA-->
						<div class="form-group" id="precioControlGroup">
							<label class="col-md-4 control-label" for="precio">Precio
								*</label>
							<div class="col-md-4">
								<form:input id="precio" path="precio" name="precio"
									placeholder="precio" class="form-control input-md"
									onKeyPress="return isNumberDecimal(event)" />
								<span class="help-inline"><form:errors path="precio"
										class="alert-error" /></span>

							</div>

						</div>

						<!-- INPUT PRECIO COMPRA-->
						<div class="form-group" id="precioCompraControlGroup">
							<label class="col-md-4 control-label" for="precio_compra">Precio
								compra *</label>
							<div class="col-md-4">
								<form:input id="precioCompra" path="precioCompra"
									name="precioCompra" placeholder="precio de compra"
									class="form-control input-md"
									onKeyPress="return isNumberDecimal(event)" />
								<span class="help-inline"><form:errors
										path="precioCompra" /></span>

							</div>

						</div>

						<!-- INPUT STOCK-->
						<div class="form-group" id="stockControlGroup">
							<label class="col-md-4 control-label" for="stock">Stock *</label>
							<div class="col-md-4">
								<form:input id="stock" path="stock" name="stock"
									placeholder="stock" type="number" class="form-control input-md"
									onKeyPress="return numbersonly(this, event)" />
								<span class="help-inline"><form:errors path="stock" /></span>
							</div>

						</div>


						<!-- SELECT CATEGORIAS -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="categoria">Categoria</label>
							<div class="col-md-4">

								<select id="categoria" name="categorias[]" class="form-control">
									<option value="100">Seleccionar Categoria</option>
									<c:forEach items="${categorias}" var="categoria">

										<option value="${categoria.codigo}">${categoria.nombre }</option>
									</c:forEach>
								</select>
							</div>
							<!-- <a href="#"><span class="glyphicon glyphicon-plus"></span></a> -->
						</div>

						<!-- SELECT SUBCATEGORIA -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="categoria">Sub
								Categoria</label>
							<div class="col-md-4">

								<select id="subCategoria" name="subCategoria"
									class="form-control">
									<option value="Sin">Seleccionar Subcategoria</option>

								</select>
							</div>
							<!-- <a href="#"><span class="glyphicon glyphicon-plus"></span></a> -->
						</div>

						<!-- FILE IMAGEN PRODUCTO -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="imagen">Imagen</label>
							<div class="col-md-4">
								<input id="imagen" name="imagen" class="input-file" type="file">
							</div>
						</div>

						<!-- TEXT TAGS. -->

						<div class="form-group" id="tagsControlGroup">
							<label class="col-md-4 control-label" for="tags">Tags *</label>
							<div class="col-md-4">
								<textarea class="form-control" rows="5" cols="35" name="tags"
									id="tags"></textarea>
								<span class="help-block">Ingrese los tags separados por
									una coma (,)</span>

							</div>

						</div>

						<!-- TEXTAREA DESCRIPCION -->
						<div class="form-group" id="descripcionControlGroup">
							<label class="col-md-4 control-label" for="descripcion">Descripcion</label>
							<div class="col-md-4">
								<form:textarea path="descripcion" class="form-control"
									id="descripcion" name="descripcion"></form:textarea>
							</div>
						</div>

						<!-- BUTTON GUARDAR -->
						<input class="btn " type="submit" value="Guardar" />

					</fieldset>
				</form:form>
			</div>
		</div>
		<!-- Latest compiled and minified JavaScript -->
		<script src="../resources/js/jquery-1.2.11.0.js"></script>
		<script src="../resources/js/bootstrap.min.js"></script>

		<script TYPE="text/javascript">
		// copyright 1999 Idocs, Inc. http://www.idocs.com
		// Distribute this script freely but keep this notice in place
		function numbersonly(myfield, e, dec) {
			var key;
			var keychar;

			if (window.event)
				key = window.event.keyCode;
			else if (e)
				key = e.which;
			else
				return true;
			keychar = String.fromCharCode(key);

			// control keys
			if ((key == null) || (key == 0) || (key == 8) || (key == 9)
					|| (key == 13) || (key == 27))
				return true;

			// numbers
			else if ((("0123456789").indexOf(keychar) > -1))
				return true;

			// decimal point jump
			else if (dec && (keychar == ".")) {
				myfield.form.elements[dec].focus();
				return true;
			} else
				return false;
		}
		
		 function isNumberDecimal(evt)
		    {
		       var charCode = (evt.which) ? evt.which : evt.keyCode;
		       if (charCode != 46 && charCode > 31 
		         && (charCode < 48 || charCode > 57))
		          return false;

		       return true;
		    }
		    
		 $("select#categoria").change(function(){
	         $.getJSON("update_subcategoria",{categoria: $(this).val()}, function(data){
	              var options = '';
	      		console.log(data.errorMessageList.length);

	              for (var i = 0; i < data.errorMessageList.length; i++) {
	                options += '<option value="' + data.errorMessageList[i].message + '">' + data.errorMessageList[i].message + '</option>';
	              }
	              $("select#subCategoria").html(options);
	            });
	        });
		 
		/* function collectFormData(fields) {
				var data = {};
				for (var i = 0; i < fields.length; i++) {
					var $item = $(fields[i]);
					if($item.attr('name') == 'imagen'){
						data[$item.attr('name')] = new FormData($item.val('files'));
					}else{
					data[$item.attr('name')] = $item.val();
					}
				}
				data['tags'] = $('#tags').val();
				data['subCategoria'] = $('#subCategoria').val();
				return data;
			}

			$(document)
					.ready(
							function() {
								var $form = $('#add-producto-form');
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
																	'save_producto',
																	data,
																	function(
																			response) {
																		$form
																				.find(
																						'.form-group')
																				.removeClass(
																						'has-error');
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
																							.addClass('has-error');
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
																			window.location.href = "producto_home/1";
																		}
																	}, 'json');

													e.preventDefault();
													return false;
												});
							});*/
	</script>
</body>
</html>