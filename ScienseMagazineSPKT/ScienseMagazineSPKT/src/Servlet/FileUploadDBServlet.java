package Servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 



import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;

import javax.swing.*;

import com.mysql.fabric.Response;

import java.awt.Font;
 
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 524288000)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
     
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// database connection settings
    private String dbURL = "jdbc:mysql://localhost:1400/tapchikhspkt?useUnicode=true&characterEncoding=UTF-8";
    private String dbUser = "root";
    private String dbPass = "12345678";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
    	String flag = request.getParameter("flag");
    	InputStream inputStream = null; 
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
    	if(flag!=null){
    		String idbv = request.getParameter("idbv");
            Connection conn = null; 
            String message = null;
            try {
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                String sql = "UPDATE baiviet SET photo = ? WHERE baiviet_id= ?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(2, idbv);
                if (inputStream != null) {
                    statement.setBlob(1, inputStream);
                }
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                }
            } catch (SQLException ex) {
            	  message = "ERROR: " + ex.getMessage();
                  ex.printStackTrace();
            } finally {
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                request.setAttribute("Message", message);
                getServletContext().getRequestDispatcher("/z_updatefile.jsp").forward(request, response);
            }
    	}else {
         	// gets values of text fields
            String iduser = request.getParameter("id");
            String tieude = request.getParameter("head");
            String noidung =request.getParameter("editor1");
            String tg1 = request.getParameter("11");
            String tg2 = request.getParameter("12");
            String tg3 = request.getParameter("13");
            String tg4 = request.getParameter("14");
            String tg5 = request.getParameter("15");
            String cq1 = request.getParameter("21");
            String cq2 = request.getParameter("22");
            String cq3 = request.getParameter("23");
            String cq4 = request.getParameter("24");
            String cq5 = request.getParameter("25");
            String linhvuc = request.getParameter("Mon");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String tukhoa1 = request.getParameter("tukhoa1");
            String tukhoa2 = request.getParameter("tukhoa2");
            String tukhoa3 = request.getParameter("tukhoa3");
            String tukhoa4 = request.getParameter("tukhoa4");
            String tukhoa5 = request.getParameter("tukhoa5");
            String dang = "F";
            String tinhtrang = "tbt";
            String trangthai = "chuaduyet";
             
            Connection conn = null; // connection to the database
            String message = null;  // message will be sent back to client
             
            try {
                // connects to the database
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
     
                // constructs SQL statement
               
                String sql = "INSERT INTO baiviet (usernameid, tieude, noidung, photo, tacgia_id, tacgia_id1, tacgia_id2, tacgia_id3, tacgia_id4, coquan, coquan1, coquan2, coquan3, coquan4,linhvuc,email,sdt,tukhoa1,tukhoa2,tukhoa3,tukhoa4,tukhoa5, dang, tinhtrang, trangthai) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, iduser);
                statement.setString(2, tieude);
                statement.setString(3, noidung);
                statement.setString(5, tg1);
                statement.setString(6, tg2);
                statement.setString(7, tg3);
                statement.setString(8, tg4);
                statement.setString(9, tg5);
                statement.setString(10, cq1);
                statement.setString(11, cq2);
                statement.setString(12, cq3);
                statement.setString(13, cq4);
                statement.setString(14, cq5);
                statement.setString(15, linhvuc);
                statement.setString(16, email);
                statement.setString(17, phone);
                statement.setString(18, tukhoa1);
                statement.setString(19, tukhoa2);
                statement.setString(20, tukhoa3);
                statement.setString(21, tukhoa4);
                statement.setString(22, tukhoa5);
                statement.setString(23, dang);
                statement.setString(24, tinhtrang);
                statement.setString(25, trangthai);
                if (inputStream != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(4, inputStream);
                }
     
                // sends the statement to the database server
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                }
            } catch (SQLException ex) {
                message = "ERROR: " + ex.getMessage();
                ex.printStackTrace();
            } finally {
                if (conn != null) {
                    // closes the database connection
                    try {
                        conn.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                // sets the message in request scope
                request.setAttribute("Message", message);
                // forwards to the message page
                getServletContext().getRequestDispatcher("/Message_upload.jsp").forward(request, response);
            }
		}
    }
}