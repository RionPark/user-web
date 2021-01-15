package com.study.jwc.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.study.jwc.conn.DBConn;

public class StudentInfoDAO {
	public List<Map<String,String>> selectStudentInfoList(){
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		Connection con = DBConn.getConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "select * from student_info order by si_num";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Map<String,String> student = new HashMap<String,String>();
				student.put("si_num", rs.getString("si_num"));
				student.put("si_name", rs.getString("si_name"));
				student.put("si_etc", rs.getString("si_etc"));
				list.add(student);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(con, ps, rs);
		}
		return list;
	}
}
