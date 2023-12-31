
package Servlets;

import DB.ConnectionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "svLogin", urlPatterns = {"/svLogin"})
public class svLogin extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet svLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet svLogin at " + request.getContextPath() + "</h1>");
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
        
        // Obtener la conexión
        Connection conn = ConnectionDB.getConnection();
        
        if (conn != null) {
            if (ConnectionDB.login(conn, user, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("mensaje", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
