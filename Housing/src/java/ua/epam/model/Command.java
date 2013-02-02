/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ua.epam.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * 
 * @author Alexandr Ivanov
 */
public interface Command {

    public void execute(HttpServletRequest request, HttpServletResponse response);
}
