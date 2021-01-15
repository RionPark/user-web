<%@page import="com.study.jwc.student.StudentInfoDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
StudentInfoDAO siDAO = new StudentInfoDAO();
List<Map<String,String>> studentList = siDAO.selectStudentInfoList();
%>
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
		<th>비고</th>
	</tr>
<%
for(int i=0;i<studentList.size();i++){
	Map<String,String> student = studentList.get(i);
%>
	<tr>
		<td><%=student.get("si_num") %></td>
		<td><%=student.get("si_name")%></td>
		<td><%=student.get("si_etc")%></td>
	</tr>
<%
}
%>
</table>

</body>
</html>