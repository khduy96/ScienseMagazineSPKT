<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String rating = request.getParameter("rating-input-1");
	String idbv = request.getParameter("idbv");
	String user = request.getParameter("user");
	if(idbv == null){String idbv1 = (String) session.getAttribute("idbv");
	%>
	<html>
	<body><form name="myForm" action="bl.jsp" method="get">
		<input type="hidden" value="<%=idbv1%>" name="idbv" />
	</form>
	<script type="text/javascript">
		window.onload = function() {
			document.forms['myForm'].submit()

		}
	</script>
	</body>
	</html>
	<%}
	if(rating == null){rating="0";}
	if (rating != null) {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:1400/tapchikhspkt", "root",
				"12345678");
		Statement st = con.createStatement();
		String sql = "insert into rating(baiviet_id, username, sosao)value ('"
				+ idbv + "','" + user + "','" + rating + "')";
		st.executeUpdate(sql);
		session.setAttribute("idbv", idbv);
%>
<html>
<meta http-equiv="refresh" content="2" />
<body>
	<label><center>
			<b><h3>
					Bạn đã đánh giá bài viết này
					<%=rating%>
					sao
				</h3></b>
		</center></label>
</body>
</html>
<%
	response.setHeader("Refresh", "2");
%>
<%
	}
%>
