package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.java.beans.User;
import com.java.dao.DAOFactory;
import com.java.dao.DAOTemoignage;


public class addTemoignage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public addTemoignage() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/dashUser/addTemoignage.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
		DAOTemoignage obj = DAOFactory.getInstance().getDAOTemoignage();
        String description = request.getParameter("description");
		String typet =request.getParameter("typet");
        String id_concerne = request.getParameter("id_concerne");
        obj.addTemoignage(user.getCIN(),description,typet,id_concerne);
		request.getRequestDispatcher("RedirectServlet").forward( request, response );
	}
}
