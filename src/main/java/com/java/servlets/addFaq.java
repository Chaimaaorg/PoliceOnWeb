package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.java.dao.DAOFactory;
import com.java.dao.DAOFaq;


public class addFaq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public addFaq() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOFaq obj = DAOFactory.getInstance().getDAOFaq();
		String question =request.getParameter("question");
		String reponse =request.getParameter("reponse");
		obj.addFaq(question,reponse);
		request.getRequestDispatcher("faq").forward( request, response );
//		response.sendRedirect("/WEB-INF/dashAdmin/faq/index.jsp");

	}

}
