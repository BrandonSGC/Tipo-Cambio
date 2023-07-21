package Servlets;

import DB.ConnectionDB;
import static DB.ConnectionDB.ObtenerInfoMonedas;
import Logic.Moneda;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "svMonedas", urlPatterns = {"/svMonedas"})
public class svMonedas extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svMonedas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svMonedas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener la conexión
        Connection conn = ConnectionDB.getConnection();

        if (conn != null) {
            List<Moneda> listaMonedas = ConnectionDB.ObtenerInfoMonedas(conn);

            HttpSession misesion = request.getSession();
            misesion.setAttribute("listaMonedas", listaMonedas);

            // Cerrar la conexión cuando ya no sea necesaria.
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }

            response.sendRedirect("monedas.jsp");
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String coin = request.getParameter("coin");
        String value = request.getParameter("value");
        String commission = request.getParameter("commission");
        
        // Obtener la conexión
        Connection conn = ConnectionDB.getConnection();

        if (conn != null) {
            
            // Llamar al stored procedure utilizando el método de ConnectionDB
            ConnectionDB.execSPGlobalWay_RegistroMoneda(conn, coin, Double.parseDouble(value), Integer.parseInt(commission));

            // Cerrar la conexión cuando ya no sea necesaria.
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
            response.sendRedirect("index.jsp");
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
