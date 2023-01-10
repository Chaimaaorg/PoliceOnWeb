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
import com.java.dao.DAOUser;
import com.java.helpers.dashAdminNum;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   doGet(request,response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String mdp = request.getParameter("mdp");
    	DAOUser obj = DAOFactory.getInstance().getDAOUser();
    	User user =obj.getUserByEmailAndPassword(email, mdp);
       
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
        	String id_temoignage = (String) session.getAttribute("testId");            	            
            if(user.getRole().equals("1"))
            {
            	User userpd = (User) session.getAttribute("user");
            	String userCIN = userpd.getCIN();
            	DAOPlaintePd objP = DAOFactory.getInstance().getDAOPlaintePd();
            	List<PersonneDisparue> listplainte = objP.getAllPlaintesPd(userCIN);
            	request.setAttribute("listplainte", listplainte);
            	if(id_temoignage !=null)
            	{

                	this.getServletContext().getRequestDispatcher("/WEB-INF/dashUser/addTemoignage.jsp").forward(request, response);
            	}
            	else
            	{
                	this.getServletContext().getRequestDispatcher("/WEB-INF/dashUser/index.jsp").forward(request, response);
            	}

            }
            else if(user.getRole().equals("0"))
            {
        		dashAdminNum.getInstance(request, response);
              	request.getRequestDispatcher("dashAdmin").forward(request, response);
            }
            
         else {
            response.sendRedirect("indexServlet?error=Invalid email or password");}
        }
	}
}
        
        
	
