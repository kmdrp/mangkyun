package model.dao;

import model.dto.Board;
import model.dto.Member;
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
        String sql = "select * from Board order by board_num desc";
        try {
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Board board = new Board();
                board.setBoard_num(rs.getInt("board_num"));
                board.setWriter_id(rs.getString("writer_id"));
                board.setWriter_nick(rs.getString("writer_nick"));
                board.setContent(rs.getString("content"));
                board.setAnony(rs.getInt("anony"));
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

    public void write(String writer_id,String writer_nickname,String content,int anony){
        Connection con = manager.getConnection();
        PreparedStatement pstmt=null;
        String sql="insert into board(writer_id,writer_nick,content,anony) values(?,?,?,?)";
        int result;
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, writer_id);
            pstmt.setString(2, writer_nickname);
            pstmt.setString(3, content);
            pstmt.setInt(4, anony);

            result = pstmt.executeUpdate();
            if(result==1){
                System.out.println("글 등록 성공");
            }else{
                System.out.println("글 등록 실패");
                //작성 실패 --> 글 작성 다시
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            manager.freeConnection(con,pstmt);
        }
    }

    public Board detailBoard(int board_num){
        Connection con = manager.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        Board board = new Board();
        String sql = "select * from Board where board_num=?";
        try {

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, board_num);
            rs = pstmt.executeQuery();
                if(rs.next()) {
                    board.setBoard_num(rs.getInt("board_num"));
                    board.setWriter_id(rs.getString("writer_id"));
                    board.setWriter_nick(rs.getString("writer_nick"));
                    board.setContent(rs.getString("content"));
                    board.setRegdate(rs.getString("regdate"));
                    board.setLike(rs.getInt("cnt_like"));
                    // int reply = countReply(board.getBoard_num());
                    // board.setReply(reply);
                }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            manager.freeConnection(con,pstmt,rs);
        }
        return board;
    }
    public void delete(int board_num){
        Connection con = manager.getConnection();
        PreparedStatement pstmt=null;

        String sql="DELETE FROM board WHERE board_num = ?";
        int result;
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, board_num);
            result = pstmt.executeUpdate();
            if(result>0){
                System.out.println("글 삭제 실패");
            }else{
                System.out.println("글 삭제 성공");
                //작성 실패 --> 글 작성 다시
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            manager.freeConnection(con,pstmt);
        }
    }

}
