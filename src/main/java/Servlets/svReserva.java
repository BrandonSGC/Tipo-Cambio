
package Servlets;

import DB.ConnectionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "svReserva", urlPatterns = {"/svReserva"})
public class svReserva extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svReserva</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svReserva at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String moneda_deseada = request.getParameter("moneda_deseada");
        String moneda_pago = request.getParameter("moneda_pago");
        String monto_cambiar = request.getParameter("monto_cambiar");
        
        System.out.println(moneda_deseada + moneda_pago + monto_cambiar);
        
        // Validar si es a dolar.
        
        // Obtener la conexión
        Connection conn = ConnectionDB.getConnection();
        
        if (conn != null) {
            
            // Llamar al stored procedure utilizando el método de ConnectionDB
            ConnectionDB.execSPGlobalWay_GuardarReserva(conn, Integer.parseInt(moneda_deseada), Integer.parseInt(moneda_pago), Integer.parseInt(monto_cambiar));

            // Cerrar la conexión cuando ya no sea necesaria.
            try {
                conn.close();
                response.sendRedirect("/GlobalWay/svMostrarReservas");
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        } else {
            System.out.println("Error en la conexion...");
        }

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
