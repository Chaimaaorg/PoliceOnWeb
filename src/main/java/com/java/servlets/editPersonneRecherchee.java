package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.java.beans.PersonneRecherchee;
import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneRecherchee;
import com.java.helpers.dashAdminNum;

public class editPersonneRecherchee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public editPersonneRecherchee() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dashAdminNum.getInstance(request,response);	
		DAOPersonneRecherchee obj = DAOFactory.getInstance().getDAOPersonneRecherchee();
        String CIN_pre = request.getParameter("CIN_pre");		
		PersonneRecherchee personneR = obj.getPersonById(CIN_pre);
		request.setAttribute("personneR", personneR);
		this.getServletContext().getRequestDispatcher("/WEB-INF/dashAdmin/persoRecherchee/editPersoRecherchee.jsp").forward( request, response );
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	DAOPersonneRecherchee obj = DAOFactory.getInstance().getDAOPersonneRecherchee();
        String CIN_pre = request.getParameter("CIN_pre");
        String filiationconnue = request.getParameter("filiationconnue");
        String nationalite = request.getParameter("nationalite");
        String description = request.getParameter("description");
        String derniereplaceretr = request.getParameter("derniereplaceretr");
        String photos = request.getParameter("photos");
        obj.editPersonneRecherchee(CIN_pre, filiationconnue, nationalite, description, derniereplaceretr, photos);
        request.getRequestDispatcher("crudPr").forward( request, response );	
		}

}
