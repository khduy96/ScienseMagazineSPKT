<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.ParseException"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
    String user = request.getParameter("user");    
    String pwd = request.getParameter("password");
    String gtinh = request.getParameter("gt");
    String email = request.getParameter("email");
    String sdt = request.getParameter("phone");
    String cmnd = request.getParameter("CMND");
    String cq = request.getParameter("tcq");
    String dc = request.getParameter("dc");
    String maildp = request.getParameter("email1");
    String namsinh = request.getParameter("birthday");
    SimpleDateFormat s2d = new SimpleDateFormat("yyyy-mm-dd");
    Date s2dDate = s2d.parse(namsinh);
    java.util.Date utilDate = new java.util.Date();
    utilDate = s2dDate;
    java.sql.Date birthday = new java.sql.Date(utilDate.getTime());
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapchikhspkt",
            "root", "12345678");
    Statement st = con.createStatement();
    String sqlQuery="select distinct username from members where username='"+user+"'";
    ResultSet rs;
    rs=st.executeQuery(sqlQuery);
    int count=0;
    while(rs.next())
    {
    count++;
    }
    if(count>0)
    {
    	response.sendRedirect("notification.jsp");
    }
    else
    {
    //ResultSet rs;
    int i = st.executeUpdate("insert into members(email,emailduphong,username,password,sdt,CMND,birthday,gioitinh,coquan,diachi,trangthai,yeucau,position) values ('" + email + "','" + maildp + "','" + user + "','" + pwd + "','"+sdt+"','"+cmnd+"','"+birthday+"','"+gtinh+"','"+cq+"','"+dc+"','unblock','F','DocGia')");	
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='dn.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("dn.jsp");
    }
    }

%>