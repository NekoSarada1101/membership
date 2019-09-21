
package dao;

import javax.sql.DataSource;
import java.sql.*;

public class DaoBase {
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    int rsno = 0;

    DataSource ds = null;

    public Connection DbOpen() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Membership?characterEncoding=UTF-8&serverTimezone=JST", "root", "cVnvEfW84P9gi2HG");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return con;
    }

    public void DbClose() {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
