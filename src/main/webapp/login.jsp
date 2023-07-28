
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./normalize.css" />
        <link rel="stylesheet" href="./styles.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <form class="form login" action="svLogin" method="post">
            <h1 class="form__heading">Iniciar Sesión</h1>
            <fieldset class="form__fieldset">
              <input
                class="form__input"
                type="text"
                name="user"
                placeholder="Usuario"
                
              />
              
              <input
                class="form__input"
                type="password"
                name="password"
                placeholder="Contraseña"
                
              />
            </fieldset>
            
            <button class="form__button" type="">Iniciar Sesion</button><br>
            <a href="registrarUsuarioGW.jsp" class="form__button">Registrar Usuarios</a>
            <c:if test="${not empty mensaje}">
                <p style="color: red;">${mensaje}</p>
            </c:if>
          </form>
        </div>
    </body>
</html>
