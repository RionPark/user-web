package study.test1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.study.jwc.conn.DBConn;

public class Test5 {

	public static void main(String[] args) {
		Connection con = DBConn.getConn();
		try {
			//Statement는 먼저 생성한뒤에
			Statement stmt = con.createStatement();
			String sql = "select * from student_info";
			//실행할때 sql을 로드하고 실행한다.
			ResultSet rs = stmt.executeQuery(sql);
			
			//PreparedStatement는 생성할때 sql을 준비해놓고
			PreparedStatement ps = con.prepareStatement(sql);
			//실행할때 로드하지 않고 그냥 실행한다.
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}









