package controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HARI KUMAR
 */
@WebServlet(urlPatterns = {"/sell.do"})
public class sellController extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Connection connection;
         PrintWriter out = response.getWriter();
        String brokerGmail=request.getParameter("email");
        double cid=Double.valueOf(request.getParameter("cid"));
        double sellamount=Double.valueOf(request.getParameter("sellamount"));
        String holderGmail=request.getParameter("holdergmail");
        
              try
        { 
        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        connection = DriverManager.getConnection("jdbc:derby://localhost:1527/shareMarket", "pradeep", "pradeepsql");
        Statement statement = connection.createStatement();
         ResultSet result1=statement.executeQuery("Select sellamount from sellamount where cid="+cid);
         if(result1.next()){
             if(result1.getDouble(1) == sellamount){
        statement.execute("Delete From BrokersAssigned where cid="+cid+" and holdergmail='"+holderGmail+"'");
       statement.execute("Insert into sell(holdergmail,brokergmail,cid,rupee,dofsell) values('"+holderGmail+"','"+brokerGmail+"',"+cid+","+sellamount+",'"+Date.valueOf(LocalDate.now())+"')");
      ResultSet result=statement.executeQuery("Select quantity from Company where cid="+cid);
      result.next();
     int quantity=Integer.valueOf(result.getString("quantity"));
       statement.execute( "Update  company set quantity=" + (quantity+1) + "where cid="+cid);
        RequestDispatcher dispatchHolder = request.getRequestDispatcher("sucess.jsp");
          dispatchHolder.forward(request, response);
         }else{
                 gotoError(request,response);
             }
         }else{
               gotoError(request,response);
         }
    }   catch (Exception ex) {
            Logger.getLogger(sellController.class.getName()).log(Level.SEVERE, "Sell Error", ex);
              gotoError(request,response);
        }
        }

   void gotoError(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       RequestDispatcher dispatchHolder = request.getRequestDispatcher("error.jsp");
          dispatchHolder.forward(request, response);
   }

}
