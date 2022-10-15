<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@include file="fuenteDatos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Libro</title>
    </head>
    <body>
        <sql:update dataSource="${fuenteDatos}" var="count">
            UPDATE libro SET isbn = ?,titulo = ?,autor = ?, editorial=?
            WHERE id='${param.id}'
            <sql:param value="${param.isbn}"/>
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>  
            <sql:param value="${param.editorial}"/> 
        </sql:update>
            <c:choose>
  <c:when test="${count>=1}">
    <script>
                location.href = "index.jsp";
            </script>
  </c:when>
  
  <c:otherwise>
        <script>
                location.href = "error.jsp?tipo=parametro";
            </script>
  </c:otherwise>
</c:choose>
  
        
    </body>
</html>
