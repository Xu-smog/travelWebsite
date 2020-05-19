package org.travel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.travel.JDBCUtil.JDBCUtil;
import org.travel.user.DongTai;

public class DongTaiDaoImpl implements DongTaiDao {

	@Override
	public ArrayList<DongTai> selectByPage(int start, int end) {
		
		Connection conn = JDBCUtil.getConnection();
		ArrayList<DongTai> list = new ArrayList<DongTai>();
				
		try {
			PreparedStatement ps = conn.prepareStatement("select * from ( select rownum as rn,d.* from ( " + 
					"select * from DONGTAI t order by t.time desc )d ) where rn >= ? and rn <= ?");

			ps.setInt(1, start);
			ps.setInt(2, end);

			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {	
				ArrayList<String> photo = new ArrayList<String>();
				String user_id = rs.getString(2), user_comment = rs.getString(3);
				String zan = rs.getString(4);
				String dongtai_id = rs.getString(5), time = rs.getString(6);
				
				for(int i=7;i<16;i++) {
					if(rs.getString(i)!=null) {
						photo.add(rs.getString(i));
					}					
				}
				
				DongTai d = new DongTai(user_id,user_comment,zan,dongtai_id,time,photo);
				list.add(d);
			}
			
			return list;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public int selectCount() {
		Connection conn = JDBCUtil.getConnection();

		String sql = "select count(*) from DongTai";
		int count = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt("count(*)");//rs.getInt(colnumIndex)   rs.getInt(colnumName)
			}
			
			JDBCUtil.release(conn);
			
			return count;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return 0;
	}
}
