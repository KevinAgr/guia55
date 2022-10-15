<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuenteDatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edicion del libro N° ${param.id}</title>
        <link rel="stylesheet" type="text/css" href="css/bulma.min.css">
    </head>
    <body>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro WHERE id = ?;
            <sql:param value="${param.id}"/>
        </sql:query>

        <div class="columns">
                <div class="column">
                    <article class="message is-info">
  			<div class="message-header ">
                            <h1>Modificar libro</h1>
                        </div>
                        <div class="message-body field">
                            <form  method="post" action="update.jsp">
                                <c:forEach var="row" items="${result.rows}">
                                 <input type="hidden" value="${param.id}" name="id"/>
				<div class="columns">
                                    <div class="column">
                                        <label for="nombre" class="label">ISBN: </label>
					<div class="control">
                                            <input type="text" class="input is-rounded" name="isbn"  size="13" maxlength="13" pattern="[0-9]{13}" title="Debe ingresar 13 digitos" required value="${row.isbn}"/>
					</div>
                                    </div>
				</div>
				<div class="columns">
                                    <div class="column">
                                        <label for="nombre" class="label">Título: </label>
					<div class="control">
                                            <input type="text" class="input is-rounded" name="titulo"  size="50" pattern="[a-zA-Z0-9\,]{0,50}" title="Solo debe ingresar texto y maximo 50 caracteres" required value="${row.titulo}"/>                  
					</div>
                                    </div>
				</div>
                                <div class="columns">
                                    <div class="column">
                                        <label for="nombre" class="label">Autor: </label>
					<div class="control">
                                            <input type="text" class="input is-rounded" name="autor"  size="50" required  pattern="[a-zA-Z\,]{0,50}" title="Solo debe ingresar texto sin acento y maximo 50 caracteres" value="${row.autor}"/>  
                                        </div>
                                    </div>
				</div>
                                <div class="columns">
                                    <div class="column">
                                        <label for="perfil" class="label">Editorial: </label>
                                        <div class="control">
                                            <div class="select">
                                                <select name="editorial" class="input is-rounded">
                                                    <option value="Santillana">Santillana</option> 
                                                    <option value="Novela">Novela</option>   
                                                    <option value="Ediciones Martinez Roca">Ediciones Martinez Roca</option> 
                                                    <option value="Edisal">Edisal</option>
                                                    <option value="Renacimiento">Renacimiento</option>
                                                </select> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                <div class="columns">
                                    <button class="button is-success m-2" type="submit">
                                        Modificar
                                    </button>
                                    <a class="button is-danger m-2" href="index.jsp" >Cancelar</a>
                                </div>
                            </form>
                        </div>
		</article>
            </div>
        </div>
    </body>
</html>
