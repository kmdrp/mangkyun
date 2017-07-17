package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertCode {

    DBCon dbCon = DBCon.getInstance();

  /*  public void insert(String str){
        Connection con=null;
        PreparedStatement pstmt=null;
        String sql="insert into test values(?)";

        try {
            con = dbCon.getConnection();
            pstmt = con.prepareStatement(sql);
            int result=pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

    }*/
    public void insertArr(String[] str){
        Connection con=null;
        PreparedStatement pstmt=null;
        String sql="insert into test(b_content) values(?)";
        for(int i=0;i<str.length;i++) {

            try {
                con = dbCon.getConnection();
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,str[i]);
                int result=pstmt.executeUpdate();
                if(result==1){
                    System.out.println(str[i]+" update sucess!");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }


    }
}
