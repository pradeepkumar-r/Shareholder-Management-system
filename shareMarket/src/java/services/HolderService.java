/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import Entity.BrokersAssignedEntity;
import Entity.ShareHolderEntity;
import dao.BrokersAssignedDao;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pradeepsankar
 */
public class HolderService {
    
   public void insertShareDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        BrokersAssignedEntity entity = new BrokersAssignedEntity();
        entity.setbrokerGmail(request.getParameter("brokeremail"));
        entity.setholderGmail(request.getParameter("holdergmail"));
        entity.setRupee(Double.valueOf(request.getParameter("rupee")));
        entity.setCid(Double.valueOf(request.getParameter("cid")));
        entity.setstartDate(Date.valueOf(LocalDate.now()));
        
        
        BrokersAssignedDao brokersAssignedDao = new BrokersAssignedDao();
        brokersAssignedDao.insert(entity,request,response);
    }
    
}
