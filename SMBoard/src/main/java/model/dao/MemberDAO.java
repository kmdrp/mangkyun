package model.dao;

import model.manager.PoolManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    PoolManager manager;
    public MemberDAO(){
        manager=PoolManager.getInstance();
    }

    public boolean login(String id,String password){
        boolean result=false;
        Connection con = manager.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select * from member where id=? and password=?";
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = true;
            }else{
                result=false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            manager.freeConnection(con,pstmt,rs);
        }
        return result;
    }

    public int join(String id,String name,String password,String nickname){
        int result=0;
        Connection con = manager.getConnection();
        PreparedStatement pstmt=null;
        String sql = "insert into member values(?,?,?,?)";

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,id);
            pstmt.setString(2,name);
            pstmt.setString(3,password);
            pstmt.setString(4,nickname);

            int result_of_join = pstmt.executeUpdate();
            if(result_of_join==1){
                result=1;
            }else{
                result =0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            manager.freeConnection(con,pstmt);
        }
        return result;
    }

}
