/*******************************************************************************
 * ********* Recojo contenido de inputs *******
 ******************************************************************************/
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

function toggleMobileMenu() {
	var $mobileMenu = $('#mobile-main-menu');
	$mobileMenu.slideToggle('fast');
}

$(document)
		.ready(
				function() {

					$('#mobile-menu').on('click', toggleMobileMenu);

					$('.subMenu > a')
							.click(
									function(e) {
										e.preventDefault();
										var subMenu = $(this).siblings('ul');
										var li = $(this).parents('li');
										var subMenus = $('#sidebar li.subMenu ul');
										var subMenus_parents = $('#sidebar li.subMenu');
										if (li.hasClass('open')) {
											if (($(window).width() > 768)
													|| ($(window).width() < 479)) {
												subMenu.slideUp();
											} else {
												subMenu.fadeOut(250);
											}
											li.removeClass('open');
										} else {
											if (($(window).width() > 768)
													|| ($(window).width() < 479)) {
												subMenus.slideUp();
												subMenu.slideDown();
											} else {
												subMenus.fadeOut(250);
												subMenu.fadeIn(250);
											}
											subMenus_parents
													.removeClass('open');
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
					actualizarCarrito();
					actualizarTotalCarrito();
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
															$form
																	.find(
																			'.form-group')
																	.removeClass(
																			'has-error');
															$form
																	.find(
																			'.help-inline')
																	.empty();

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

																window.location.href = "1";
															}
														}, 'json');

										e.preventDefault();
										return false;
									});
				});
