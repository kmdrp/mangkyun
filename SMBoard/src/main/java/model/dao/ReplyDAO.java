package model.dao;

import model.dto.Board;
import model.dto.Reply;
import model.manager.PoolManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 이석현 on 2017-07-13.
 */
public class ReplyDAO {
    PoolManager manager = PoolManager.getInstance();

    public ArrayList<Reply> selectAll(int board_num){

        ArrayList<Reply> list = new ArrayList<Reply>();
        Connection con = manager.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        String sql = "select * from reply where board_num =? order by reply_num desc";
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,board_num);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Reply reply = new Reply();
                reply.setWriter_id(rs.getString("writer_id"));
                reply.setWriter_nick(rs.getString("writer_nick"));
                reply.setContent(rs.getString("content"));
                reply.setRegdate(rs.getString("regdate"));
                reply.setLike(rs.getInt("cnt_like"));
                // int reply = countReply(board.getBoard_num());
                // board.setReply(reply);
                list.add(reply);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            manager.freeConnection(con,pstmt,rs);
        }
        return list;
    }
}
