<%-- 
    Document   : registrarUsuarioGW
    Created on : Jul 22, 2023, 1:48:37 PM
    Author     : brans
--%>

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
        <form class="form" action="svRegistroUsuariosGW" method="post">
            <h2 class="form__heading">Registrar Usuario de Global Way</h2>
            <fieldset class="form__fieldset">
              <input
                class="form__input"
                type="text"
                name="user"
                placeholder="Usuario"
                required
              />
              
              <input
                class="form__input"
                type="text"
                name="password"
                placeholder="Contraseña"
                required
              />
            </fieldset>
            <input
                class="form__input"
                type="text"
                name="name"
                placeholder="Nombre"
                required
              />
            <input
              class="form__input"
              type="email"
              name="email"
              placeholder="Correo electrónico"
              required
            />
            <button class="form__button" type="submit">Registrar Usuario</button><br>
            <a href="verUsuarios.jsp" class="form__button">Ver Usuarios</a><br>
            <a href="registrarUsuarioGW.jsp" class="form__button">Modificar Usuarios</a><br>
            <a href="registrarUsuarioGW.jsp" class="form__button">Eiminar Usuarios</a>
          </form>
    </body>
</html>