<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nuevo Producto</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="../resources/js/jquery-1.2.11.0.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
</head>
<body>

	<form:form class="form-horizontal" method="POST" action="save_producto" modelAttribute="Producto">
		<fieldset>

			<!-- Form Name -->
			<legend>Nuevo Producto</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">Nombre</label>
				<div class="col-md-5">
					<form:input id="textinput" path="nombre" name="nombre" placeholder="nombre"
						class="form-control input-md" type="text" />
					<span class="help-block">ingrese el nombre del producto</span>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">Precio</label>
				<div class="col-md-4">
					<form:input id="textinput" path="precio" name="precio" placeholder="precio"
						class="form-control input-md" type="number" />
					<span class="help-block">precio del producto</span>
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textinput">Stock</label>
				<div class="col-md-4">
					<form:input id="textinput" path="stock" name="stock" placeholder="stock"
						class="form-control input-md" type="number" />
					<span class="help-block">stock inicial</span>
				</div>
			</div>


			<!-- Select Basic -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="selectbasic">Categoria</label>
				<div class="col-md-4">
					<select id="selectbasic" name="categoria" class="form-control">
						<c:forEach items="${categorias}" var="categoria">

							<option value="${categoria.codigo}">${categoria.nombre }</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<!-- File Button -->
			<!-- <div class="form-group">
				<label class="col-md-4 control-label" for="filebutton">Imagen</label>
				<div class="col-md-4">
					<input id="filebutton" name="filebutton" class="input-file"
						type="file">
				</div>
			</div> -->

			<!-- Select Multiple -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="selectmultiple">Tags</label>
				<div class="col-md-4">
					<select id="selectmultiple" name="selectmultiple"
						class="form-control" multiple="multiple">
						<c:forEach items="${tags}" var="tag">

							<option value="${tag.identified}" name="checktags[]">${tag.nombre }</option>
						</c:forEach>

					</select>
				</div>
			</div>

			<!-- Textarea -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="textarea">Descripcion</label>
				<div class="col-md-4">
					<form:textarea path="descripcion" class="form-control" id="textarea"
						name="descripcion"></form:textarea>
				</div>
			</div>

			<!-- Button (Double) -->
			<div class="form-group">
				<label class="col-md-4 control-label" for="button1id"></label>
				<div class="col-md-8">
					<input type="submit" id="button1id" name="button1id" class="btn btn-success">
					<button id="button2id" name="button2id" class="btn btn-danger">Cancelar</button>
				</div>
			</div>

		</fieldset>
	</form:form>

</body>
</html>