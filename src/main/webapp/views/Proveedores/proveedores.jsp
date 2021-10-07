<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Proveedores"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- Bootstrap CSS -->

    <!-- Style -->
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="shortcut icon" href="images/icono.ico"> 
    <script src="https://kit.fontawesome.com/c159e6bc0d.js" crossorigin="anonymous"></script>
    
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap.min.css"/>
    <title>Proveedores || Supermarket SAS</title>
        
    <script>
        $(document).ready(function() {
            $('#TablaDat').DataTable({
                "paging": true,
                "buttons": true,
                "lengthMenu": [[5, 10, 25, -1], [5, 10, 25, "TODOS"]],
                "paginate": true,
                "language": {"url": "https://cdn.datatables.net/plug-ins/1.10.22/i18n/Spanish.json"}
                    
            });
        } );
    </script>
  </head>
  <body>
    <!--NAV BAR-->
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">
      <div class="container">
        <div class="row align-items-center position-relative">
          <div class="site-logo">
            <a href="views/home.jsp" class="text-black"><span class="text-primary"></span><img src="images/LOGO.jpg" style="width: 20%;"></a>
          </div>
          <div class="col-12">
            <nav class="site-navigation text-right ml-auto " role="navigation">
              <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                <li><a href="Controlador?accion=listar" class="nav-link">Usuarios</a></li>
                <li><a href="ControladorClientes?accion=listar" class="nav-link">Clientes</a></li>
                <li><a href="ControladorProveedores?accion=listar" class="nav-link">Proveedores</a></li>
                <li><a href="views/Productos/upProductos.jsp" class="nav-link">Productos</a></li>
                <li><a href="#blog-section" class="nav-link">Ventas</a></li>
                <li><a href="views/reportes.jsp" class="nav-link">Reportes</a></li>
                <li><a href="views/login.jsp"><i class="fas fa-power-off"></i> Salir</a></li>
              </ul>
            </nav>
          </div>
          <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>
        </div>
      </div>
    </header>
    <!--CONTENT-->
            <div class="container">
            <h1>Proveedores</h1>
            <a class="btn btn-success" href="ControladorProveedores?accion=add"><i class="fas fa-user-plus"></i> Agregar Proveedor Nuevo</a>
            <hr>
            <br>
                            
            <table class="table table-reponsive table-striped table-hover text-center table-bordered" id="TablaDat" >
               <thead>
                  <tr>
                      <th>NIT</th>
                      <th>CIUDAD</th>
                      <th>DIRECCION</th>
                      <th>NOMBRE</th>
                      <th>TELEFONO</th>
                      <th>ACCIONES</th>
                  </tr>
               </thead>
                <tbody>
                    <tr>
                    	<%
		                    ProveedorDAO dao=new ProveedorDAO();
		                    List<Proveedores>list=dao.listar();
		                    Iterator<Proveedores>iter=list.iterator();
		                    Proveedores per=null;
		                    while(iter.hasNext()){
	                       per=iter.next();
                		%>
                        <td><%= per.getNitproveedor()%></td>
                        <td><%= per.getCiudad_proveedor()%></td>
                        <td><%= per.getDireccion_proveedor()%></td>
                        <td><%= per.getNombre_proveedor()%></td>
                        <td><%= per.getTelefono_proveedor()%></td>
                        <td>
                            <a class="btn btn-warning" href="ControladorProveedores?accion=editar&nitproveedor=<%= per.getNitproveedor()%>"><i class="fas fa-user-edit"></i></a>
                            <a class="btn btn-danger" href="ControladorProveedores?accion=eliminar&nitproveedor=<%= per.getNitproveedor()%>"><i class="fas fa-user-times"></i></a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
        <div class="footer-text">
			<a href="#sec-2">©MinTIC2022 Developers</a>
    	</div>
  </body>
</html>