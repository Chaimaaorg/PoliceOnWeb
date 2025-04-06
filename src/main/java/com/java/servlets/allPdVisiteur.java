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

public class allPdVisiteur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public allPdVisiteur() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOPersonneDisparue obj = DAOFactory.getInstance().getDAOPd();
		List<PersonneDisparue> listpd = obj.getAll();
		request.setAttribute("listpd", listpd);
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/allPd.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
