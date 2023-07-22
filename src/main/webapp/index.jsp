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
                required
              />
              <input
                class="form__input"
                type="text"
                name="surnames"
                placeholder="Apellidos"
                required
              />
            </fieldset>
            <fieldset class="form__fieldset">
              <input
                class="form__input"
                type="number"
                name="cedula"
                placeholder="Cédula"
                required
              />
              <input
                class="form__input"
                type="number"
                name="phone"
                placeholder="Teléfono"
                required
              />
            </fieldset>
            <input
              class="form__input"
              type="email"
              name="email"
              placeholder="Correo electrónico"
              required
            />
            <button type="submit" class="form__button">Registrar Usuario</button>
          </form>

          <form class="form" action="svMonedas" method="post">
            <h2 class="form__heading">Tipo de Cambio</h2>
            
            <fieldset class="form__fieldset">
                <div class="form__field">
                <label for="coin" class="form__label">Moneda:</label>
                <input
                  class="form__input"
                  type="text"
                  name="coin"
                  id="coin"
                  placeholder="Ejemplo: Colones"
                  required
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
            </fieldset>
            
            <fieldset class="form__fieldset">
                <div class="form__field">
                <label for="valor_dolar_moneda" class="form__label">Valor de 1$ a moneda?</label>
                <input
                  class="form__input"
                  type="text"
                  name="valor_dolar_moneda"
                  id="valor_dolar_moneda"
                  placeholder="Ejemplo: 520"
                  required
                />
              </div>

              <div class="form__field">
                <label for="valor_moneda_dolar" class="form__label">Valor de moneda a 1$:</label>
                <input
                  class="form__input"
                  type="text"
                  name="valor_moneda_dolar"
                  id="valor_moneda_dolar"
                  placeholder="Ejemplo: 0,0090"
                  required
                />
              </div>
            </fieldset>
  
  
            
            <button type="submit" class="form__button">Registrar Moneda</button>
          </form>
        </div>
        
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