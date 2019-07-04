package com.booktique;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.lang.Math;

import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/upload")

public class FileUpload extends HttpServlet 
{
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, NullPointerException 
	{	
		String branch = "";
		String s_year = "";
		String inputname="";
		
		String db = "booktique";
		String url = "jdbc:mysql://localhost:3306/"+db+"?autoReconnect=true&useSSL=false";
		String uname = "root";
		String pass_word = "Emi@4444";
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("userid");
		String insti = (String)session.getAttribute("insti");
		
		String query1 = "select count(*) from dbfiles";
		String query2 = "insert into dbfiles values(?,?,?,?,?,?,?,?,?,?,?)";     
		
		ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
		List<FileItem> multifiles;
		File textfile;
		
		try
		{
		 multifiles = sf.parseRequest(req);
		
		 for(FileItem item : multifiles)
		 {
			 if(item.isFormField())
			 { 
				  inputname = (String) item.getFieldName(); 
				  if(inputname.equals("branch"))
				  {
					  if(((String)item.getString()).equals(""))
						  branch = "none";
					  else
						  branch = (String) item.getString();
				  }
				  else if(inputname.equals("s_year"))
				  {
					  if(((String)item.getString()).equals(""))
						  s_year = "none";
					  else
						  s_year = (String)	item.getString();
				  }
			 }
			 else
			 {
			 textfile = new File("C:\\Users\\Soumya Porel\\eclipse-workspace\\servuletu\\booktique\\"+item.getName());
			 item.write(textfile);
			 FileInputStream input = new FileInputStream(textfile);
			 try
			 {
				long uploadid = 0;
				
				String filename = item.getName();
			    String fileformat = "";
			    int l = filename.length() - 1;
			    for (int i = l; i >= 0; i--)
			    {
			        if (filename.charAt(i) != '.')
			        	fileformat = filename.charAt(i) + fileformat; 
			        else
			            break;    
			    }
			    
				double fsize = item.getSize();
				long fsize2;
				String filesize;
				
				long millis=System.currentTimeMillis();
				Date date = new java.sql.Date(millis);
				
			    if(fsize < 1024) 
			    {
			    	fsize2 = Math.round(fsize);
					filesize = Long.toString(fsize2) + "bytes";
			    } 
			    else if(fsize >= 1024 && fsize < 1048576) 
			    {
			    	fsize2 = Math.round(fsize*100/1024);
					fsize = (double)fsize2/100.0;
					filesize = Double.toString(fsize) + "KB";
			    } 
			    else if(fsize >= 1048576) 
			    {
			    	fsize2 = Math.round(fsize*100/1048576);
					fsize = (double)fsize2/100.0;
					filesize = Double.toString(fsize) + "MB";
			    }
			    else
			    {
			    	filesize = "";
			    }
				
				Class.forName("com.mysql.cj.jdbc.Driver");
			
				Connection con = DriverManager.getConnection(url, uname, pass_word);
				
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(query1);
				if(rs.next())
				{	
					uploadid = rs.getLong("count(*)");
				}
				
				PreparedStatement pst = con.prepareStatement(query2);
				pst.setLong(1, uploadid);
				pst.setBinaryStream(2, input, item.getSize());
				pst.setString(3, userid);
				pst.setString(4, filename);
				pst.setString(5, fileformat);
				pst.setString(6, filesize);
				pst.setString(7, item.getContentType());
				pst.setDate(8, date);
				pst.setString(9, insti);
				pst.setString(10, branch);
				pst.setString(11, s_year);
				
				int count = pst.executeUpdate();
				System.out.println(count);
				System.out.println("file uploaded");
				session.setAttribute("uploaded", 1);
				
				pst.close();
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			input.close();
			textfile.delete();
		    }
		 }
		 res.sendRedirect("upload.jsp");
		 }
		 catch(Exception e)
		 {
			System.out.println(e);
		 }
	}

}
