<%@page import="com.study.jwc.conn.DBConn"%>
<%@page import="java.sql.*"%>
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
<th>극장이름</th>
<th>극장주소</th>
<th>극장번호1</th>
<th>극장번호2</th>
<th colspan="2"> ♥ </th>
</tr>
<%
Connection con = DBConn.getConn();
PreparedStatement ps = null;
ResultSet rs = null;
try{
	String sql = "select * from theater_info order by ti_num";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	while(rs.next()){
		String tag ="<tr>";
		tag +="<td>"+rs.getString("ti_num")+"</td>";
		tag +="<td><a href =\"/theater/theater-update.jsp?tiNum="+rs.getString("ti_num")+"\">"+rs.getString("ti_name")+"</a></td>";
		tag +="<td>"+rs.getString("ti_address")+"</td>";
		if(rs.getString("ti_phone1")==null){
			tag +="<td>없음</td>";
		}else{
			tag +="<td>"+rs.getString("ti_phone1")+"</td>";
		}
		
		if(rs.getString("ti_phone2")==null){
			tag +="<td>없음</td>";
		}else{
			tag +="<td>"+rs.getString("ti_phone2")+"</td>";
		}
		tag +="<td>"+"<a href =\"/theater/theater-update.jsp?tiNum="+rs.getString("ti_num")+"\">"+"<button>수정</button>";
		tag +="<td>"+"<a href =\"/theater/theater-delete.jsp?tiNum="+rs.getString("ti_num")+"\">"+"<button>삭제</button>";
		tag +="</tr>";
		out.println(tag);
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con,ps,rs);
}
%>
</table>
<a href ="/theater/theater-insert.jsp"><button>추가</button></a>
</body>
</html>