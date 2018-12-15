/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author Pradeepsankar
 */
public class CompanyEntity {
    double cId;
    String cName;
    String country;
    int quantity;
    Date startDate;
    double rupee;
   
    public double getCId(){
        return this.cId;
    }
    
    public String getCName(){
        return this.cName;
    }
    
    public String getCountry(){
        return this.country;
    }
    
    public int getquantity(){
        return this.quantity;
    }
    
    public Date getstartDate(){
        return this.startDate;
    }
    
    public void setstartDate(Date startDate){
        this.startDate=startDate;
    }
    
         public void setquantity(int quantity){
        this.quantity=quantity;
    }
          public void setcName(String cName){
        this.cName=cName;
    }
           public void setcId(double value){
        this.cId=value;
    }
          
    
}
