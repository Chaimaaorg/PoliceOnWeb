package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

import com.java.beans.PersonneDisparue;
import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneDisparue;
import com.java.helpers.dashAdminNum;


public class editPersonneDisparue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public editPersonneDisparue() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dashAdminNum.getInstance(request,response);	
		DAOPersonneDisparue obj = DAOFactory.getInstance().getDAOPd();
        String CIN_pd = request.getParameter("CIN_pd");		
		PersonneDisparue personneD = obj.getPersonById(CIN_pd);
		request.setAttribute("personneD", personneD);
		this.getServletContext().getRequestDispatcher("/WEB-INF/dashAdmin/persoDisparue/editPersoDisparue.jsp").forward( request, response );
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	DAOPersonneDisparue obj = DAOFactory.getInstance().getDAOPd();
    	String datefaitsString = request.getParameter("datedisparition");
    	LocalDateTime datefaits = LocalDateTime.parse(datefaitsString);
        String lieu = request.getParameter("lieudisparition");
        String description = request.getParameter("description");
		int age =Integer.parseInt(request.getParameter("age"));
        String photos = request.getParameter("photos");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String CIN_pd = request.getParameter("CIN_pd");
        obj.editPersonneDisparue(CIN_pd,age,nom,prenom,datefaits,lieu,description,photos);
		request.getRequestDispatcher("crudPd").forward( request, response );	
		}

}
