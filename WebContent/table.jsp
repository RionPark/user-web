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
			<th>이름</th>
			<th>주소</th>
			<th>직업</th>
		</tr>
<%
// 드라이버 로드, url, username, password를 통해서 Connection 만들어야 하는데
// 이미 DBconn에 getConn()메소드에서 위의 작업들이 다 되기 때문에
// 다시 코딩할 필요 없이 아래처럼 호출해서 사용할 Connection만 받아오면 된다.
Connection con = DBConn.getConn();
PreparedStatement ps = null;
ResultSet rs = null;
try{
	String sql = "select * from student_info order by si_num";
	//위의 sql을 PreparedStatement에 준비시키기 위해 con을 사용해서 
	// 아래처럼 호출하여 ps를 받아온다.
	ps = con.prepareStatement(sql);
	// Statement처럼 sql을 그때 그때 실행하는게 아니라
	// 미리 준비해놨기 때문에 PreparedStatement는 실행하면 하면된다.
	rs = ps.executeQuery();
	// rs를 마지막 로우 즉 데이터가 존재하지 않을때까지 반복해야 하기 때문에
	// while문에 rs.next()를 호출하여 반복문을 돌린다.
	while(rs.next()){
		String tag = "<tr>";
		tag += "<td>" + rs.getString("si_num") + "</td>";
		tag += "<td>" + rs.getString("si_name") + "</td>";
		tag += "<td>" + rs.getString("si_etc") + "</td>";
		tag += "</tr>";
		//위에서 만들어진 string을 출력해준다.
		out.println(tag);
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	// 위의 코드가 제대로 실행이 되든 오류가 나든
	// 위에서 생성된 con, ps, rs를 종료해야 하기 때문에
	// DBConn에 만들어둔 close()메소드를 호출한다.
	// 단 con, ps, rs의 종료순서는 생성순서의 반대이다.
	DBConn.close(con, ps, rs);
}
%>	
	</table>
</body>
</html>