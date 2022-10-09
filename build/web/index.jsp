<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Actualizar, Eliminar, Crear registros.</title>
       <link rel="stylesheet" href="css/bulma.min.css">
    </head>
    
    <body>
        <div class="columns m-2">
            <div class="column is-4">
                <article class="message is-info">
                    <div class="message-header ">
                        <h1>Agregar nuevo libro</h1>
                    </div>
                    <div class="message-body field">
                        <form action="insertar.jsp" method="post" name="Actualizar">
                            <div class="columns">
                                <div class="column">
                                    <label for="nombre" class="label">ISBN: </label>
                                    <div class="control">
                                        <input type="text" 
                                               class="input is-rounded" 
                                               name="isbn" 
                                               value="<% if (request.getParameter("isbn") != null) out.println(request.getParameter("isbn"));%>" 
                                               size="13" 
                                               maxlength="13" 
                                               pattern="[0-9]{13}" 
                                               title="Debe ingresar 13 digitos" 
                                               required/>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column">
                                    <label for="nombre" class="label">Título: </label>
                                    <div class="control">
                                        <input type="text" 
                                               class="input is-rounded" 
                                               name="titulo" 
                                               value="<% if (request.getParameter("titulolibro") != null) out.println(request.getParameter("titulolibro"));%>" 
                                               size="50" 
                                               pattern="[a-zA-Z0-9\,]{0,50}" 
                                               title="Solo debe ingresar texto y maximo 50 caracteres" 
                                               required/>                  
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column">
                                    <label for="nombre" class="label">Autor: </label>
                                    <div class="control">
                                        <input type="text" 
                                               class="input is-rounded" 
                                               name="autor" value="<% if (request.getParameter("autor") != null) out.println(request.getParameter("autor"));%>" 
                                               size="50"
                                               pattern="[a-zA-Z\,]{0,50}" t
                                               itle="Solo debe ingresar texto sin acento y maximo 50 caracteres" 
                                               required/>  
                                    </div>
                                   </div>
                            </div>
                            <div class="columns">
                                <div class="column">
                                    <label for="perfil" class="label">Editorial: </label>
                                    <div class="control">
                                        <div class="select">
                                            <select name="editorial" class="input is-rounded">
                                                <option>1<option>

                                            </select> 
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button class="button is-success" type="submit">
                                <span>INSERTAR</span>
                            </button>
                        </form>
                    </div>
                </article>
            </div>
            <div class="column is-8">
                <div class="table-container">
                    Libros disponibles
                    
                    <br><br>
                    
                    <sql:query dataSource = "${fuenteDatos}" var = "result">
                        SELECT isbn, titulo, autor, e.nombre FROM libro l INNER JOIN editorial e ON l.editorial = e.id;
                    </sql:query>
                       
                    <table class="table is-full" border = "1">
                        <tr>
                            <th>ISBN</th>
                            <th>Titulo</th>
                            <th>Autor</th>
                            <th>Editorial</th>
                            <th>Accion</th>
                        </tr>

                        <c:forEach var = "row" items = "${result.rows}">
                            <tr>
                                <td><c:out value = "${row.isbn}"/></td>
                                <td><c:out value = "${row.titulo}"/></td>
                                <td><c:out value = "${row.autor}"/></td>
                                <td><c:out value = "${row.nombre}"/></td>
                                <td>
                                    <a href='libros.jsp?
                                       isbn="+isbn+"&
                                       titulolibro="+titulo+"&
                                       autor="+autor+"&
                                       anio="+anio+"&
                                       editorial="+rs.getString("editorial")+"&
                                       actualizar'>Actualizar
                                    </a>
                                    <br>
                                    <a href="eliminar.jsp?isbn=${row.isbn}">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    
                    
                </div>
           </div>
        </div>
                                                          
        <script src="js/script.js"></script>
    </body>
</html>
