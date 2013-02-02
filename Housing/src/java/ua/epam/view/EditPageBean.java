/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.epam.view;

import java.util.ArrayList;
import java.util.List;
import ua.epam.entity.*;
import ua.epam.entitydao.*;

/**
 *
 * @author Ivanov Alexander
 */
public class EditPageBean {

    private String worktype;
    private int idRequest;
    private static DAOFactory daof = DAOFactory.getDAOFactory(DAOFactory.MYSQL);

    RequestEntity getCurrentRequest() {
        RequestEntity currentRequest = null;
        RequestEntityDAO requests = daof.getRequestEntityDAO();
        List<RequestEntity> list = requests.getAllRequests();
        for (RequestEntity req : list) {
            if (req.getIdRequest() == idRequest) {
                currentRequest = req;
                break;
            }
        }
        return currentRequest;
    }

    public String getRequestWorkType() {
        RequestEntity take = getCurrentRequest();
        return take.getTypeWork().getName();
    }

    public List<Worker> getWorkers() {
        List<Worker> unBusy = new ArrayList<Worker>();
        
        WorkerDAO wdao = daof.getWorkerDAO();
        Profession cprof = getCurrentRequest().getTypeWork().getWhoDo();
        List<Worker> workers = wdao.getWorkerByProfession(cprof);
        WorkerRequestDAO wrdao = daof.getWorkerRequestDAO();
        RequestEntityDAO redao = daof.getRequestEntityDAO();
        Boolean isBusy = false;
        for (int j = 0; j < workers.size(); j++) {
            if (workers.get(j).isBusy()) {
                List<Integer> idreqs = wrdao.getListRequest(workers.get(j).getIdworker());
                for (int ii = 0; ii < idreqs.size(); ii++) {
                    RequestEntity re = redao.getRequest(idreqs.get(ii));
                    if (getCurrentRequest().getOrderFullfillment().equals(re.getOrderFullfillment())) {
                        isBusy = true;
                        break;
                    }
                }
            }
            if (!isBusy) {
                unBusy.add(workers.get(j));
            }
            isBusy = false;
        }

        return unBusy;
    }

    public List<Worker> getForeman() {
        List<Worker> unBusy = new ArrayList<Worker>();
        
        WorkerDAO wdao = daof.getWorkerDAO();
        WorkerRequestDAO wrdao = daof.getWorkerRequestDAO();
        ProfessionDAO profession = daof.getProfessionDAO();
        RequestEntityDAO redao = daof.getRequestEntityDAO();
        Profession frmn = profession.getProfession(1);
        List<Worker> formans = wdao.getWorkerByProfession(frmn);
        boolean isBusyForeman = false;
        for (int j = 0; j < formans.size(); j++) {
            if (formans.get(j).isBusy()) {
                List<Integer> idreqs = wrdao.getListRequest(formans.get(j).getIdworker());
                for (int ii = 0; ii < idreqs.size(); ii++) {
                    RequestEntity re = redao.getRequest(idreqs.get(ii));
                    if (getCurrentRequest().getOrderFullfillment().equals(re.getOrderFullfillment())) {
                        isBusyForeman = true;
                        break;
                    }
                }
            }
            if (!isBusyForeman) {
                unBusy.add(formans.get(j));
            }
            isBusyForeman = false;
        }
        
        return unBusy;
    }

    /**
     * @return the worktype
     */
    public String getWorktype() {
        return worktype;
    }

    /**
     * @param worktype the worktype to set
     */
    public void setWorktype(String worktype) {
        this.worktype = worktype;
    }

    /**
     * @return the idRequest
     */
    public int getIdRequest() {
        return idRequest;
    }

    /**
     * @param idRequest the idRequest to set
     */
    public void setIdRequest(int idRequest) {
        this.idRequest = idRequest;
    }
}
