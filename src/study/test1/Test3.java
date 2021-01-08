package study.test1;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.study.jwc.conn.DBConn;

public class Test3 {

	public static void main(String[] args) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "insert into test_info(ti_num, ti_name, ti_age, ti_desc, ti_credat)";
			sql+= " values(4, '히히',43,'그만.. 충분해....',to_char(sysdate,'YYYYMMDD'))";
			con = DBConn.getConn();
			stmt = con.createStatement();
			int cnt = stmt.executeUpdate(sql);
			System.out.println(cnt + "개 반영됨");
			sql = "update test_info";
			sql += " set ti_credat=to_char(sysdate,'YYYYMMDD')";
			sql += " where ti_num<=3";
			cnt = stmt.executeUpdate(sql);
			System.out.println(cnt + "개 반영됨");
			
			sql = "select * from test_info";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String str = rs.getString("ti_num") + "," 
						+rs.getString("ti_name") + "," 
						+rs.getString("ti_age") + "," 
						+rs.getString("ti_credat") + ","
						+rs.getString("ti_desc") + ",";
				System.out.println(str);
			}
			DBConn.commit(con);
		}catch(Exception e) {
			DBConn.rollback(con);
			e.printStackTrace();
		}finally {
			DBConn.close(con, stmt, rs);
		}
	}
}
