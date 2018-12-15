/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;



/**
 *
 * @author Pradeepsankar
 */
public class ShareHolderEntity {
    
    String holderGmail;
    
    String holderName;
    
    String password;
    
    String city;
    
    String country;
    
    Date DateOfBirth;
    
    int age;
    
    public String getHolderGamil(){
        return this.holderGmail;
    }
    
    public String getHolderName(){
        return this.holderName;
    }
    
    public String getPassword(){
        return this.password;
    }
    
    public String getCity(){
        return this.city;
    }
    
    public String getCountry(){
        return this.country;
    }
    
    public Date getDateOfBirth(){
        return this.DateOfBirth;
    }
    
    public int getAge(){
        return this.age;
    }
    
    public void setHolderName(String holderName){
        this.holderName=holderName;
    }
    
         public void setHolderGmail(String value){
        this.holderGmail=value;
    }
          public void setPassword(String value){
        this.password=value;
    }
           public void setCity(String value){
        this.city=value;
    }
            public void setCountry(String value){
        this.country=value;
    }
             public void setAge(int value){
        this.age=value;
    }
              public void setDateOfBirth(Date value){
        this.DateOfBirth=value;
    }
}
