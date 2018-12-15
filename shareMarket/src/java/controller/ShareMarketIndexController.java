/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.IndexService;

/**
 *
 * @author Pradeepsankar
 */
@WebServlet(name = "ShareMarketIndexController", urlPatterns = {"/ShareMarketIndexController.do"})
public class ShareMarketIndexController extends HttpServlet {

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
        IndexService indexService = new IndexService();
        String hiddenInput = request.getParameter("hidden");
        switch (hiddenInput) {
            case "storeData":
                indexService.storeData(request, response);
                RequestDispatcher dispatch = request.getRequestDispatcher("sucess_1.jsp");
                dispatch.forward(request, response);
                break;
            case "validateData":
                boolean status = indexService.validateData(request, response);
                if(status)
                {
                      HttpSession session = request.getSession();
                      session.setAttribute("username", request.getParameter("username"));
                switch(request.getParameter("role")){
                     case "broker":
                          RequestDispatcher dispatchBroker = request.getRequestDispatcher("brokerIndex.jsp");
                          dispatchBroker.forward(request, response);
                          break;
                      case "holder":
                          RequestDispatcher dispatchHolder = request.getRequestDispatcher("holderIndex.jsp");
                          dispatchHolder.forward(request, response);
                          break;
                }
                }else{
                    gotoError(request,response);
                }
                break;
        }
    }
     void gotoError(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       RequestDispatcher dispatch = request.getRequestDispatcher("error_1.jsp");
          dispatch.forward(request, response);
   }
}
