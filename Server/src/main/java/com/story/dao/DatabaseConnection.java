package com.story.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DatabaseConnection {
	private static ThreadLocal<Connection> con = new ThreadLocalConnection();
    private final static org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(DatabaseConnection.class);

    
    public static Connection getConnection() {
        Connection conn = con.get();
        try {
            conn.getMetaData();
        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e2) {
                
            }
            con.remove();
            conn = con.get();
        }
        return conn;
    }
    private static class ThreadLocalConnection extends ThreadLocal<Connection> {

        @Override
        protected Connection initialValue() {
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/fuckerstory?characterEncoding=utf-8";
            String user = "root";
            String password = "1234";
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e) {
                log.error("ERROR", e);
            }
            try {
                Connection con = DriverManager.getConnection(url, user, password);
                return con;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }
    }
}
