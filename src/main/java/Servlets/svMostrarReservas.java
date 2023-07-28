
package Servlets;

import DB.ConnectionDB;
import static DB.ConnectionDB.ejecutarSPMostrarReservas;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "svMostrarReservas", urlPatterns = {"/svMostrarReservas"})
public class svMostrarReservas extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svMostrarReservas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svMostrarReservas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener la conexión
        Connection conn = ConnectionDB.getConnection();
        try {
            // Obtener los datos del procedimiento almacenado en una lista de mapas
        List<Map<String, Object>> reservasList = ConnectionDB.ejecutarSPMostrarReservas(conn);

        // Guardar los datos en un atributo de la solicitud
        request.setAttribute("reservasList", reservasList);

        // Redirigir la solicitud al archivo JSP para mostrar los datos
        request.getRequestDispatcher("reservas.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de excepciones (opcional)
        } finally {
            // Cerrar la conexión en el bloque finally para asegurarnos de que se cierre incluso en caso de excepciones
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
