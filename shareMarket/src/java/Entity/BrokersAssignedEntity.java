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
public class BrokersAssignedEntity {
String holderGmail ;
String brokerGmail;
double cid ;
double rupee ;
Date startDate;
     public String getHolderGamil(){
        return this.holderGmail;
    }
    
    public String getbrokerGmail(){
        return this.brokerGmail;
    }
    
    public double getcid(){
        return this.cid;
    }
        
    public double getRupee(){
        return this.rupee;
    }
    
    public Date getStartDate(){
        return this.startDate;
    }
    
    public void setbrokerGmail(String holderName){
        this.brokerGmail=holderName;
    }
     public void setholderGmail(String holderName){
        this.holderGmail=holderName;
    }
    
         public void setstartDate(Date value){
        this.startDate=value;
    }
         
   public void setRupee(double value){
       this.rupee=value;
    }
   
   public void setCid(double value){
       this.cid=value;
    }
      
    
}
