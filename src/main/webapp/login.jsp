
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
        <form class="form" action="svLogin" method="post">
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
                type="text"
                name="password"
                placeholder="Contraseña"
                
              />
            </fieldset>
            <fieldset class="form__fieldset">
                <button class="navigation__button" type="">Iniciar Sesion</button>
            </fieldset>
          </form>
        <form action="svRegistroUsuariosGW" method="get">
            <button class="navigation__button" type="submit">Registrar Usuario</button>
        </form>
    </body>
</html>
