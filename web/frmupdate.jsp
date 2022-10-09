<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Actualizar libro</title>
       <link rel="stylesheet" href="css/bulma.min.css">
    </head>
    
    <body>
        <div class="columns m-2">
            <div class="column is-4">
                <article class="message is-info">
                    <div class="message-header ">
                        <h1>Actualizacion del libro</h1>
                    </div>
                    <div class="message-body field">
                        <form action="update.jsp" method="post" name="Actualizar">
                            <div class="columns">
                                <div class="column">
                                    <input 
                                        type="hidden"
                                        name="isbn"
                                        value="${param.isbn}"
                                        ></input>
                                    <label for="nombre" class="label">ISBN: </label>
                                    <div class="control">
                                        <input type="text" 
                                               class="input is-rounded" 
                                               name="Nisbn" 
                                               value="${param.isbn}" 
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
                                               value="${param.titulo}" 
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
                                               name="autor" value="${param.autor}" 
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
                                                <sql:query dataSource = "${fuenteDatos}" var = "result">
                                                    SELECT * FROM editorial;
                                                </sql:query>
                                                
                                                <c:forEach var = "row" items = "${result.rows}">
                                                    <c:choose>
                                                        <c:when test="${param.editorial eq row.nombre}">
                                                            <option value="${row.Id}" selected><c:out value = "${row.nombre}"/></option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${row.Id}"><c:out value = "${row.nombre}"/></option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select> 
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button class="button is-success" type="submit">
                                <span>ACTUALIZAR</span>
                            </button>
                        </form>
                    </div>
                </article>
            </div>
        </div>
    </body>
</html>
