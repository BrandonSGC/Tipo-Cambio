<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./normalize.css" />
    <link rel="stylesheet" href="./styles.css" />
    <title>Reservas</title>
</head>
<body>
    <header class="header">
      <div class="header__container">
        <div class="header__display">
          <a href="/GlobalWay/index.jsp" class="header__logo">
            <img
              class=""
              src="./img/global-currency.png"
              alt="Global Way logo"
            />
            <h1>Global Way</h1>
          </a>
          <nav class="navigation">
            <form action="svMonedas" method="get">
                <button class="navigation__button" type="submit">Compra & Venta</button>
            </form>
            <a href="/GlobalWay/index.jsp" class="navigation__link"
              >Registrar Usuario</a
            >
            <a href="/GlobalWay/index.jsp" class="navigation__link"
              >Tipo de Cambio</a
            >
            <a href="/GlobalWay/svMostrarReservas" class="navigation__link"
              >Mostrar Reservas</a
            >
          </nav>
        </div>
      </div>
    </header>
    
    <main class="main">
      <div class="main__container">
        <div class="main__display">
          <div class="main__text">
            <p class="">
              Bienvenidos a Global Way, una empresa líder dedicada al cambio de
              moneda con una trayectoria excepcional en el mercado financiero.
              Nos hemos consolidado como una opción confiable y segura para
              aquellos que buscan realizar operaciones de cambio de moneda de
              manera eficiente y transparente.
            </p>
            <p>
              A lo largo de los años, hemos forjado relaciones sólidas con
              nuestros clientes, construyendo una reputación basada en la
              excelencia y la confiabilidad. Cada vez que eliges Global Way, te
              aseguras de recibir un servicio de primera clase y resultados que
              superan tus expectativas.
            </p>
          </div>
          <div class="main__image">
            <img class="display__imagen" src="./img/crowd-funding.png" alt="" />
          </div>
        </div>
      </div>
    </main>
    
    <section class="reservas">
        <div class="reservas__container">
            <h1 class='reservas__heading'>Lista de Reservas</h1>
            <table class="reservas__table" border="1" style="margin: 5rem auto;">
                <tr>
                    <th>ID</th>
                    <th>Moneda Deseada</th>
                    <th>Moneda de Pago</th>
                    <th>Monto a Cambiar</th>
                    <th>Monto a pagar</th>
                    <th>Comisión</th>
                    <th>Monto total a pagar</th>
                </tr>
                <%-- Obtener la lista de mapas de la solicitud --%>
                <% List<Map<String, Object>> reservasList = (List<Map<String, Object>>) request.getAttribute("reservasList"); %>
                <%-- Iterar a través de los resultados y mostrarlos en la tabla --%>
                <% for (Map<String, Object> reserva : reservasList) { %>
                    <tr>
                        <td><%= reserva.get("id") %></td>
                        <td><%= reserva.get("Moneda Deseada") %></td>
                        <td><%= reserva.get("Moneda de Pago") %></td>
                        <td><%= reserva.get("Monto a Cambiar") %></td>
                        <td><%= reserva.get("Monto a pagar") %></td>
                        <td><%= reserva.get("Comisión") %></td>
                        <td><%= reserva.get("Monto total a pagar") %></td>
                    </tr>
                <% } %>
            </table>
        </div>
    </section>
    
    <footer class="footer">
      <div class="footer__container">
        <div class="footer__display">
          <div class="footer__column">
            <h3 class="footer__heading">Universidad</h3>
            <img class="footer__image footer__image--cuc" src="./img/blackCUC-NoText.png" alt="CUC logo">
            <a class="footer__link" href="https://www.cuc.ac.cr/" target="_blank">Colegio Universitario de Cartago</a>
          </div>
          
          <div class="footer__column">
            <h3 class="footer__heading">Curso</h3>
            <img class="footer__image" src="./img/coding (1).png" alt="Programming">
            <p class="footer__student">Programación IV</p>
          </div>

          <div class="footer__column">
            <h3 class="footer__heading">Estudiante</h3>
            <img class="footer__image" src="./img/student-card.png" alt="Student">
            <p class="footer__student">Brandon Gómez Carvajal</p>
          </div>
        </div>
        <p class="footer__description">Website Created and Designed by <span> Brandon Gómez Carvajal </span>&copy;</p>
      </div>
    </footer>
</body>
</html>
