package webapp.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import webapp.beans.Account;
import webapp.beans.Employee;
import webapp.beans.Stock;
import webapp.utils.ManagerUtils;
import webapp.utils.MyUtils;
 
@WebServlet(urlPatterns = { "/stockList"})
public class StockListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public StockListServlet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	// Check User has logged on
        Employee loginedUser = MyUtils.getLoginedEmployee(request.getSession());
  
        // Not logged in
        if (loginedUser == null) {
            // Redirect to login page.
            response.sendRedirect(request.getContextPath() + "/employeeLogin");
            return;
        }
    	
    	Connection conn = MyUtils.getStoredConnection(request);
    	 
        String errorString = null;
        List<Stock> list = null;
        try {
            list = ManagerUtils.getStocks(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
   
        // Store info in request attribute, before forward to views
        request.setAttribute("errorString", errorString);
        request.setAttribute("stocks", list);

        // Forward to /WEB-INF/views/loginView.jsp
        // (Users can not access directly into JSP pages placed in WEB-INF)        
        RequestDispatcher dispatcher = this.getServletContext()
        		.getRequestDispatcher("/WEB-INF/views/StockListView.jsp");
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
 
}