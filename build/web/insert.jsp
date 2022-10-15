
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
        <title>BSV-Insertar</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/3389/3389081.png" type="image/x-icon">
    </head>
    <body>
        <c:if test="${empty param.isbn or empty param.titulo or empty param.autor or empty param.editorial}">
            <c:redirect url="index.jsp">     
                <c:param name="error" value="Debe completar todos lo campos" />
            </c:redirect>
        </c:if>

        <sql:update dataSource="${fuenteDatos}" var="result">
            INSERT INTO libro (isbn,titulo,autor,editorial) VALUES (?,?,?,?);
            <sql:param value="${param.isbn}"/>
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>  
            <sql:param value="${param.editorial}"/> 
        </sql:update>

        <c:if test="${result>=1}">
            <c:redirect url="index.jsp">     
                <c:param name="success" value="Registro Guardado" />
            </c:redirect>
        </c:if>    


    </body>
</html>
