package com.java.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.java.beans.Temoignage;
import com.java.dao.DAOFactory;
import com.java.dao.DAOTemoignage;
import com.java.helpers.dashAdminNum;



public class temoignageAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public temoignageAdmin() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dashAdminNum.getInstance(request, response);
		DAOTemoignage objPr = DAOFactory.getInstance().getDAOTemoignage();
    	List<Temoignage> listtm = objPr.getAll();
    	request.setAttribute("listtm", listtm);
		request.getRequestDispatcher("/WEB-INF/dashAdmin/temoignage/index.jsp").forward(request, response);	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
