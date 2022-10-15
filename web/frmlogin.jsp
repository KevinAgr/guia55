<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="css/bulma.min.css">
        
    </head>
    <body>
        <section class="hero is-primary is-fullheight">
            <div class="hero-body">
              <div class="container">
                <div class="columns is-centered">
                  <div class="column is-5-tablet is-4-desktop is-3-widescreen">
                      
                    <form action="validar.jsp" method="post" class="box">
                        <c:if test="${not empty param.msg}">
                        <article class="message is-danger">
                            <div class="message-header">
                                <p>Error:</p>
                            </div>
                            <div class="message-body">
                                ${param.msg}
                            </div>
                        </article>
                    </c:if>
                      <div class="field">
                        <label>Usuario:</label>
                        <div class="control">
                          <input name="usuario" id="usuario" class="input" type="text" />
                        </div>
                      </div>
                      <div class="field">
                        <label>Contraseña:</label>
                        <div class="control">
                          <input name="clave" id="clave" class="input" type="password" />
                        </div>
                      </div>
                        <c:if test="${not empty param.msg}">
                            
                        </c:if>
                      <div class="field">
                        <button class="button is-success" type="submit">
                          Login
                        </button>
                         <a class="button is-danger" href="index.jsp"/>Volver</a>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
        </section>
    </body>
</html>

