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
        <title>ACTUALIZAR LIBRO</title>
        <link rel="stylesheet" href="css/bulma.min.css">
        <style>
            .fila${param.isbn} {background-color:orange;}
            .fila${param.Nisbn} {background-color:orange;}
        </style>
    </head>
    <body>
        <h1>ACTUALIZACION DE LIBRO</h1>
        
        <p style="color:blue;font-size: 7mm;">
            A continuación se cambiara al registro ${param.isbn}
        </p>

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
                        <tr class="fila${row.isbn}">
                            <td><c:out value = "${row.isbn}"/></td>
                            <td><c:out value = "${row.titulo}"/></td>
                            <td><c:out value = "${row.autor}"/></td>
                            <td><c:out value = "${row.nombre}"/></td>
                        </tr>
                    </c:forEach>
                </table> 
            </div>
        </div>
        
        <p style="color:blue;font-size: 7mm;">
            El cambio ralizado se refleja en la tupla naranja
        </p>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE libro SET titulo = ?, autor = ?, editorial = ?, isbn = ? WHERE isbn = ?
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>
            <sql:param value = "${param.Nisbn}" />
            <sql:param value = "${param.isbn}" />
        </sql:update>
            
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
                        <tr class="fila${row.isbn}">
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
    </body>
</html>
