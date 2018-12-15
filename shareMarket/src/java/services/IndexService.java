/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import Entity.ShareHolderEntity;
import dao.ShareHolderDao;
import dao.StockBrokerDao;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pradeepsankar
 */
public class IndexService {

    public void storeData(HttpServletRequest request, HttpServletResponse response)  {
        ShareHolderEntity entity = new ShareHolderEntity();
        entity.setCity(request.getParameter("city"));
        entity.setCountry(request.getParameter("country"));
        entity.setDateOfBirth(Date.valueOf(request.getParameter("dob")));
        entity.setHolderName( request.getParameter("name"));
        entity.setHolderGmail( request.getParameter("username"));
        entity.setPassword(request.getParameter("password"));
        switch (request.getParameter("role")) {
            case "broker":
                StockBrokerDao stockBrokerDao = new StockBrokerDao();
                stockBrokerDao.insert(entity,request,response);
                break;
            case "holder":
                ShareHolderDao shareHolderDao=new ShareHolderDao();
                shareHolderDao.insert(entity,request,response);
                break;
            default:
                //no action needed
        }    
    }
    
    public boolean validateData(HttpServletRequest request, HttpServletResponse response){
        switch(request.getParameter("role")){
            case "broker":
                StockBrokerDao stockBrokerDao = new StockBrokerDao();
                String passwordFromStockDb=stockBrokerDao.getData(request.getParameter("username"));
                return request.getParameter("password").equals(passwordFromStockDb);
            case "holder":
                ShareHolderDao shareHolderDao =new ShareHolderDao();
                String passwordFromHolderDb = shareHolderDao.getData(request.getParameter("username"));
                return request.getParameter("password").equals(passwordFromHolderDb);
            default:
                return false;
        }
    }
}
