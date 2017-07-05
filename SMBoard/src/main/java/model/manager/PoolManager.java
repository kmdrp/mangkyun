package model.manager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class PoolManager {
    private static PoolManager instance=null;
    private PoolManager(){

    }

    public static PoolManager getInstance(){
        if(instance==null){
            instance=new PoolManager();
        }
        return instance;
    }
    public Connection getConnection(){
        //porps로 디비 정보 불러와서 커넥션 연결
        Properties props = new Properties();
        DataSource ds=null;
        Connection con=null;

        try {
            //props.load(new FileInputStream("db.info"));
            Context ctx1 = new InitialContext();
            Context ctx2 = (Context) ctx1.lookup("java:comp/env");

            ds = (DataSource) ctx2.lookup("jdbc/mariadb");
            con = ds.getConnection();
        }catch (NamingException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    public void freeConnection(Connection con){
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public void freeConnection(Connection con, PreparedStatement pstmt){
        if(pstmt!=null){
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public void freeConnection(Connection con, PreparedStatement pstmt, ResultSet rs){
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(pstmt!=null){
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
