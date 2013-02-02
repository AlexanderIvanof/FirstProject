/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ua.epam.view;

import java.util.List;
import ua.epam.entity.*;
import ua.epam.entitydao.*;

/**
 *
 * @author Ivanov Alexander
 */
public class WelcomePageBean {
    
    private String username;

    public User getUser(){
        DAOFactory daof = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
        UserDAO udao = daof.getUserDAO();
        User user = udao.getUser(username);
        return user;
    }
    
    public List<WorkType> getAllWorkType(){
        DAOFactory daof = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
        WorkTypeDAO wtdao = daof.getWorkTypeDAO();
        List<WorkType> wtpe = wtdao.getAllWorkType(); 
        return wtpe;
    }
    
    public List<RequestEntity> getAllRequestEntitys(){
        DAOFactory daof = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
        RequestEntityDAO redao = daof.getRequestEntityDAO();
        int id = getUser().getIdUser();
        return redao.getRequestsByUser(id);
    }
    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }
    

}
