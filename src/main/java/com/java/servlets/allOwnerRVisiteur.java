package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.java.beans.ObjetDisparu;
import com.java.dao.DAOFactory;
import com.java.dao.DAOObjetDisparu;

public class allOwnerRVisiteur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public allOwnerRVisiteur() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOObjetDisparu obj = DAOFactory.getInstance().getDAOObjetDisparu();
		List<ObjetDisparu > listobj = obj.getAll();
		request.setAttribute("listobj", listobj);
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/allOwnerR.jsp").forward(request, response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
