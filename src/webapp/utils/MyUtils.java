package webapp.utils;

import java.sql.Connection;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import webapp.beans.Client;
import webapp.beans.Employee;
import webapp.beans.Person;
 
public class MyUtils {
 
   public static final String ATT_NAME_CONNECTION = "ATTRIBUTE_FOR_CONNECTION";
 
   private static final String ATT_NAME_USER_NAME = "ATTRIBUTE_FOR_STORE_USER_NAME_IN_COOKIE";
 
    
   // Store Connection in request attribute.
   // (Information stored only exist during requests)
   public static void storeConnection(ServletRequest request, Connection conn) {
       request.setAttribute(ATT_NAME_CONNECTION, conn);
   }
 
   // Get the Connection object has been stored in one attribute of the request.
   public static Connection getStoredConnection(ServletRequest request) {
       Connection conn = (Connection) request.getAttribute(ATT_NAME_CONNECTION);
       return conn;
   }
 
   // Store user info in Session.
   public static void storeLoginedUser(HttpSession session, Person loginedUser) {
 
       // On the JSP can access ${loginedUser}
       session.setAttribute("loginedUser", loginedUser);
   }
 
 
   // Get the user information stored in the session.
   public static Person getLoginedUser(HttpSession session) {
       Person loginedUser = (Person) session.getAttribute("loginedUser");
       return loginedUser;
   }
 
 
   // Store info in Cookie for client
   public static void storeUserCookie(HttpServletResponse response, Client client) {
       System.out.println("Store user cookie");
       Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, client.getUsername());
 
       // 1 day (Convert to seconds)
       cookieUserName.setMaxAge(24 * 60 * 60);
       response.addCookie(cookieUserName);
   }
   
   // Store info in Cookie for client
   public static void storeUserCookie(HttpServletResponse response, Employee employee) {
       System.out.println("Store user cookie");
       Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, employee.getUsername());
 
       // 1 day (Convert to seconds)
       cookieUserName.setMaxAge(24 * 60 * 60);
       response.addCookie(cookieUserName);
   }
 
   public static String getUserNameInCookie(HttpServletRequest request) {
       Cookie[] cookies = request.getCookies();
       if (cookies != null) {
           for (Cookie cookie : cookies) {
               if (ATT_NAME_USER_NAME.equals(cookie.getName())) {
                   return cookie.getValue();
               }
           }
       }
       return null;
   }
 
 
   // Delete cookie.
   public static void deleteUserCookie(HttpServletResponse response) {
       Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, null);
 
       // 0 seconds (Expires immediately)
       cookieUserName.setMaxAge(0);
       response.addCookie(cookieUserName);
   }
 
}