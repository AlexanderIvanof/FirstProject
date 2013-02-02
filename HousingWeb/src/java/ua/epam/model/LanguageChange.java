/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ua.epam.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ua.epam.entity.UserType;
import ua.epam.servlet.filter.UMConstants;

/**
 *
 * @author Ivanov Alexander
 */
public class LanguageChange implements Command{

    
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String lang = request.getParameter("lang");
        if (lang.equalsIgnoreCase("GB")) {
            request.getSession().setAttribute("language", "en-EN");
            try {
                HttpSession sess = request.getSession(true);
                UserType user = (UserType) sess.getAttribute(UMConstants.USER_TYPE);
                if (user == UserType.ADMINISTRATOR) {
                    request.getRequestDispatcher("Dispatcher.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("WelcomePage.jsp").forward(request, response);
                }
            } catch (ServletException ex) {
                System.out.println(ex.getMessage());
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
            }
        }
        if (lang.equalsIgnoreCase("RU")) {
            request.getSession().setAttribute("language", "ru-RU");
            try {
                HttpSession sess = request.getSession(true);
                UserType user = (UserType) sess.getAttribute(UMConstants.USER_TYPE);
                if (user == UserType.ADMINISTRATOR) {
                    request.getRequestDispatcher("Dispatcher.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("WelcomePage.jsp").forward(request, response);
                }
            } catch (ServletException ex) {
                System.out.println(ex.getMessage());
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
            }
        }
    }

}
