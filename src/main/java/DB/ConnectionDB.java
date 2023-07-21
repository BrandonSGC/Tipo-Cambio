package DB;

import Logic.Moneda;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ConnectionDB {
    
    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=GlobalWay;trustServerCertificate=true;";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "root";
    
    // Método para obtener la conexión a la base de datos
    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al establecer la conexión: " + e.getMessage());
            return null;
        }
    }
    
    // Método para ejecutar el stored procedure spGlobalWay_RegistrarUsuario
    public static void execSPGlobalWay_RegistrarUsuario(Connection conn, String nombre, String apellidos, int cedula, int telefono, String email) {
        try {
            String sql = "{CALL spGlobalWay_RegistrarUsuario(?, ?, ?, ?, ?)}";
            CallableStatement cstmt = conn.prepareCall(sql);

            cstmt.setString(1, nombre);
            cstmt.setString(2, apellidos);
            cstmt.setInt(3, cedula);
            cstmt.setInt(4, telefono);
            cstmt.setString(5, email);

            cstmt.execute();
            System.out.println("Stored procedure ejecutado exitosamente.");
            cstmt.close();
        } catch (SQLException e) {
            System.out.println("Error al ejecutar el stored procedure: " + e.getMessage());
        }
    }
    
    // Método para ejecutar el stored procedure spGlobalWay_RegistrarUsuario
    public static void execSPGlobalWay_RegistroMoneda(Connection conn, String name, double value, int commission) {
        try {
            String sql = "{CALL spGlobalWay_RegistroMoneda(?, ?, ?)}";
            CallableStatement cstmt = conn.prepareCall(sql);

            cstmt.setString(1, name);
            cstmt.setDouble(2, value);
            cstmt.setInt(3, commission);

            cstmt.execute();
            System.out.println("Stored procedure ejecutado exitosamente.");
            cstmt.close();
        } catch (SQLException e) {
            System.out.println("Error al ejecutar el stored procedure: " + e.getMessage());
        }
    }
    
    
    public static List<Moneda> ObtenerInfoMonedas(Connection conn) {
        List<Moneda> listaMonedas = new ArrayList<>();
        try {
            String sql = "{CALL spGlobalWay_ObtenerInfoMonedas}";
            CallableStatement cstmt = conn.prepareCall(sql);

            ResultSet rs = cstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                double valor = rs.getDouble("valor");
                int comision = rs.getInt("comision");

                listaMonedas.add(new Moneda(id, nombre, valor, comision));
            }
            System.out.println("Stored procedure ejecutado exitosamente.");
            rs.close();
            cstmt.close();
        } catch (SQLException e) {
            System.out.println("Error al ejecutar el stored procedure o procesar el ResultSet: " + e.getMessage());
        }
        return listaMonedas;
    }
    
    
    // Método para ejecutar el stored procedure spGlobalWay_RegistrarUsuario
    public static void execSPGlobalWay_GuardarReserva(Connection conn, int id_moneda_deseada, int id_moneda_pago,  int monto_cambiar) {
        try {
            String sql = "{CALL spGlobalWay_GuardarReserva(?, ?, ?)}";
            CallableStatement cstmt = conn.prepareCall(sql);

            cstmt.setInt(1, id_moneda_deseada);
            cstmt.setInt(2, id_moneda_pago);
            cstmt.setInt(3, monto_cambiar);

            cstmt.execute();
            System.out.println("Stored procedure ejecutado exitosamente.");
            cstmt.close();
        } catch (SQLException e) {
            System.out.println("Error al ejecutar el stored procedure: " + e.getMessage());
        }
    }
}