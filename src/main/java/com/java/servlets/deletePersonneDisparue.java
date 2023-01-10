package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneDisparue;


public class deletePersonneDisparue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public deletePersonneDisparue() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOPersonneDisparue obj = DAOFactory.getInstance().getDAOPd();
		String CIN_pd = request.getParameter("CIN_pd");
		obj.deletePersonneDisparue(CIN_pd);
		request.getRequestDispatcher("crudPd").forward( request, response );	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
