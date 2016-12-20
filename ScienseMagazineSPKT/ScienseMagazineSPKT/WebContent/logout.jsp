<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("dn.jsp");
%>
