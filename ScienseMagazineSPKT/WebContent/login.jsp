<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
String userid = request.getParameter("user");
String pwd = request.getParameter("password");
String cv = request.getParameter("1");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapchikhspkt","root", "12345678");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from members where username='" + userid + "'and password='" + pwd + "' and position='"+ cv +"' and trangthai = 'unblock'");
if (rs.next()) {
session.setAttribute("userid", userid);
session.setAttribute("cv", cv);
//out.println("welcome " + userid);
//out.println("<a href='logout.jsp'>Log out</a>");
response.sendRedirect("success.jsp");
} else {
response.sendRedirect("dn.jsp");
}
%>
