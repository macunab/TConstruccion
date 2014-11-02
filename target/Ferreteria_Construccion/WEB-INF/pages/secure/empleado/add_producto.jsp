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
<title>Nuevo Producto</title>
<link rel="stylesheet" href="../resources/css/admin-bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="../resources/css/admin-bootstrap-theme.min.css">
<link rel="stylesheet" href="../resources/css/dashboard.css">

<!-- Latest compiled and minified JavaScript -->
<script src="../resources/js/jquery-1.2.11.0.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
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
					<li><a href="#">Dashboard</a></li>
					<li><a href="#">Settings</a></li>
					<li><a href="#">Profile</a></li>
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
					<li><a href="#">Usuarios</a></li>
					<li class="active"><a href="#">Productos</a></li>
					<li><a href="#">Pedidos</a></li>
				</ul>

				<ul class="nav nav-sidebar">
					<li><a href="">Reportes</a></li>
				</ul>
			</div>

			<form:form class="form-horizontal" action="save_producto"
				method="POST" modelAttribute="producto"
				enctype="multipart/form-data">
				<fieldset>

					<!-- Form Name -->
					<legend>Nuevo Producto</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="codigo">Codigo</label>
						<div class="col-md-5">
							<form:input id="codigo" path="codigo" name="codigo"
								placeholder="Codigo de barra" class="form-control input-md"
								type="text" onKeyPress="return numbersonly(this, event)" />
							<span class="help-block">ingrese el codigo de barra del
								productoo</span>
						</div>
						<form:errors path="codigo" class="label label-danger" />
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="nombre">Nombre</label>
						<div class="col-md-5">
							<form:input id="nombre" path="nombre" name="nombre"
								placeholder="nombre" class="form-control input-md" type="text" />
							<span class="help-block">ingrese el nombre del producto</span>
						</div>
						<form:errors path="nombre" class="label label-danger" />
					</div>

					<!-- Precio de venta-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="precio">Precio</label>
						<div class="col-md-4">
							<form:input id="precio" path="precio" name="precio"
								placeholder="precio" class="form-control input-md"
								onKeyPress="return isNumberDecimal(event)" />
							<span class="help-block">precio del producto</span>
						</div>
						<form:errors path="precio" class="label label-danger" />
					</div>

					<!-- Precio de compra-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="precio_compra">Precio
							compra</label>
						<div class="col-md-4">
							<form:input id="precio_compra" path="precioCompra"
								name="precio_compra" placeholder="precio de compra"
								class="form-control input-md"
								onKeyPress="return isNumberDecimal(event)" />
							<span class="help-block">precio neto del producto</span>
						</div>
						<form:errors path="precioCompra" class="label label-danger" />
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="stock">Stock</label>
						<div class="col-md-4">
							<form:input id="stock" path="stock" name="stock"
								placeholder="stock" type="number" class="form-control input-md"
								onKeyPress="return numbersonly(this, event)" />
							<span class="help-block">stock inicial</span>
						</div>
						<form:errors path="stock" class="label label-danger" />
					</div>


					<!-- Select Basic -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="categoria">Categoria</label>
						<div class="col-md-4">

							<select id="categoria" name="categorias[]" class="form-control">
								<c:forEach items="${categorias}" var="categoria">

									<option value="${categoria.nombre}">${categoria.nombre }</option>
								</c:forEach>
							</select>
						</div>
						<!-- <a href="#"><span class="glyphicon glyphicon-plus"></span></a> -->
					</div>

					<!-- Imagen del Producto -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="imagen">Imagen</label>
						<div class="col-md-4">
							<input id="imagen" name="imagen" class="input-file" type="file">
						</div>
					</div>

					<!-- Select Multiple -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="tags">Tags</label>
						<div class="col-md-4">
							<form:select class="form-control" path="tags" multiple="true"
								items="${tags}" itemLabel="nombre" itemValue="idAsString" />

						</div>
						<a href="#" id="tag"><span class="glyphicon glyphicon-plus"></span></a>
					</div>

					<!-- Textarea -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="descripcion">Descripcion</label>
						<div class="col-md-4">
							<form:textarea path="descripcion" class="form-control"
								id="descripcion" name="descripcion"></form:textarea>
						</div>
					</div>

					<!-- Button (Double) -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="button1id"></label>
						<div class="col-md-8">
							<input type="submit" id="button1id" name="button1id"
								class="btn btn-success" value="Guardar">
							<button id="button2id" name="button2id" class="btn btn-danger">Cancelar</button>
						</div>
					</div>

				</fieldset>
			</form:form>
		</div>
	</div>

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
		    
	</script>
</body>
</html>