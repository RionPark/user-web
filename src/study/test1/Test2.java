package study.test1;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.study.jwc.conn.DBConn;

public class Test2 {

	public static void main(String[] args) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "insert into test_info(ti_num, ti_name, ti_age, ti_desc, ti_credat)";
			sql+= " values(6, '하하',33,'유쾌상쾌통쾌',to_char(sysdate,'YYYYMMDD'))";
			con = DBConn.getConn();
			stmt = con.createStatement();
			int cnt = stmt.executeUpdate(sql);
			System.out.println(cnt + "개 반영됨");
			sql = "update test_info";
			sql += " set ti_credat=to_char(sysdate,'YYYYMMDD')";
			sql += " where ti_num<=2";
			cnt = stmt.executeUpdate(sql);
			System.out.println(cnt + "개 반영됨");
			
			sql = "select * from test_info";
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String str = rs.getString("ti_num") + "," 
						+rs.getString("ti_name") + "," 
						+rs.getString("ti_age") + "," 
						+rs.getString("ti_credat") + ",";
				System.out.println(str);
			}
			/*여기에 코드를 완성하시면 됩니다.
			 * ti_num이 2 이하인 데이터의 ti_credat를 오늘일자로 업데이트 하시면됩니다.
			 */
			/*
			 * 업데이트가 끝난뒤에 전체 데이터를 조회하는 코드를 작성하시면 됩니다.
			 */
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConn.close(con, stmt, rs);
		}
	}
}
