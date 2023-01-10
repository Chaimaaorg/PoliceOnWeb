package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.java.beans.PersonneDisparue;
import com.java.beans.User;
import com.java.dao.DAOFactory;
import com.java.dao.DAOPlaintePd;


public class RedirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RedirectServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) 
        {
        	User user = (User) session.getAttribute("user");
        	if(user.getRole().equals("1"))
        	{
            	DAOPlaintePd objP = DAOFactory.getInstance().getDAOPlaintePd();
            	List<PersonneDisparue> listplainte = objP.getAllPlaintesPd(user.getCIN());
            	request.setAttribute("listplainte", listplainte);
        		this.getServletContext().getRequestDispatcher("/WEB-INF/dashUser/index.jsp").forward( request, response );

        	}
        	else if(user.getRole().equals("0"))
        	{
        		this.getServletContext().getRequestDispatcher("/WEB-INF/dashAdmin/index.jsp").forward( request, response );

        	}

        } else {
            response.sendRedirect("/WEB-CONTENT/WEB-INF/index.jsp");
        }	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
