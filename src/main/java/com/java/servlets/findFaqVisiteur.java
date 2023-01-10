package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.java.beans.Faq;
import com.java.dao.DAOFactory;
import com.java.dao.DAOFaq;

public class findFaqVisiteur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public findFaqVisiteur() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		DAOFaq obj = DAOFactory.getInstance().getDAOFaq();
		String question = request.getParameter("question");
		List<Faq> faqs= obj.findFaq(question);
		request.setAttribute("faqs", faqs);
		request.getRequestDispatcher("/WEB-INF/jsp/faqVisiteur.jsp").forward( request, response );
	}

}
