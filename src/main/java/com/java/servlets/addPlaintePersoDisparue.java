package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;

import com.java.beans.User;
import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneDisparue;
import com.java.dao.DAOPlaintePd;


public class addPlaintePersoDisparue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public addPlaintePersoDisparue() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/dashUser/addPd.jsp").forward( request, response );
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
    	DAOPersonneDisparue obj = DAOFactory.getInstance().getDAOPd();
    	DAOPlaintePd objPlainte = DAOFactory.getInstance().getDAOPlaintePd();
    	String datefaitsString = request.getParameter("datedisparition");
    	LocalDateTime datefaits = LocalDateTime.parse(datefaitsString);
        String lieu = request.getParameter("lieudisparition");
        String description = request.getParameter("description");
		int age =Integer.parseInt(request.getParameter("age"));
        String photos = request.getParameter("photos");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String CIN_pd = request.getParameter("CIN_pd");
        obj.addPersonneDisparue(CIN_pd,age,nom,prenom,datefaits,lieu,description,photos);
        objPlainte.addPlaintePd(user.getCIN(),CIN_pd);	
		request.getRequestDispatcher("indexServlet").forward( request, response );

	}

}
