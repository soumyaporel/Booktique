package com.booktique;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download")

public class FileDownload extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		long uploadid = Long.parseLong(request.getParameter("uploadid"));
		
		String db = "booktique";
		String url = "jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false";
		String uname = "root";
		String pass_word = "Emi@4444";
		
		String query = "select thefile, filename from dbfiles where uploadid=?";	
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, uname, pass_word);
			
			PreparedStatement pst = con.prepareStatement(query);
			pst.setLong(1, uploadid);
			
			ResultSet rs = pst.executeQuery();
			rs.next();
			String filename = rs.getString("filename");
			InputStream instream = rs.getBinaryStream("thefile");
		
			
			String headerKey = "Content-Disposition";
	        String headerValue = String.format("attachment; filename=\"%s\"", filename);
	        response.setHeader(headerKey, headerValue);
	        
	        OutputStream outstream = response.getOutputStream();
	         
	        byte[] buffer2 = new byte[4096];
	        int bytesRead = -1;
	         
	        while ((bytesRead = instream.read(buffer2)) != -1) {
	            outstream.write(buffer2, 0, bytesRead);
	        }
	         
	        instream.close();
	        outstream.close();      
			pst.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
