
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


@WebServlet(name = "svRegistroUsuariosGW", urlPatterns = {"/svRegistroUsuariosGW"})
public class svRegistroUsuariosGW extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svRegistroUsuariosGW</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svRegistroUsuariosGW at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("registrarUsuarioGW.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        
        // Obtener la conexión
        Connection conn = ConnectionDB.getConnection();

        if (conn != null) {
            
            // Llamar al stored procedure utilizando el método de ConnectionDB
            ConnectionDB.execSPGlobalWay_RegistrarUsuariosGW(conn, user, password, name, email);

            // Cerrar la conexión cuando ya no sea necesaria.
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
            response.sendRedirect("login.jsp");
        }
    }


    public String getServletInfo() {
        return "Short description";
    }

}
