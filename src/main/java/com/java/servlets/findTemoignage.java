package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.java.beans.Temoignage;
import com.java.dao.DAOFactory;
import com.java.dao.DAOTemoignage;
import com.java.helpers.dashAdminNum;


public class findTemoignage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public findTemoignage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dashAdminNum.getInstance(request, response);
		DAOTemoignage obj = DAOFactory.getInstance().getDAOTemoignage();
		String CIN_pre =request.getParameter("search");	
		List<Temoignage> listtm = obj.findTemoignage(CIN_pre);
		request.setAttribute("listtm", listtm);
		this.getServletContext().getRequestDispatcher("/WEB-INF/dashAdmin/temoignage/index.jsp").forward(request, response);	
		
	}

}
