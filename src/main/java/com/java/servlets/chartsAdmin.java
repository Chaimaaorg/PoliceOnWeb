package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
//import com.java.dao.DAOCharts;
//import com.java.dao.DAOFactory;
import com.java.helpers.dashAdminNum;


public class chartsAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public chartsAdmin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		dashAdminNum.getInstance(request, response);
		dashAdminNum.getCharts(request, response);
		dashAdminNum.getCrimesCharts(request, response);
		dashAdminNum.getCrimesChartsTypes(request,response);
		this.getServletContext().getRequestDispatcher("/WEB-INF/dashAdmin/charts/index.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
