package model.dao;

import model.dto.Board;
import model.manager.PoolManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    PoolManager manager = PoolManager.getInstance();

    public List selectAll(){

        ArrayList<Board> list = new ArrayList<Board>();
        Connection con = manager.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        String sql = "select * from Board";
        try {
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Board board = new Board();
                board.setBoard_num(rs.getInt("board_num"));
                board.setWriter_id(rs.getString("writer_id"));
                board.setWriter_nick(rs.getString("writer_nick"));
                board.setContent(rs.getString("content"));
                board.setRegdate(rs.getString("regdate"));
                board.setLike(rs.getInt("cnt_like"));
               // int reply = countReply(board.getBoard_num());
               // board.setReply(reply);
                list.add(board);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            manager.freeConnection(con,pstmt,rs);
        }
        return list;
    }

    public int countReply(int board_num) {
        int cnt=0;
        Connection con = manager.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sql = "select count(*) from reply where board_num=?";
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, board_num);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                cnt++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            manager.freeConnection(con,pstmt,rs);
        }
        return cnt;
    }

    public void write(String writer_id,String writer_nickname,String content){
        Connection con = manager.getConnection();
        PreparedStatement pstmt=null;
        String sql="insert into board(writer_id,writer_nickname,content) values(?,?,?)";
        int result;
        try {
            pstmt = con.prepareStatement(sql);
            result = pstmt.executeUpdate();
            if(result==1){
                // 글 등록 성공 --> 다시 게시판 메인으로이동
            }else{
                //작성 실패 --> 글 작성 다시
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

}
