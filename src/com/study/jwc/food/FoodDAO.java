package com.study.jwc.food;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.study.jwc.conn.DBConn;

public class FoodDAO {

	public List<Map<String,String>> selectFoodList() {
		List<Map<String,String>> foodList = new ArrayList<Map<String,String>>();
		Connection con = DBConn.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "select * from food_info order by fi_num";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Map<String,String> menu = new HashMap<String,String>();
				menu.put("fi_num", rs.getString("fi_num"));
				menu.put("fi_name", rs.getString("fi_name"));
				menu.put("fi_price", rs.getString("fi_price"));
				menu.put("fi_type", rs.getString("fi_type"));
				menu.put("fi_credat", rs.getString("fi_credat"));
				menu.put("fi_cretim", rs.getString("fi_cretim"));
				foodList.add(menu);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(con,ps,rs);
		}
		return foodList;
	}
}
