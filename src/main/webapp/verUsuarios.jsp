

<%@page import="Logic.UsuariosGW"%>
<%@page import="java.util.List"%>
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
        <h1>Usuarios de Global Way</h1>
        <%
            List<UsuariosGW> listaUsuarios = (List) request.getSession().getAttribute("listaUsuarios");
                  
            for(UsuariosGW user : listaUsuarios) {
        %>
              <p><%=user.getUsuario()%></p>
              <p><%=user.getNombre()%></p>
              <p><%=user.getContrasena()%></p>
              <p><%=user.getEmail()%></p>
        <%  }%>
    </body>
</html>
