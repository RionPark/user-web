package com.study.jwc.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.study.jwc.conn.DBConn;
import com.study.jwc.dao.UserInfoDAO;

public class UserInfoDAOImpl implements UserInfoDAO {

	@Override
	public int insertUserInfo(int tiNum, String tiName, int tiAge, String tiDesc) {
		Connection con = null;
		Statement stmt = null;
		int cnt = 0;
		String sql = "insert into test_info(ti_num, ti_name, ti_age, ti_desc, ti_credat)";
		sql+= " values(" + tiNum + ", '" + tiName + "'," + tiAge + ",'" + tiDesc + "',to_char(sysdate,'YYYYMMDD'))";
		con = DBConn.getConn();
		try {
			stmt = con.createStatement();
			cnt = stmt.executeUpdate(sql);
			DBConn.commit(con);
		} catch (SQLException e) {
			DBConn.rollback(con);
			e.printStackTrace();
		}finally {
			DBConn.close(con, stmt);
		}
		return cnt;
	}

	@Override
	public int updateUserInfo() {
		return 0;
	}

	@Override
	public int deleteUserInfo() {
		return 0;
	}

}
