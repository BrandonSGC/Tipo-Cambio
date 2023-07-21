
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

@WebServlet(name = "svUsuarios", urlPatterns = {"/svUsuarios"})
public class svUsuarios extends HttpServlet {

    private static final long serialVersionUID = 1L;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svUsuarios</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svUsuarios at " + request.getContextPath() + "</h1>");
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

        String name = request.getParameter("name");
        String surnames = request.getParameter("surnames");
        String cedula = request.getParameter("cedula");
        String phoneNumber = request.getParameter("phone");
        String email = request.getParameter("email");
        
        System.out.println(name + surnames + cedula + phoneNumber + email);
        
        // Obtener la conexión
        Connection conn = ConnectionDB.getConnection();

        if (conn != null) {
            
            // Llamar al stored procedure utilizando el método de ConnectionDB
            ConnectionDB.execSPGlobalWay_RegistrarUsuario(conn, name, surnames, Integer.parseInt(cedula), Integer.parseInt(phoneNumber), email);

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