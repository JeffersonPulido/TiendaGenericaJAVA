
<%@page import="Modelo.Clientes"%>
<%@page import="ModeloDAO.ClientesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	    <!-- Required meta tags -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <link rel="stylesheet" href="css/owl.carousel.min.css">
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="css/bootstrap.min.css">
	    <!-- Style -->
	    <link rel="stylesheet" href="css/estilos.css">
	    <link rel="stylesheet" href="css/style.css">
	    <link rel="shortcut icon" href="images/icono.ico"> 
	    <script src="https://kit.fontawesome.com/c159e6bc0d.js" crossorigin="anonymous"></script>
        <title>Modificar Cliente || Tienda Supermarket S.A.S.</title>
    </head>
    <body>
   	    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">
	      <div class="container">
	        <div class="row align-items-center position-relative">
	          <div class="site-logo">
	            <a href="home.jsp" class="text-black"><span class="text-primary"></span><img src="images/LOGO.jpg" style="width: 20%;"></a>
	          </div>
	          <div class="col-12">
	            <nav class="site-navigation text-right ml-auto " role="navigation">
	              <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
	                <li><a href="Controlador?accion=listar" class="nav-link">Usuarios</a></li>
	                <li><a href="ControladorClientes?accion=listar" class="nav-link">Clientes</a></li>
	                <li><a href="#why-us-section" class="nav-link">Proveedores</a></li>
	                <li><a href="#testimonials-section" class="nav-link">Productos</a></li>
	                <li><a href="#blog-section" class="nav-link">Ventas</a></li>
	                <li><a href="#contact-section" class="nav-link">Reportes</a></li>
	                <li><a href="login.jsp"><i class="fas fa-power-off"></i> Salir</a></li>
	              </ul>
	            </nav>
	          </div>
	          <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>
	        </div>
	      </div>
	    </header>
        <div class="container">
            <div class="col-lg-6">
            <%
	            ClientesDAO dao=new ClientesDAO();
	            int cedula_cliente=Integer.parseInt((String)request.getAttribute("idper"));
	            Clientes p=(Clientes)dao.list(cedula_cliente);
       		%>
            <h1>Modificar Cliente</h1>
            <form action="ControladorClientes">
                Cedula Ciudadania:<br>
                <input class="form-control" type="text" name="txtcedula_cliente" value="<%= p.getCedula_cliente()%>" disabled><br>
                <input class="form-control" type="hidden" name="txtid" value="<%= p.getCedula_cliente()%>">
                Direccion: <br>
                <input class="form-control" type="text" name="txtdireccion_cliente" value="<%= p.getDireccion_cliente()%>"><br>
                Correo Electronico: <br>
                <input class="form-control" type="text" name="txtemail_cliente" value="<%= p.getEmail_cliente()%>"><br>
                Nombre Completo: <br>
                <input class="form-control" type="text" name="txtnombre_cliente" value="<%= p.getNombre_cliente()%>"><br>
                Telefono: <br>
                <input class="form-control" type="text" name="txttelefono_cliente" value="<%= p.getTelefono_cliente()%>"><br>

                <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"> <hr>
                <a href="ControladorClientes?accion=listar">Regresar</a><br><br>
            </form>
          </div>
          
        </div>
    </body>
</html>