<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>ABM TRIMIX</title>
    </head>

    <body>
        <div class="container mt-3">
            <div class="card border-info">
                <div class="card-header bg-info text-white">
                    <a a class="btn btn-primary" href ="agregar.htm" style="float: left">Nueva Persona</a>
                    <form class="form-inline" style="float: right">
                        
                        <input type="search" name="txtBuscar" class="form-control">
                        <input type="submit" name="accion" value="Buscar" class="btn btn-outline">
                    
                    
                    </form>
                    
                </div>
                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NOMBRE</th>
                                <th>APELLIDO</th>
                                <th>NUMERO DE DOCUMENTO</th>
                                <th>TIPO DE DOCUMENTO</th>
                                <th>FECHA DE NACIMIENTO</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="dato" items="${lista}">
                            <tr>
                                <td>${dato.Id}</td>
                                <td>${dato.Nombre}</td>
                                <td>${dato.Apellido}</td>
                                <td>${dato.NroDoc}</td>
                                <td>${dato.TipoDoc}</td>
                                <td>${dato.FechaNac}</td>
                                <td>
                                    <a href="editar.htm?id=${dato.Id}" class="btn btn-warning">Editar</a>
                                    <a href="delete.htm?id=${dato.Id}" class="btn btn-danger" onclick="return confirm('Esta seguro de eliminar esta persona?');">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
        
    </body>
</html>
