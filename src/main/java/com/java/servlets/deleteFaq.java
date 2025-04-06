package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.java.dao.DAOFactory;
import com.java.dao.DAOFaq;


public class deleteFaq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public deleteFaq() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOFaq obj = DAOFactory.getInstance().getDAOFaq();
		int id_faq = Integer.parseInt(request.getParameter("id_faq"));
		obj.deleteFaq(id_faq);
		request.getRequestDispatcher("faq").forward( request, response );

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
