<%@page import="java.sql.*"%>
<%@page import="com.study.jwc.conn.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
//request.getParameter("fiName")의 fiName 요청하는 페이지(지금은 food-insert.jsp)
//의 form태그안의 input태그의 name과 반드시 같아야 한다.(*중요: 대소문자까지)
String fiName = request.getParameter("fiName");
String fiPrice = request.getParameter("fiPrice");
String fiType = request.getParameter("fiType");

// 사용자(지금은 여러분이죠)가 입력한 값들을 DB에 저장하기 위해서는
// 데이터베이스에 연결해야 한다.
// 그런데 우리는 이미 DBConn class에 다 만들어 놨기 때문에 getConn()메소드를 호출해 연결객체인
// Connection을 con에 대입하면 끝~
Connection con = DBConn.getConn();
//PreparedStatemet를 준비해둠
PreparedStatement ps = null;
try{
	String sql = "insert into food_info(fi_num, fi_name, fi_price, fi_type, fi_credat, fi_cretim)";
	sql += " values(seq_fi_num.nextval, ?,?,?,to_char(sysdate,'YYYYMMDD'),to_char(sysdate,'HH24MISS'))";
	//위에서 만들어둔 sql을 준비한뒤 ps에 대입한다.
	ps = con.prepareStatement(sql);
	// 위의 sql에는 물음표가 3개 있다.
	// 각각의 물음표에 올바른값을 바인딩 시켜야 한다. 반인딩한 갯수가 물음표와 다를경우 에러남!!
	ps.setString(1,fiName);
	ps.setString(2,fiPrice);
	ps.setString(3,fiType);
	// 각각의 물음표와 바인딩이 끝난후 ps로 쿼리를 실행하게 되면 insert, update, delete의 경우
	// 적용된 로우의 갯수가 리턴되는데 insert의 경우는 1외 나올 케이스가 거의 없다.
	// insert가 안되면 0이 나온다고 생각할수 있는데 거의 대부분 오류이기 때문에 38라인 Exception으로 떨어진다.
	int cnt = ps.executeUpdate();
	DBConn.commit(con);
	if(cnt==1){
		response.sendRedirect("/food.jsp");
	}
}catch(Exception e){
	DBConn.rollback(con);
	e.printStackTrace();
}finally{
	// ps와 con의 사용이 (에러가 나건 안나건) 끝났기 때문에 모두 close 해준다.
	DBConn.close(con,ps);
}
%>