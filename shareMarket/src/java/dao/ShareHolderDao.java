/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Entity.ShareHolderEntity;
import static dao.StockBrokerDao.EMPTY;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
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
public class ShareHolderDao {
 
 public static final String EMPTY="";
    /**
     *
     * @param Object
     */
    public void insert( ShareHolderEntity entity,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Statement statement = getDriverConnection();
        if (Objects.nonNull(statement)) {
            try {
                statement.execute("INSERT INTO SHAREHOLDER(holderGmail,holderName,password,city,country,dateOfBirth) VALUES('" 
                        + entity.getHolderGamil() + "','" + entity.getHolderName() + "','" + entity.getPassword() + "','" 
                        + entity.getCity() + "','" + entity.getCountry() + "','" + entity.getDateOfBirth()+ "')");
            } catch (SQLException ex) {
                Logger.getLogger(StockBrokerDao.class.getName()).log(Level.SEVERE, "Data Store Failed", ex);
                 gotoError(request,response);
            }
        }

    }
    
     public String getData(String username){
        Statement statement=getDriverConnection();
        try{
            ResultSet resultset=statement.executeQuery("SELECT * FROM SHAREHOLDER WHERE HOLDERGMAIL='"+username+"'");
            if(resultset.next()){
                return String.valueOf(resultset.getString("password"));
            }
            return EMPTY;
        }catch(SQLException exception){
             Logger.getLogger(StockBrokerDao.class.getName()).log(Level.SEVERE, "Error occurs in getData from STOCKBROKER", exception); 
        }
        return EMPTY;
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
    
     void gotoError(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       RequestDispatcher dispatch = request.getRequestDispatcher("error_1.jsp");
          dispatch.forward(request, response);
   }
    
}
