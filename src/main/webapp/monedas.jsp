
<%@page import="java.util.List"%>
<%@page import="Logic.Moneda"%>
<%@page import="Logic.Moneda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./normalize.css" />
    <link rel="stylesheet" href="./styles.css" />
    <title>Global Way - Project</title>
  </head>
  <body>
    <header class="header">
      <div class="header__container">
        <div class="header__display">
          <a href="/GlobalWay" class="header__logo">
            <img
              class=""
              src="./img/global-currency.png"
              alt="Global Way logo"
            />
            <h1>Global Way</h1>
          </a>
          <nav class="navigation">
            <a href="/GlobalWay/monedas.jsp" class="navigation__link"
              >Compra & Venta</a
            >
            <a href="/GlobalWay" class="navigation__link"
              >Registrar Usuario</a
            >
            <a href="/GlobalWay" class="navigation__link"
              >Tipo de Cambio</a
            >
          </nav>
        </div>
      </div>
    </header>

    <section class="trade">
      <div class="container">
        <form class="form-compra-venta" action="svReserva" method="post">
          <h2 class="form__heading">Compra - Venta</h2>
          <div class="form__field">
            <label class="form__label">Moneda deseada:</label>
            <select class="form__input" name="moneda_deseada" id="moneda_deseada">
              <%
                  List<Moneda> listaMonedas = (List) request.getSession().getAttribute("listaMonedas");
                  
                  for(Moneda mon : listaMonedas) {
              %>
                    <option value="<%=mon.getId()%>"><%=mon.getName()%></option>
              <%  }%>
            </select>
          </div>

          <div class="form__field">
            <label class="form__label">Moneda de pago:</label>
            <select class="form__input" name="moneda_pago" id="moneda_pago">
                <%
                  
                  for(Moneda mon : listaMonedas) {
              %>
                    <option value="<%=mon.getId()%>"><%=mon.getName()%></option>
              <%  }%>
            </select>
          </div>

          <div class="form__field">
            <label class="form__label" for="monto_cambiar">Que monto quiere cambiar de la moneda deseada?</label>
            <input
              class="form__input"
              id="monto_cambiar"
              type="number"
              name="monto_cambiar"
              placeholder="Ejemplo: 1000"
              required
            />
          </div>

          <button type="submit" class="form__button">Confirmar</button>
        </form>
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