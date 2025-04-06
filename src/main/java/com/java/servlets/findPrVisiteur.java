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


public class findPrVisiteur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public findPrVisiteur() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOPersonneRecherchee obj = DAOFactory.getInstance().getDAOPersonneRecherchee();
		String CIN_pre =request.getParameter("search");	
		List<PersonneRecherchee > listpr= obj.findPersonneRecherchee(CIN_pre);
		request.setAttribute("listpr", listpr);
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/allPr.jsp").forward(request, response);	}

}
