/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.annotation.WebServlet;

import modelo.registro;

/**
 *
 * @author Felipe Gonzalez
 */
//@WebServlet(name = "ingreso", urlPatterns = {"/ingreso"})

public class ingresousuario extends HttpServlet {





    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
           

          registro regis=new registro();

          String rut =request.getParameter("rut").toUpperCase();
          String contrasenna =request.getParameter("contrasenna").toUpperCase();
          String nombre =request.getParameter("nombre").toUpperCase();
          String tipo =request.getParameter("tipo").toUpperCase();
          int comision = Integer.parseInt(request.getParameter("comision"));
          regis.InsertarUsuario(rut, contrasenna, nombre, tipo,1); //ojo aqui , revisar! porque puse 1? .-.
          
          //response.sendRedirect("index.jsp"); //redirecciona cuando ya ingreso en la BD
          out.println("hola");
          
        }catch(Exception e){
            e.getStackTrace();
            out.println(e.getMessage());
        } finally {
            out.close();
        }
    } 

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

}
