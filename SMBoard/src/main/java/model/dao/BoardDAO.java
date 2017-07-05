package model.dao;

import model.manager.PoolManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    PoolManager manager = PoolManager.getInstance();

    public List selectAll(){

        Connection con = manager.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        ArrayList list = new ArrayList();
        String sql="select * from board";
        return list;
    }

}
