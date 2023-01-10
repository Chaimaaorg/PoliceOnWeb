package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.java.dao.DAOFactory;
import com.java.dao.DAOUser;


public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public registerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/jsp/RegisterTest.jsp").forward( request, response );
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOUser obj = DAOFactory.getInstance().getDAOUser();
		String CIN =request.getParameter("CIN");
		String nom =request.getParameter("nom");
		String prenom =request.getParameter("prenom");
		String adresse =request.getParameter("adresse");
		String tel =request.getParameter("tel");
		String nationalite =request.getParameter("nationalite");
		String profession =request.getParameter("profession");
		String myDateStr = request.getParameter("datenaissance");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date utilDate = format.parse(myDateStr);
			java.sql.Date myDate = new java.sql.Date(utilDate.getTime());
			String lieunaissance =request.getParameter("lieunaissance");
			String sexe =request.getParameter("sexe");
			String email =request.getParameter("email");
			String mdp =request.getParameter("mdp");
			obj.addUser(CIN, nom, prenom, adresse, tel, nationalite, profession, myDate, lieunaissance, sexe, email, mdp);
			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward( request, response );
		} catch (ParseException e) {
		}
	}

}
