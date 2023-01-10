package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.java.beans.PersonneRecherchee;
import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneRecherchee;
import com.java.helpers.dashAdminNum;


public class findPr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public findPr() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dashAdminNum.getInstance(request,response);	
		DAOPersonneRecherchee obj = DAOFactory.getInstance().getDAOPersonneRecherchee();
		String CIN_pre =request.getParameter("search");	
		List<PersonneRecherchee> listpr = obj.findPersonneRecherchee(CIN_pre);
		request.setAttribute("listpr", listpr);
		this.getServletContext().getRequestDispatcher("/WEB-INF/dashAdmin/persoRecherchee/index.jsp").forward(request, response);	}

}
