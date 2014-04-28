/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import modelo.registro;

/**
 *
 * @author Felipe Gonzalez
 */
public class login extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        response.setContentType("text/plain");  
        response.setCharacterEncoding("UTF-8"); 
        PrintWriter out = response.getWriter();
        
        try 
        {
          registro mlogin=new registro();
          String rut =request.getParameter("rut").toUpperCase();
          String contrasenna = request.getParameter("contrasenna").toUpperCase();
          ArrayList<String> result;
          result = mlogin.Login(rut,contrasenna);
          if (!result.get(0).equals("0"))
              out.write("ERROR");
          else
          {
                HttpSession session = request.getSession();
                session.setAttribute("LoggedIn", "yes");
                if(result.get(1).equals("ADMINISTRADOR"))
                  session.setAttribute("UserLevel", "Administrador");
                else if(result.get(1).equals("VENDEDOR"))
                    session.setAttribute("UserLevel", "Vendedor");
                session.setAttribute("UserName", result.get(2));
                session.setAttribute("RUT",rut);
                out.write("SUCCESS");
          }
        }
        catch(Exception e)
        {
            e.getStackTrace();
            e.printStackTrace(out);
            response.setStatus(500);
        }
        finally
        {
            out.close();
        }
    } //fin de request!

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

} //fin clase login
