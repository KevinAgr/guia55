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
        <title>ELIMINAR LIBRO</title>
        <link rel="stylesheet" href="css/bulma.min.css">
        <style>
            .fila${param.isbn} {background-color:red;color:pink;}
        </style>
    </head>
    
    <body>
        <h1>ELIMINAR UN REGISTRO DE LA TABLA</h1>
        
        <h3>Observe que el registro a borrar se marca de color rojo en la primera tabla y que en la segunda tabla ya no aparece</h3>
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT isbn, titulo, autor, e.nombre FROM libro l INNER JOIN editorial e ON l.editorial = e.id ORDER BY isbn;
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
                        <tr class = "fila${row.isbn}">
                            <td><c:out value = "${row.isbn}"/></td>
                            <td><c:out value = "${row.titulo}"/></td>
                            <td><c:out value = "${row.autor}"/></td>
                            <td><c:out value = "${row.nombre}"/></td>
                        </tr>
                    </c:forEach>
                </table> 
                
                <c:set var = "libIsbn" value = "${param.isbn}"/>
            
                <sql:update dataSource = "${fuenteDatos}" var = "count">
                    DELETE FROM libro WHERE isbn = ?
                    <sql:param value = "${libIsbn}" />
                </sql:update>

                <h3 style="background-color:yellow;">***REGRESE A INDEX PARA REALIZAR OTRA OPERACION</h3>

                <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
            </div>
        </div>
    </body>
</html>
