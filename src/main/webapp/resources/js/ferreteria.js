/**
 * @ferreteria Libreria con funciones de utilidad al proyecto
 *
 * @author Marco Matias Acuña.
 * @version 0.1
 */

/*******************************************************************************
 * CREO ARREGLO DE INPUTS DE UN FORMULARIO (VALIDACION)
 * 
 * @param fields
 * @returns {___anonymous129_130}
 */
function collectFormData(fields) {
	var data = {};
	for (var i = 0; i < fields.length; i++) {
		var $item = $(fields[i]);
		data[$item.attr('name')] = $item.val();
	}
	data['mensaje'] = CKEDITOR.instances['mensaje'].getData();
	console.log(data['mensaje']);
	return data;
}

/*******************************************************************************
 * ACTUALIZO CANTIDAD DE ELEMENTOS EN EL CARRITO
 ******************************************************************************/
function actualizarCarrito() {

	$.ajax({
		type : "post",
		url : "get_productos_carrito",
		cache : false,
		success : function(data) {
			$("#cantidad").text(data);
		},
	});
}

/*******************************************************************************
 * ACTUALIZO VALOR TOTAL DE CARRITO
 ******************************************************************************/
function actualizarTotalCarrito() {

	$.ajax({
		type : "post",
		url : "get_total_carrito",
		cache : false,
		success : function(data) {
			$("#total_carrito").text("$" + data);
		},
	});
}

/*******************************************************************************
 * BUSQUEDA DE UN PRODUCTO
 ******************************************************************************/
function busquedaProducto() {
	$.ajax({
		type : "get",
		url : "busqueda_producto/1",
		cache : false,
		data : 'busqueda=' + $('#busqueda').val(),
		success : function(data) {
			$('#container-principal').html(data);
		},
	});
}

/*******************************************************************************
 * FUNCION DEL MENU EN VISTA MOBILE
 ******************************************************************************/
function toggleMobileMenu() {
	var $mobileMenu = $('#mobile-main-menu');
	$mobileMenu.slideToggle('fast');
}

/*******************************************************************************
 * DESLIZAMIENTO DE LOS SUBMENUS DE LAS CATEGORIA (SIDEBAR)
 ******************************************************************************/
function subMenuSlide() {
	$('.subMenu > a').click(function(e) {
		e.preventDefault();
		var subMenu = $(this).siblings('ul');
		var li = $(this).parents('li');
		var subMenus = $('#sidebar li.subMenu ul');
		var subMenus_parents = $('#sidebar li.subMenu');
		if (li.hasClass('open')) {
			if (($(window).width() > 768) || ($(window).width() < 479)) {
				subMenu.slideUp();
			} else {
				subMenu.fadeOut(250);
			}
			li.removeClass('open');
		} else {
			if (($(window).width() > 768) || ($(window).width() < 479)) {
				subMenus.slideUp();
				subMenu.slideDown();
			} else {
				subMenus.fadeOut(250);
				subMenu.fadeIn(250);
			}
			subMenus_parents.removeClass('open');
			li.addClass('open');
		}
	});
	var ul = $('#sidebar > ul');
	$('#sidebar > a').click(function(e) {
		e.preventDefault();
		var sidebar = $('#sidebar');
		if (sidebar.hasClass('open')) {
			sidebar.removeClass('open');
			ul.slideUp(250);
		} else {
			sidebar.addClass('open');
			ul.slideDown(250);
		}
	});
}

/*******************************************************************************
 * FORMULARIO DE CONTACTO
 ******************************************************************************/
function altaContacto() {
	var $form = $('#formulario-contacto');
	$form
			.bind(
					'submit',
					function(e) {
						// Ajax validation
						var $inputs = $form.find('input');
						var data = collectFormData($inputs);

						$
								.post(
										'contacto',
										data,
										function(response) {
											$form.find('.form-group')
													.removeClass('has-error');
											$form.find('.help-inline').empty();

											if (response.status == 'FAIL') {
												for (var i = 0; i < response.errorMessageList.length; i++) {
													var item = response.errorMessageList[i];
													var $controlGroup = $('#'
															+ item.fieldName
															+ 'ControlGroup');

													$controlGroup
															.addClass('has-error');
													$controlGroup.find(
															'.help-inline')
															.html(item.message);

												}
											} else {

												window.location.href = "1";
											}
										}, 'json');

						e.preventDefault();
						return false;
					});
}

/*******************************************************************************
 * DOCUMENT READY
 ******************************************************************************/
$(document).ready(function() {

	$("#agregarCarrito").on('hidden.bs.modal', function() {
		var $modal = $('#modalcarrito');
		$modal.find('.form-group').removeClass('has-error');
		$modal.find('.help-inline').empty();
		$modal.find('#cantidadcarrito').val("");
	});

	$('#mobile-menu').on('click', toggleMobileMenu);

	subMenuSlide();

	actualizarCarrito();
	actualizarTotalCarrito();

	altaContacto();

});

/*******************************************************************************
 * ABRO EL MODAL DEL CARRITO
 * 
 * @param producto
 ******************************************************************************/
function getModal(producto) {
	console.log(producto);
	var id = "agregarCarrito(" + producto + ")";
	console.log(id)

	$("#btnConfirmacion").attr("onClick", id);

	$("#agregarCarrito").modal('show');
}

/*******************************************************************************
 * VALIDACION DE INPUT DE CARRITO
 * 
 * @param producto
 ******************************************************************************/
function agregarCarrito(producto) {

	var data = {};
	console.log(producto);

	data["producto"] = producto;
	data["cantidad"] = $("#cantidadcarrito").val();

	console.log($("#cantidadcarrito").val());

	$.post('add_carrito', data, function(response) {

		if (response.status == 'FAIL') {
			for (var i = 0; i < response.errorMessageList.length; i++) {
				console.log("Se produjo un error");
				var item = response.errorMessageList[i];
				console.log(item.fieldName);
				var $controlGroup = $('#' + item.fieldName + 'ControlGroup');

				$controlGroup.addClass('has-error');
				$controlGroup.find('.help-inline').html(item.message);

			}
		} else {

			window.location.href = "1";
		}
	}, 'json');

	return false;

}

/*******************************************************************************
 * VALIDACION DE INPUT SOLO NUMERICO
 * 
 * @param myfield
 * @param e
 * @param dec
 * @returns {Boolean}
 ******************************************************************************/
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
	if ((key == null) || (key == 0) || (key == 8) || (key == 9) || (key == 13)
			|| (key == 27))
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
