package com.java.servlets;
import java.time.LocalDateTime;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.java.beans.User;
import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneRecherchee;
import com.java.dao.DAOPlaintePr;

public class addPlainte extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addPlainte() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/dashUser/addPlainte.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
    	DAOPlaintePr obj = DAOFactory.getInstance().getDAOPlaintePr();
    	DAOPersonneRecherchee perso = DAOFactory.getInstance().getDAOPersonneRecherchee();
    	String datefaitsString = request.getParameter("dateDesFaits");
    	LocalDateTime datefaits = LocalDateTime.parse(datefaitsString);
        String lieuDesFaits = request.getParameter("lieuDesFaits");
        String id_pre = request.getParameter("CIN_pre");        
        String description = request.getParameter("description");
        String témoins = request.getParameter("témoins");
        String filiationconnue = request.getParameter("filiationconnue");
        String nationalite = request.getParameter("nationalite");
        String photos = request.getParameter("photos");
        perso.addPersonneRecherchee(id_pre,filiationconnue,nationalite,description,lieuDesFaits,photos);
        obj.addPlaintePr(user.getCIN(),id_pre,lieuDesFaits,datefaits, description, témoins);
        this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
}}