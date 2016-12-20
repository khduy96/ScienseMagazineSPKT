<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String idbv = request.getParameter("idbv");
	String tieude = request.getParameter("head");
	String noidung = request.getParameter("editor1");
	String linhvuc = request.getParameter("Mon");
	String tukhoa1 = request.getParameter("tukhoa1");
	String tukhoa2 = request.getParameter("tukhoa2");
	String tukhoa3 = request.getParameter("tukhoa3");
	String tukhoa4 = request.getParameter("tukhoa4");
	String tukhoa5 = request.getParameter("tukhoa5");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:1400/tapchikhspkt", "root",
			"12345678");
	Statement st = con.createStatement();

	String sql = "UPDATE baiviet SET tieude='" + tieude
			+ "', noidung='" + noidung + "',linhvuc='" + linhvuc
			+ "',tukhoa1='" + tukhoa1 + "',tukhoa2='" + tukhoa2
			+ "',tukhoa3='" + tukhoa3 + "',tukhoa4='" + tukhoa4
			+ "',tukhoa5='" + tukhoa5 + "' WHERE baiviet_id='" + idbv
			+ "'";
	st.executeUpdate(sql);
%>
<html>
<body>
	<form name="myForm" action="btv_bt.jsp" method="get">
<input type="hidden" value="<%=idbv%>" name="idbv"/>
</form>
<script type="text/javascript">
window.onload = function(){
	  document.forms['myForm'].submit()

	}
</script>
</body>
</html>