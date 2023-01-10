package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.java.beans.PersonneDisparue;
import com.java.beans.PersonneRecherchee;
import com.java.beans.Temoignage;
import com.java.beans.User;
import com.java.dao.DAOFactory;
import com.java.dao.DAOPersonneDisparue;
import com.java.dao.DAOPlaintePd;
import com.java.dao.DAOPlaintePr;
import com.java.dao.DAOTemoignage;

public class archive extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public archive() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
		DAOPlaintePr objP = DAOFactory.getInstance().getDAOPlaintePr();
    	DAOPlaintePd objPd = DAOFactory.getInstance().getDAOPlaintePd();
    	DAOPersonneDisparue object = DAOFactory.getInstance().getDAOPd();
    	List<PersonneDisparue> listpd = object.getAll();
        DAOTemoignage objTm = DAOFactory.getInstance().getDAOTemoignage();		    	
    	List<PersonneRecherchee> listperso = objP.getAllSearchPerson(user.getCIN());
    	List<PersonneDisparue> listplainte = objPd.getAllPlaintesPd(user.getCIN());
    	List<Temoignage> listm = objTm.getAllTemoignages(user.getCIN());
    	request.setAttribute("listperso", listperso);
    	request.setAttribute("listm", listm);  
    	request.setAttribute("listpd", listpd);
    	request.setAttribute("listplainte", listplainte);
		request.getRequestDispatcher("/WEB-INF/dashUser/archive.jsp").forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

    }
}
