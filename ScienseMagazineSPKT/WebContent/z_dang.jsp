<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String[] ids = request.getParameterValues("id");

	String[] addresses = request.getParameterValues("address");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:1400/tapchikhspkt", "root",
			"12345678");
	if (ids != null) {
		for ( int i = 0; i <= ids.length - 1; i++) {
			
			Statement st = con.createStatement();
			String sql = "UPDATE baiviet SET dang = 'T' , vol_id = '"
					+ addresses[i] + "' WHERE baiviet_id='" + ids[i] + "'";
			st.executeUpdate(sql);
		}
%>
<html>
<body>
	<label><center>
			<b><h3>Bài viết đã được đăng</h3></b>
		</center></label>
</body>
</html>
<%
	}
	response.setHeader("Refresh",
			"0.5; URL=../ScienseMagazineSPKT/tbt_db.jsp");
%>