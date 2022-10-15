<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="index.jsp">
      Catálogo de libros
    </a>

    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="#navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-end">
      <div class="navbar-item">
          <c:if test="${not empty sessionScope.user}">
              <c:if test="${sessionScope.user != 'Anonimo'}">
              <div class="navbar-item">
              <p>
                  Usuario: ${sessionScope.user}
              </p>
              </div>
                <a class="button is-danger"  href="logout.jsp">Logout</a>
        </c:if>
    </c:if>
        <div class="buttons">
           <c:if test="${empty sessionScope.user or sessionScope.user eq 'Anonimo'}">
            <a class="button is-light" href="frmlogin.jsp">
                Iniciar Sesión
            </a>
          </c:if>
        </div>
      </div>
    </div>
  </div>
</nav>