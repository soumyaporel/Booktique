package com.booktique;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/youruploads")

public class YourUploads extends HttpServlet 
{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{		
		
		HttpSession session = req.getSession();
		
        String userid = (String)session.getAttribute("userid");
       
        if(userid == "")
            userid = null;
        
        String db = "booktique";
		String url = "jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false";
		String uname = "root";
		String pass_word = "Emi@4444";
		
		String query = "select uploadid, thefile, userid, filename, filesize, uploaddate, insti, branch, s_year from dbfiles where userid = ifnull(?,userid)";
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, uname, pass_word);
			
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, userid);
			
			List<Long> dbuploadid = new ArrayList<Long>(); 
			List<String> dbuserid = new ArrayList<String>(); 
			List<String> dbfilename = new ArrayList<String>();
			List<String> dbfilesize = new ArrayList<String>();
			List<Date> dbuploaddate = new ArrayList<Date>();
			List<String> dbinsti = new ArrayList<String>();
			List<String> dbbranch = new ArrayList<String>();
			List<String> dbs_year = new ArrayList<String>();
			
			int number_of_results = 0;

			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				dbuploadid.add(rs.getLong("uploadid"));
				dbuserid.add(rs.getString("userid"));
				dbfilename.add(rs.getString("filename"));
				dbfilesize.add(rs.getString("filesize"));
				dbuploaddate.add(rs.getDate("uploaddate"));
				dbinsti.add(rs.getString("insti"));
				dbbranch.add(rs.getString("branch"));
				dbs_year.add(rs.getString("s_year"));
				
				number_of_results++;
			}	
			pst.close();
			con.close();
			
			for(int i = 0; i < number_of_results; i++)
				System.out.println(dbuploadid.get(i)+" "+dbuserid.get(i)+" "+dbfilename.get(i)+" "+dbfilesize.get(i)+" "+dbuploaddate.get(i)+" "+dbbranch.get(i)+" "+dbs_year.get(i)+" "+dbinsti.get(i));
			System.out.println();
			
			req.setAttribute("dbuploadid", dbuploadid);
			req.setAttribute("dbuserid", dbuserid);
			req.setAttribute("dbfilename", dbfilename);
			req.setAttribute("dbfilesize", dbfilesize);
			req.setAttribute("dbuploaddate", dbuploaddate);
			req.setAttribute("dbinsti", dbinsti);
			req.setAttribute("dbbranch", dbbranch);
			req.setAttribute("dbs_year", dbs_year);
			
			RequestDispatcher rd = req.getRequestDispatcher("youruploads.jsp");
			rd.forward(req, res);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}	
	}
}
