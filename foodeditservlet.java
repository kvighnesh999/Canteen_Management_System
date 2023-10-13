package com.cms.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import com.cms.connection.connProvider;


public class foodeditservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fno=Integer.parseInt(request.getParameter("fno"));
		String fname=request.getParameter("fname");
		String ftype=request.getParameter("ftype");
		int fprice=Integer.parseInt(request.getParameter("fprice"));
		
		
		try {
			Connection c=connProvider.getConnection();
			PreparedStatement ps=c.prepareStatement("update food set food_name=? , food_type=? , food_price=? where food_no=?");
			ps.setString(1, fname);
			ps.setString(2, ftype);
			ps.setInt(3, fprice);
			ps.setInt(4, fno);
			ps.executeUpdate();
		
			response.sendRedirect("editfood.jsp");
		} catch (SQLException e) {
			response.sendRedirect("index.jsp");
			e.printStackTrace();
		}
		
	}

}
