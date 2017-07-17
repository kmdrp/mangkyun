package com.test;

import java.sql.*;

public class DBCon {

    private static DBCon instance=null;

    private String driver="org.mariadb.jdbc.Driver";
    private String url="jdbc:mariadb://kyunihsv.iptime.org:3306/BBS";
    private String uid="mysqluser";
    private String upw="dltjrgus";
    private DBCon() {

    }
    public static DBCon getInstance(){
        if (instance == null) {
            instance = new DBCon();
        }
        return instance;
    }
    public Connection getConnection(){
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, uid, upw);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }




}
