package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.java.beans.DeclarationDisparition;
import com.java.beans.DeclarationRecherche;
import com.java.dao.DAODeclarationDisparition;
import com.java.dao.DAODeclarationRecherche;
import com.java.dao.DAOFactory;
import com.java.helpers.dashAdminNum;


public class findDeclarationPd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public findDeclarationPd() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dashAdminNum.getInstance(request, response);		
		DAODeclarationRecherche objPd = DAOFactory.getInstance().getDAODeclarationRecherche();
		DAODeclarationDisparition objPr = DAOFactory.getInstance().getDAODeclarationDisparition();
		String searchDD = request.getParameter("searchDD");
		List<DeclarationDisparition> listdd = objPr.findDeclarationPd(searchDD);
		List<DeclarationRecherche> listdr = objPd.getAll();
		request.setAttribute("listdd", listdd);
		request.setAttribute("listdr", listdr);	
		request.getRequestDispatcher("/WEB-INF/dashAdmin/declarations/index.jsp").forward( request, response );
	}		

}
