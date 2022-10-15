<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuenteDatos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 04 - TPI2022</title>
        <link rel="stylesheet" type="text/css" href="css/bulma.min.css">
        <c:if test="${sessionScope.nivel eq 2}">
            <script>

                function eliminar(id)
                {
                    confirm("Se eliminara el registro con el id: #" + id);
                    location.href = "delete.jsp?id=" + id;
                }

                function editar(id)
                {
                    location.href = "frmupdate.jsp?id=" + id;
                }
            </script>
        </c:if>
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>

        <c:if test="${sessionScope.nivel eq 1}">
           
                    <form  method="post" action="insert.jsp" class="box">
                        <h1 class="title">Registrar Libro</h1>
                        <div class="columns">
                            <div class="column">
                                <label for="nombre" class="label">ISBN: </label>
                                <div class="control">
                                    <input type="text" class="input is-rounded" name="isbn" size="13" maxlength="13" pattern="[0-9]{13}" title="Debe ingresar 13 digitos" required/>
                                </div>
                            </div>
                            <div class="column">
                                <label for="titulo" class="label">Titulo: </label>
                                <div class="control">
                                    <input type="text" class="input is-rounded" name="titulo" size="50" pattern="[a-zA-Z0-9\,]{0,50}" title="Solo debe ingresar texto y maximo 50 caracteres" required/>
                                </div>
                            </div>
                        </div>
                        <div class="columns">
                            <div class="column">
                                <label for="nombre" class="label">Autor: </label>
                                <div class="control">
                                    <input type="text" class="input is-rounded" name="autor" size="50" required  pattern="[a-zA-Z\,]{0,50}" title="Solo debe ingresar texto sin acento y maximo 50 caracteres" />
                                </div>
                            </div>
                            <div class="column">
                                <label for="titulo" class="label">Editorial: </label>
                                <div class="select">
                                    <select class="input is-rounded" name="editorial" id="editorialA">   
                                        <option value="Santillana">Santillana</option> 
                                        <option value="Novela">Novela</option>   
                                        <option value="Ediciones Martinez Roca">Ediciones Martinez Roca</option> 
                                        <option value="Edisal">Edisal</option>
                                        <option value="Renacimiento">Renacimiento</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <button class="button is-success" type="submit">Guardar</button>
                    </form>
                </c:if>
       

        <p style="color: red;">
            <c:if test="${not empty param.error}">
                <c:out value="${param.error}"/>
            </c:if>     
        </p>
        <p style="color: green;">
            <c:if test="${not empty param.success}">
                <c:out value="${param.success}"/>
            </c:if>     
        </p>

        <table class="table" width = "100%">
            <tr>
                <th>ID</th>
                <th>ISBN</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Editorial</th>
               <c:if test="${sessionScope.nivel eq 2}">
                <th>Acciones</th>
               </c:if>

            </tr>

            <c:forEach var="row" items = "${result.rows}">
                <tr>
                    <td> <c:out  value="${row.id}" />  </td>
                    <td> <c:out  value="${row.isbn}" />  </td>
                    <td> <c:out  value="${row.titulo}" />  </td>
                    <td> <c:out  value="${row.autor}" />  </td>
                    <td> <c:out  value="${row.editorial}" />  </td>
                   <c:if test="${sessionScope.nivel eq 2}">
                    <th> <button class="button is-danger" onclick="editar('${row.id}');">Editar</button> 
                        <button class="button is-info" onclick="eliminar('${row.id}');">Eliminar</button></th>
                    </c:if>
                </tr>

            </c:forEach>

        </table>    
    </body>
</html>
