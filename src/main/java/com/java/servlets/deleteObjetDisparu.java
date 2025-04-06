package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.java.dao.DAOFactory;
import com.java.dao.DAOObjetDisparu;


public class deleteObjetDisparu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public deleteObjetDisparu() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOObjetDisparu obj = (DAOObjetDisparu) DAOFactory.getInstance().getDAOObjetDisparu();
		int id_obj = Integer.parseInt(request.getParameter("id_obj"));
		obj.deleteObjetDisparu(id_obj);
		request.getRequestDispatcher("crudObj").forward( request, response );}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
