/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Entity.BrokersAssignedEntity;
import Entity.ShareHolderEntity;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Pradeepsankar
 */
public class BrokersAssignedDao {
    
     public void insert( BrokersAssignedEntity entity,HttpServletRequest request, HttpServletResponse respons) throws ServletException, IOException {
        Statement statement = getDriverConnection();
        if (Objects.nonNull(statement)) {
            try {
                ResultSet result=statement.executeQuery("Select rupee,quantity from Company where cid="+entity.getcid());
                if(result.next()){
                double amountFromDb=Double.valueOf(result.getString("rupee"));
                int quantity=Integer.valueOf(result.getString("quantity"));
                if(amountFromDb==entity.getRupee() && quantity!=0 ){
                statement.execute("INSERT INTO BROKERSASSIGNED(holdergmail,brokerGmail,cid,rupee,DOFSELL) VALUES('"
                        + entity.getHolderGamil() + "','" + entity.getbrokerGmail() + "'," + entity.getcid() + "," 
                        + entity.getRupee() + ",'" + entity.getStartDate() + "')");
                statement.execute("Update  company set quantity=" + (quantity-1) + "where cid="+entity.getcid());
                ResultSet resultset= statement.executeQuery("Select salary from stockbroker where brokergmail='"+ entity.getbrokerGmail()+"'");
               resultset.next();
                double salary=resultset.getDouble("salary");
                 statement.execute("Update  stockbroker set salary=" + (salary+(entity.getRupee()*0.25)) + "where brokergmail='"+ entity.getbrokerGmail()+"'");
                }else{
                    gotoErrorPage(request,respons);
                }
                }else{
                    gotoErrorPage(request,respons);
                }
            } catch (SQLException ex) {
                Logger.getLogger(StockBrokerDao.class.getName()).log(Level.SEVERE, "Data Store Failed", ex);
                 gotoErrorPage(request,respons);
            }
        }

    }
     
    private Statement getDriverConnection() {
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
             Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/shareMarket", "pradeep", "pradeepsql");
            return connection.createStatement();
        } catch (Exception e) {
             Logger.getLogger(StockBrokerDao.class.getName()).log(Level.SEVERE, "DB Operation Failed", e);
             System.out.println("ERROR in DB");
            return null;
        }

    }
    
    private void gotoErrorPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher dispatchHolder = request.getRequestDispatcher("error.jsp");
          dispatchHolder.forward(request, response);
                         
    }
    
}
