
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>EDITAR</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <div class="card border-info">
                <div class="card-header bg-info">
                    <h4>Editar registro</h4>
                </div>
                <div class="card-body">
                    <form method="POST">
                        <label>Nombre</label>
                        <input type="text" name="perNombre" class="form-control" value="${lista[0].Nombre}">
                        <label>Apellido</label>
                        <input type="text" name="perApellido" class="form-control" value="${lista[0].Apellido}">
                        <label>Numero Documento</label>
                        <input type="text" name="perNumeroDocumento" class="form-control" value="${lista[0].NroDoc}">
                        <label>Tipo Documento</label>
                        <input type="text" name="perTipoDocumento" class="form-control" value="${lista[0].TipoDoc}">
                        <label>Fecha Nacimiento</label>
                        <input type="text" name="perFechaNacimiento" class="form-control" value="${lista[0].FechaNac    }">
                        <br>
                        <input type="submit" value="Actualizar" class="btn btn-success">
                        <a href="index.htm">Regresar</a>
                            
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
