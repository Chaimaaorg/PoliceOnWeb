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


public class crudPr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public crudPr() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dashAdminNum.getInstance(request,response);	
		DAOPersonneRecherchee obj = DAOFactory.getInstance().getDAOPersonneRecherchee();
		List<PersonneRecherchee > listpr = obj.getAll();
		request.setAttribute("listpr", listpr);
		this.getServletContext().getRequestDispatcher("/WEB-INF/dashAdmin/persoRecherchee/index.jsp").forward(request, response);	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
