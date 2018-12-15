package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.HolderService;

/**
 *
 * @author Pradeepsankar
 */
@WebServlet(urlPatterns = {"/holderIndexController.do"})
public class HolderIndexController extends HttpServlet {  
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      HolderService holderService =new HolderService();
      String hiddenInput = request.getParameter("hiddeninput");
      switch (hiddenInput) {
            case "buyShare":
                holderService.insertShareDetails(request, response);
                RequestDispatcher dispatchHolder = request.getRequestDispatcher("sucess.jsp");
                dispatchHolder.forward(request, response);
                break;
      
    }
    }
    
}


