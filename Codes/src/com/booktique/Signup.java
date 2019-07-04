package com.booktique;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/signup")

public class Signup extends HttpServlet 
{
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		String db = "booktique";
		String url = "jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false";
		String uname = "root";
		String pass_word = "Emi@4444";
		
		String fullname = req.getParameter("name");
		String userid = req.getParameter("userid");
		String insti = req.getParameter("insti");
		String pass = req.getParameter("pass");
		
		String query1 = "select pass from accounts where userid='"+userid+"'";
		String query2 = "insert into accounts values('"+fullname+"','"+userid+"','"+insti+"','"+pass+"')";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			Connection con = DriverManager.getConnection(url, uname, pass_word);
			
			Statement st = con.createStatement();
			ResultSet rs1 = st.executeQuery(query1);
			if(rs1.next())
			{	
				res.sendRedirect("signup_error.jsp");
			}
			else
			{
				HttpSession session = req.getSession();
				st.executeUpdate(query2);
				session.setAttribute("userid", userid);
				session.setAttribute("fullname",fullname);
				session.setAttribute("insti",insti);
				res.sendRedirect("welcome.jsp");
			}
			
			st.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}	
	}
}
