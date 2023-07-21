<%@page import="java.util.List"%>
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

    <section class="section">
      <div class="container">
        <div class="section__display">
          <form class="form" action="svUsuarios" method="post">
            <h2 class="form__heading">Registrar Usuario</h2>
            <fieldset class="form__fieldset">
              <input
                class="form__input"
                type="text"
                name="name"
                placeholder="Nombre"
              />
              <input
                class="form__input"
                type="text"
                name="surnames"
                placeholder="Apellidos"
              />
            </fieldset>
            <fieldset class="form__fieldset">
              <input
                class="form__input"
                type="number"
                name="cedula"
                placeholder="Cédula"
              />
              <input
                class="form__input"
                type="number"
                name="phone"
                placeholder="Teléfono"
              />
            </fieldset>
            <input
              class="form__input"
              type="email"
              name="email"
              placeholder="Correo electrónico"
            />
            <button type="submit" class="form__button">Registrar Usuario</button>
          </form>

          <form class="form" action="svMonedas" method="post">
            <h2 class="form__heading">Tipo de Cambio</h2>
            <div class="form__field">
              <label for="coin" class="form__label">Moneda:</label>
              <input
                class="form__input"
                type="text"
                name="coin"
                id="coin"
                placeholder="Ejemplo: Colones"
              />
            </div>
  
            <div class="form__field">
              <label for="value" class="form__label">Valor de 1$:</label>
              <input
                class="form__input"
                type="text"
                name="value"
                id="value"
                placeholder="Ejemplo: 520"
              />
            </div>
  
            <div class="form__field">
              <label class="form__label" for="commission">Comisión en %:</label>
              <input
                class="form__input"
                id="commission"
                type="number"
                name="commission"
                placeholder="Ejemplo: 3"
              />
            </div>
            <button type="submit" class="form__button">Registrar Moneda</button>
          </form>
        </div>
        
      </div>
    </section>

    <section class="trade">
      <div class="container">
        <form class="form-compra-venta" action="svMonedas" method="get">
          <h2 class="form__heading">Compra - Venta</h2>

          <button type="submit" class="form__button">Ir a Compra - Venta</button>
        </form>
      </div>
    </section>

    <footer class="footer">
      <h3 class="footer__heading">Footer</h3>
    </footer>
  </body>
</html>