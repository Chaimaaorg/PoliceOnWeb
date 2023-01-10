package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneNonIdentifiee;


public class deletePersonneNonIdentifiee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public deletePersonneNonIdentifiee() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOPersonneNonIdentifiee obj = DAOFactory.getInstance().getDAOPersonneNonIdentifiee();
		int id_pni = Integer.parseInt(request.getParameter("id_pni"));
		obj.deletePersonneNonIdentifiee(id_pni);;
		request.getRequestDispatcher("crudPni").forward( request, response );}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
