<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRO LIBRO</title>
        <link rel="stylesheet" href="css/bulma.min.css">
    </head>
    
    <body>
        <h1>LIBROS ALMACENADOS</h1>
        <p style="color:green;font-weight: 1200">
            *observe que en la tabla el registro agregado se marca con fondo verde
        </p>
            
        <sql:update dataSource = "${fuenteDatos}" var = "result">
            INSERT INTO libro (isbn,titulo,autor,editorial)  VALUES (?,?,?,?);
            <sql:param value="${param.isbn}"/>
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>                
        </sql:update>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT isbn, titulo, autor, e.nombre FROM libro l INNER JOIN editorial e ON l.editorial = e.id;
        </sql:query>
        
        <div class="columns m-4">
            <div class="column is-center">
                <table class="table is-full" border = "1">
                    <tr>
                        <th>ISBN</th>
                        <th>Titulo</th>
                        <th>Autor</th>
                        <th>Editorial</th>
                    </tr>

                    <c:forEach var = "row" items = "${result.rows}">
                        <tr>
                            <td><c:out value = "${row.isbn}"/></td>
                            <td><c:out value = "${row.titulo}"/></td>
                            <td><c:out value = "${row.autor}"/></td>
                            <td><c:out value = "${row.nombre}"/></td>
                        </tr>
                    </c:forEach>
                </table> 

                <h3 style="background-color:yellow;">***REGRESE A INDEX PARA REALIZAR OTRA OPERACION</h3>

                <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
            </div>
        </div>
        
        <script type="text/javascript">
            tablas = document.getElementsByTagName("table")[0]
            tabla = tablas.lastElementChild;
            filas = tabla.getElementsByTagName("tr");
            
            for (let fila of filas) {
                if (fila.firstElementChild.textContent == "${param.isbn}") {
                    var nuevo = fila;
                    
                    nuevo.style.backgroundColor="lightgreen";
                }
            }
        </script>
    </body>
</html>
