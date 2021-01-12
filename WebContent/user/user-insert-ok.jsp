<%@page import="com.study.jwc.conn.DBConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");

Connection con = DBConn.getConn();
PreparedStatement ps = null;
try{
	String sql = "insert into user_info(ui_num, ui_id, ui_pwd, ui_credat, ui_cretim)";
	sql += " values(seq_ui_num.nextval, ?, ?, to_char(sysdate,'YYYYMMDD'),to_char(sysdate,'HH24MISS'))";
	ps = con.prepareStatement(sql);
	ps.setString(1, uiId);
	ps.setString(2, uiPwd);
	int cnt = ps.executeUpdate();
	if(cnt==1){
		DBConn.commit(con);
		response.sendRedirect("/user/user.jsp");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBConn.close(con, ps);
}
%>