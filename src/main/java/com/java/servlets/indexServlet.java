package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import com.java.beans.PersonneDisparue;
import com.java.beans.PersonneRecherchee;
import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneDisparue;
import com.java.dao.DAOPersonneRecherchee;

public class indexServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
       

    public indexServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Récupération de la liste des enregistrements depuis la DAO
            DAOPersonneDisparue object = DAOFactory.getInstance().getDAOPd();
            List<PersonneDisparue> listpd = object.getAllIndex();  
            request.setAttribute("listpd", listpd);
            DAOPersonneRecherchee objectr = DAOFactory.getInstance().getDAOPersonneRecherchee();
            List<PersonneRecherchee> listpr = objectr.getAllIndex();  
            request.setAttribute("listpr", listpr);
            
            // Forward vers la JSP pour afficher les enregistrements
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        } catch (Exception e) {
            // Traitement de l'exception
            e.printStackTrace();
        }
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
	
	    }
}