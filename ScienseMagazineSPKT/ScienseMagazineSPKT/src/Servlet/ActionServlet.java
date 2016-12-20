package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

/**
 * Servlet implementation class ActionServlet
 */
@WebServlet("/ActionServlet")
public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=null;
		String id=null;
		String chucvu=null;
		
		id = request.getParameter("id");
		chucvu = request.getParameter("cv");
		//Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
        Statement stmt = null;
        try {
            // Step 1: Allocate a database Connection object
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:1400/tapchikhspkt", "root", "12345678"); // <== Check!
            // database-URL(hostname, port, default database), username, password

            // Step 2: Allocate a Statement object within the Connection
            stmt = conn.createStatement();
            String sqlStr;
            // Step 3: Execute a SQL SELECT query
            if(request.getParameter("cv").toString().equals("block") || request.getParameter("cv").toString().equals("unblock")){
            	 sqlStr = "UPDATE members SET trangthai ='" + chucvu + "' WHERE id='"+id+"'";
            	  name= "Thay đổi thành công ! ";
        		}
            else{
            	 sqlStr = "UPDATE members SET position ='" + chucvu + "' WHERE id='"+id+"'";
            	 name = "Thay đổi thành công ! ";
            }
            stmt.executeUpdate(sqlStr);  // Send the query to the server

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8"); 
		response.getWriter().write(name); 
	}

}
