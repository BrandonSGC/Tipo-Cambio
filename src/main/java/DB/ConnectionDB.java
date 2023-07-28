package DB;

import Logic.Moneda;
import Logic.UsuariosGW;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public static void execSPGlobalWay_RegistroMoneda(Connection conn, String name, double valor_dolar_moneda, double valor_moneda_dolar, int commission) {
        try {
            String sql = "{CALL spGlobalWay_RegistroMoneda(?, ?, ?, ?)}";
            CallableStatement cstmt = conn.prepareCall(sql);

            cstmt.setString(1, name);
            cstmt.setDouble(2, valor_dolar_moneda);
            cstmt.setDouble(3, valor_moneda_dolar);
            cstmt.setInt(4, commission);

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
                double valor_dolar_moneda = rs.getDouble("valor_dolar_moneda");
                double valor_moneda_dolar = rs.getDouble("valor_moneda_dolar");
                int comision = rs.getInt("comision");

                listaMonedas.add(new Moneda(id, nombre, valor_dolar_moneda, valor_moneda_dolar, comision));
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
    
    // Metodo para registrar los usuarios de Global Way
    public static void execSPGlobalWay_RegistrarUsuariosGW(Connection conn, String user, String password, String name, String email) {
        try {
            String sql = "{CALL spGlobalWay_RegistrarUsuariosGW(?, ?, ?, ?)}";
            CallableStatement cstmt = conn.prepareCall(sql);

            cstmt.setString(1, user);
            cstmt.setString(2, password);
            cstmt.setString(3, name);
            cstmt.setString(4, email);

            cstmt.execute();
            System.out.println("Stored procedure ejecutado exitosamente.");
            cstmt.close();
        } catch (SQLException e) {
            System.out.println("Error al ejecutar el stored procedure: " + e.getMessage());
        }
    }
    
    public static boolean login(Connection conn, String user, String password) {
        try {
            String query = "SELECT * FROM USRs_GlobalWay WHERE usuario = ? AND contrasena = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, user);
            statement.setString(2, password);
            ResultSet result = statement.executeQuery();
            // Si hay un resultado, el usuario y contraseña son correctos.
            return result.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    public static List<UsuariosGW> ObtenerUsuariosGW(Connection conn) {
        List<UsuariosGW> listaUsuarios = new ArrayList<>();
        try {
            String sql = "{CALL spGlobalWay_ObtenerUsuarios}";
            CallableStatement cstmt = conn.prepareCall(sql);

            ResultSet rs = cstmt.executeQuery();

            while (rs.next()) {
                String usuario = rs.getString("usuario");
                String contrasena = rs.getString("contrasena");
                String nombre = rs.getString("nombre");
                String email = rs.getString("email");
                

                listaUsuarios.add(new UsuariosGW(usuario, contrasena, nombre, email));
            }
            System.out.println("Stored procedure ejecutado exitosamente.");
            rs.close();
            cstmt.close();
        } catch (SQLException e) {
            System.out.println("Error al ejecutar el stored procedure o procesar el ResultSet: " + e.getMessage());
        }
        return listaUsuarios;
    }
    
    
    
    public static List<Map<String, Object>> ejecutarSPMostrarReservas(Connection conn) throws SQLException {
        CallableStatement stmt = null;
        ResultSet rs = null;

        try {
            String sql = "{CALL spGlobalWay_MostrarReservas}";
            stmt = conn.prepareCall(sql);
            rs = stmt.executeQuery();

            // Crear una lista para almacenar los datos del ResultSet
            List<Map<String, Object>> reservasList = new ArrayList<>();

            // Obtener la información de las columnas del ResultSet
            int columnCount = rs.getMetaData().getColumnCount();
            String[] columnNames = new String[columnCount];
            for (int i = 0; i < columnCount; i++) {
                columnNames[i] = rs.getMetaData().getColumnName(i + 1);
            }

            // Recorrer el ResultSet y agregar los datos a la lista
            while (rs.next()) {
                Map<String, Object> reservaMap = new HashMap<>();
                for (int i = 0; i < columnCount; i++) {
                    reservaMap.put(columnNames[i], rs.getObject(columnNames[i]));
                }

                reservasList.add(reservaMap);
            }

            return reservasList;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            // Cerrar recursos
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            // No cierres la conexión aquí
        }
    }

    
}