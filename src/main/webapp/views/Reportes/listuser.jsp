<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<!DOCTYPE html>
<html>
	<head>
	    <!-- Required meta tags -->
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <!-- Bootstrap CSS -->
	    <!-- Style -->
	    <link rel="shortcut icon" href="../../images/icono.ico"> 
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
       <title>Lista de Usuarios || Tienda Supermarket S.A.S.</title>
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

        <br>
          <div class="container">
            <h1>Lista de Usuarios</h1>
            <br>
            <table class="table table-reponsive table-striped table-hover text-center table-bordered" id="TablaDat" >
               <thead>
                  <tr>
                      <th>CEDULA CIUDADANIA</th>
                      <th>CORREO ELECTRONICO</th>
                      <th>NOMBRE USUARIO</th>
                      <th>CONTRASEŅA</th>
                      <th>USUARIO</th>
                  </tr>
               </thead>
               <tbody>
           	     <tr>
                   	<%
	                    UsuarioDAO dao=new UsuarioDAO();
	                    List<Usuario>list=dao.listar();
	                    Iterator<Usuario>iter=list.iterator();
	                    Usuario per=null;
	                    while(iter.hasNext()){
                       per=iter.next();
               		%>
                       <td><%= per.getCedula_usuario()%></td>
                       <td><%= per.getEmail_usuario()%></td>
                       <td><%= per.getNombre_usuario()%></td>
                       <td><%= per.getPassword()%></td>
                       <td><%= per.getUsuario()%></td>
                   </tr>
                   <%}%>
                </tbody>
            </table>
        </div>

   	</body>
</html>