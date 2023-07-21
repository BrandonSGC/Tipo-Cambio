
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
          <a href="./index.html" class="header__logo">
            <img
              class=""
              src="./img/global-currency.png"
              alt="Global Way logo"
            />
            <h1>Global Way</h1>
          </a>
          <nav class="navigation">
            <a href="./compra_venta.html" class="navigation__link"
              >Compra & Venta</a
            >
            <a href="./registro_usuario.html" class="navigation__link"
              >Registrar Usuario</a
            >
            <a href="./tipo_cambio.html" class="navigation__link"
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
            />
          </div>

          <button type="submit" class="form__button">Confirmar</button>
        </form>
      </div>
    </section>

    <footer class="footer">
      <h3 class="footer__heading">Footer</h3>
    </footer>
  </body>
</html>