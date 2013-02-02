/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.epam.servletcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ua.epam.model.*;

/**
 * Controller for add request to DB
 *
 * @author Alexandr Ivanov
 */
@WebServlet(name = "Control", urlPatterns = {"/Control"})
public class Control extends HttpServlet {

    RemoteControl control = new RemoteControl();
    Command cmnd = null;
    
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // command from locale.jsp
        String lang = request.getParameter("lang");
        // command from request.jsp
        String create = request.getParameter("create");
        String back = request.getParameter("back");
        // command from LogOut.jsp
        String exit = request.getParameter("exit");
        String noexit = request.getParameter("noexit");
        // command from EditRequest.jsp
        String denied = request.getParameter("denied");
        String process = request.getParameter("process");
        
        if (lang != null) {
            cmnd = new LanguageChange();
        }
        if(create != null || back != null){
            cmnd = new RequestAdd();
        }
        if(exit != null || noexit != null){
            cmnd = new GoOut();
        }
        if(denied != null || process != null){
            cmnd = new WorkPlanAdd();
        }
        control.setCommand(cmnd);
        control.doCommand(request, response);
        //processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
