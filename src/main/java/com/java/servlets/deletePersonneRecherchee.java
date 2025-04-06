package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneRecherchee;


public class deletePersonneRecherchee extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public deletePersonneRecherchee() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOPersonneRecherchee obj = DAOFactory.getInstance().getDAOPersonneRecherchee();
		String CIN_pre = request.getParameter("CIN_pre");
		obj.deletePersonneRecherchee(CIN_pre);
		request.getRequestDispatcher("crudPr").forward( request, response );
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
