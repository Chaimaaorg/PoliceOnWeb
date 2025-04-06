package com.java.servlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.java.beans.User;
import com.java.dao.DAOFactory;
import com.java.dao.DAOUser;
import com.java.helpers.dashAdminNum;

public class crudUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public crudUsers() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dashAdminNum.getInstance(request,response);	
		DAOUser obj = DAOFactory.getInstance().getDAOUser();
		List<User> users = obj.getAllUsers();
		request.setAttribute("users", users);
		this.getServletContext().getRequestDispatcher("/WEB-INF/dashAdmin/crudUsers/index.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
