package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.java.beans.PersonneDisparue;
import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneDisparue;


public class findPdVisiteur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public findPdVisiteur() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOPersonneDisparue obj = DAOFactory.getInstance().getDAOPd();
		String CIN_pd =request.getParameter("search");	
		List<PersonneDisparue> listpd= obj.findPersonneDisparu(CIN_pd);
		request.setAttribute("listpd", listpd);
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/allPd.jsp").forward(request, response);	}

}
