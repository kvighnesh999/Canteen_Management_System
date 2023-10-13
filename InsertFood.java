package com.cms.servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.cms.DAO.cmsDao;
import com.cms.connection.connProvider;
import com.cms.entity.foodEntity;

public class InsertFood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fno=Integer.parseInt(request.getParameter("fno"));
		String fname=request.getParameter("fname");
		String ftype=request.getParameter("ftype");
		int fprice=Integer.parseInt(request.getParameter("fprice"));
		
		foodEntity food=new foodEntity(fno,fname,ftype,fprice);
		cmsDao cmsfood=new cmsDao(connProvider.getConnection());
		
		if (cmsfood.insertFoodItems(food)) {
			response.sendRedirect("index.jsp");
        } else {
        	response.sendRedirect("AddNew.jsp");
        }
	}

}
