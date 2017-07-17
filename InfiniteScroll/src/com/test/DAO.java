package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    DBCon dbCon = DBCon.getInstance();
    public List selectAll(){
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sql = "select * from test ORDER b_id desc";
        ArrayList list = new ArrayList();

        try {
            con = dbCon.getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Board board = new Board();
                board.setB_id(rs.getInt("b_id"));
                board.setB_content(rs.getString("b_content"));
                list.add(board);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  list;
    }

    public Board selectOne(int b_id) {
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sql = "select * from test where b_id=?";
        ArrayList list = new ArrayList();
        Board board = new Board();
        try {
            con = dbCon.getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,b_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {

                board.setB_id(rs.getInt("b_id"));
                board.setB_content(rs.getString("b_content"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  board;
    }

}
