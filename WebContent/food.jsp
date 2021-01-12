<%@page import="java.sql.*"%>
<%@page import="com.study.jwc.conn.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>가격</th>
			<th>타입</th>
			<th>등록일</th>
			<th>등록시간</th>
		</tr>
<%
Connection con = DBConn.getConn();
PreparedStatement ps = null;
ResultSet rs = null;
try{
	String sql = "select * from food_info order by fi_num";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	while(rs.next()){
		String tag = "<tr>";
		tag += "<td>" + rs.getString("fi_num") + "</td>";
		tag += "<td><a href=\"/food-update.jsp?fiNum=" + rs.getString("fi_num") + "\">" + rs.getString("fi_name") + "</a></td>";
		tag += "<td>" + rs.getString("fi_price") + "</td>";
		tag += "<td>" + rs.getString("fi_type") + "</td>";
		tag += "<td>" + rs.getString("fi_credat") + "</td>";
		tag += "<td>" + rs.getString("fi_cretim") + "</td>";
		tag += "</tr>";
		out.println(tag);
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps, rs);
}
%>
	</table>
	
	<!-- 
	        원래 페이지를 이동하기 위해서는 http://도메인명/갈려는 경로
		를 적어줘야 하지만 같은 도메인의 자원끼리는 http://도메인명을
		생략해 준다.
		아래의 경우 
		<a href="http://localhost/food-insert.jsp">
		<a href="/food-insert.jsp">
		위 2개는 결국 같은 의미이다.(서버를 localhost로 실행시켰을 경우)
	 -->
	<a href="/food-insert.jsp"><button>POST메뉴등록</button></a>
	<a href="/food-insert2.jsp"><button>GET메뉴등록</button></a>
</body>
</html>