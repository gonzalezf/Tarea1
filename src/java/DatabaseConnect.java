
import java.sql.*;


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Felipe Gonzalez
 */
public class DatabaseConnect {


    public Connection getConnection() throws Exception {
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        String username = "system";
        String password = "pelife18";
        Class.forName(driver);
        return DriverManager.getConnection(url, username, password);
    }



}
