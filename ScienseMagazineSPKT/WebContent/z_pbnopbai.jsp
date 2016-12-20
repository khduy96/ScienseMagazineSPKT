<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("idbv");
	String cv = request.getParameter("cv");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:1400/tapchikhspkt", "root",
			"12345678");
	Statement st = con.createStatement();
	String sqls = "select * from baiviet  WHERE baiviet_id='" + id
			+ "' and tinhtrang ='btv' ";
	ResultSet rs;
	rs = st.executeQuery(sqls);
	int count = 0;
	while (rs.next()) {
		count++;
	}
	if (new String("BienTapVien").equals(cv)) {
		String sql = "UPDATE baiviet SET tinhtrang ='tbt',trangthai='dabientap' WHERE baiviet_id='"
				+ id + "'";
		st.executeUpdate(sql);
	} else {
		String sql = "UPDATE baiviet SET tinhtrang ='tbt',trangthai='dapb' WHERE baiviet_id='"
				+ id + "'";
		st.executeUpdate(sql);
	}
%>
<html>
<body>
	<label><center>
			<b><h3>Bài viết đã được chuyển tới phản biện viên</h3></b>
		</center></label>
</body>
</html>
<%
	if (count > 0) {
		response.setHeader("Refresh",
				"0.5; URL=../ScienseMagazineSPKT/btv_dsbt.jsp");
	} else
		response.setHeader("Refresh",
				"0.5; URL=../ScienseMagazineSPKT/pbv_dspb.jsp");
%>