package com.cms.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cms.DAO.cmsDao;
import com.cms.connection.connProvider;
import com.cms.entity.foodEntity;

public class delete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int foodId = Integer.parseInt(request.getParameter("foodId"));

        cmsDao cmsfood = new cmsDao(connProvider.getConnection());

        if (cmsfood.deletefood(foodId)) {
            System.out.print("Food Detail deleted successfully!");
        }else {
        	response.sendRedirect("editfood.jsp");
        }
    }
}
