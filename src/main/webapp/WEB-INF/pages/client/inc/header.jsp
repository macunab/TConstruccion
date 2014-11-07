<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page
	import="org.springframework.security.core.context.SecurityContextHolder"%>

<header>
	<div class="container">

		<div class="row">

			<div class="col-xs-6 col-sm-3">
				<h1 id="main-logo">
					<a href="1"><img src="resources/img/OneClick.png" width="200"
						alt=""> <span>Todo lo que necesitas a un solo click</span></a>
				</h1>
			</div>
			<div class="col-xs-6 col-sm-9">

				<ul id="main-menu" class="nav nav-pills hidden-xs">

					<li><a href="">EMPRESA</a></li>
					<li><a href="contacto">CONTACTO</a></li>
					<sec:authorize access="hasRole('ROLE_CLIENTE')">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><strong id="usuario"><%=SecurityContextHolder.getContext()
						.getAuthentication().getName()%></strong> <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="consulta_pedidos">Mis Pedidos</a></li>
								<!-- <li><a href="#">Perfil</a></li> -->
								<li><a href="cambio_passwd">Change password</a></li>
								<li class="divider"></li>
								<li><a href="j_spring_security_logout">Logout</a></li>
							</ul></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li id="register"><a href="login">INGRESAR</a></li>
					</sec:authorize>
				</ul>

				<a href="#" id="mobile-menu" class="btn btn-default visible-xs">
					<span class="glyphicon glyphicon-th-list"></span>
				</a>
			</div>
		</div>


		<div class="visible-xs">

			<ul id="mobile-main-menu">


				<li><a href="">Empresa</a></li>
				<li><a href="contacto">Contacto</a></li>
				<sec:authorize access="hasRole('ROLE_CLIENTE')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><strong id="usuario"><%=SecurityContextHolder.getContext()
						.getAuthentication().getName()%></strong> <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="consulta_pedidos">Mis Pedidos</a></li>
							<!-- <li><a href="#">Perfil</a></li> -->
							<li><a href="cambio_passwd">Change password</a></li>
							<li class="divider"></li>
							<li><a href="j_spring_security_logout">Logout</a></li>
						</ul></li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li><a href="login">Ingresar</a></li>
				</sec:authorize>
			</ul>
		</div>


	</div>
</header>

<div class="container">
	<div id="main-search">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="input-group">
					<span class="input-group-addon"> <span
						class="glyphicon glyphicon-search"></span>
					</span> <input type="text" class="form-control"
						placeholder="Busque el producto que necesita!" /> <span
						class="input-group-btn">
						<button class="btn btn-warning" type="button">Buscar</button>
					</span>

				</div>
			</div>
		</div>
	</div>
</div>