<%@page import="com.study.jwc.student.StudentInfoDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String siName = request.getParameter("siName");
String siEtc = request.getParameter("siEtc");
Map<String,String> student = new HashMap<String,String>();
student.put("siName", siName);
student.put("siEtc", siEtc);
StudentInfoDAO siDAO = new StudentInfoDAO();
int cnt = siDAO.insertStudentInfo(student);
if(cnt==1){
%>
	정상적으로 등록되었습니다.<br>
	<a href="/student/student-list.jsp"><button>게시물이동</button></a>
<%
}else{
%>
	등록중 에러가 발생하였습니다.<br>
	<a href="/student/student-list.jsp"><button>게시물이동</button></a>
<%
}
%>