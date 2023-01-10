package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;




public class temoignage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public temoignage() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
		String testId = request.getParameter("id");
        session.setAttribute("testId", testId);		
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward( request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	doGet(request, response);
	}
}
