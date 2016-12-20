<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setContentType("text/html; charset=UTF-8");
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String idbv = request.getParameter("idbv");
String user = request.getParameter("user");
String binhluan = request.getParameter("editor1");
String cv = request.getParameter("cv");
if((binhluan!= ""))
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:1400/tapchikhspkt?useUnicode=true&characterEncoding=UTF-8","root", "12345678");
	Statement st = con.createStatement();
	String sql = "INSERT INTO binhluan (baiviet_id, binhluan, username, ngay, cv) VALUES ('"+idbv+"', N'"+binhluan+"', '"+user+"', now(),'"+cv+"');";
	st.executeUpdate(sql);
}
%>
<html><body>
<form name="myForm" action="bl.jsp" method="get">
<input type="hidden" value="<%=idbv%>" name="idbv"/>
</form>
<script type="text/javascript">
window.onload = function(){
	  document.forms['myForm'].submit()

	}
</script>
</body></html>

