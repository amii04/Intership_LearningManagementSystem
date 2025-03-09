//package com.project.lms.util;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//
//public class DBConnect {
//	private final static String URL = "jdbc:oracle:thin:@//localhost:1521/XEPDB1";
//	private final static String USER_NAME = "lms";
//	private final static String PASSWORD = "root";
//	private static Connection connection = null;
//
//	private DBConnect() {
//	}
//
//	private static class SingletonHelper {
//		private static final DBConnect INSTANCE = new DBConnect();
//	}
//
//	public static DBConnect getInstance() {
//		return SingletonHelper.INSTANCE;
//	}
//
//	public Connection getConnection() {
//		try {
//			if (connection == null || connection.isClosed()) {
//				connection = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			throw new RuntimeException("Failed to create Database Connection");
//		}
//		return connection;
//	}
//
//	public void closeConnection() {
//		try {
//			if (connection != null && !connection.isClosed()) {
//				connection.close();
//				connection = null;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
//}
package com.project.lms.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    private final static String URL = "jdbc:oracle:thin:@//localhost:1521/XEPDB1";
    private final static String USER_NAME = "lms";
    private final static String PASSWORD = "root";
    private static Connection connection = null;

    private DBConnect() {
    }

    private static class SingletonHelper {
        private static final DBConnect INSTANCE = new DBConnect();
    }

    public static DBConnect getInstance() {
        return SingletonHelper.INSTANCE;
    }

    public Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                // Explicitly load the Oracle JDBC driver
                Class.forName("oracle.jdbc.OracleDriver");
                connection = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Oracle JDBC Driver not found!", e);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to create Database Connection", e);
        }
        return connection;
    }

    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                connection = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
