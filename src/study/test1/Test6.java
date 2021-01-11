package study.test1;

public class Test6 {

	public static void main(String[] args) {
		String uiId = "';delete from user_info";
		String sql = "select * from user_info where ui_id='" + uiId + "'";
		
		System.out.println(sql);
	}
}
