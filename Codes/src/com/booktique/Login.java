package com.booktique;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")

public class Login extends HttpServlet 
{
	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		String db = "booktique";
		String url = "jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false";
		String uname = "root";
		String pass_word = "Emi@4444";
		
		String userid = req.getParameter("userid");
		String pass = req.getParameter("pass");
		
		String query1 = "select pass, fullname, insti from accounts where userid='"+userid+"'";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			Connection con = DriverManager.getConnection(url, uname, pass_word);
			
			Statement st = con.createStatement();
			ResultSet rs1 = st.executeQuery(query1);
			if(rs1.next())
			{	
				String name = rs1.getString("pass");
				String fullname = rs1.getString("fullname");
				String insti = rs1.getString("insti");
				
				if(name.equals(pass))
				{
					HttpSession session = req.getSession();
					session.setAttribute("userid",userid);
					session.setAttribute("fullname",fullname);
					session.setAttribute("insti",insti);
					res.sendRedirect("welcome.jsp");
				}
				else
				{
					res.sendRedirect("login_pass_error.jsp");
				}
			}
			else
			{
				res.sendRedirect("login_userid_error.jsp");
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
