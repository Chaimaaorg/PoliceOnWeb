package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneNonIdentifiee;

public class addPersonneNonIdentifiee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public addPersonneNonIdentifiee() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	DAOPersonneNonIdentifiee obj = DAOFactory.getInstance().getDAOPersonneNonIdentifiee();
    	String datefaitsString = request.getParameter("date");
    	LocalDateTime datefaits = LocalDateTime.parse(datefaitsString);
        String description = request.getParameter("description");
		String lieu =request.getParameter("lieu");
        String photos = request.getParameter("photos");
        obj.addPersonneNonIdentifiee(datefaits, lieu, description, photos);
		request.getRequestDispatcher("crudPni").forward( request, response );	
		
	}

}
