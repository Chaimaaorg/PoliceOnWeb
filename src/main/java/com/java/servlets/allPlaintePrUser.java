package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.java.beans.DeclarationRecherche;
import com.java.beans.User;
import com.java.dao.DAODeclarationRecherche;
import com.java.dao.DAOFactory;

public class allPlaintePrUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public allPlaintePrUser() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
		DAODeclarationRecherche obj = DAOFactory.getInstance().getDAODeclarationRecherche();
		String id_pre = request.getParameter("id_pre");
		List<DeclarationRecherche> listplaintePr = obj.getDeclarationUserById(user.getCIN(),id_pre);
    	request.setAttribute("listplaintePr", listplaintePr);
		request.getRequestDispatcher("/WEB-INF/dashUser/plainteDetails.jsp").forward( request, response );
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
