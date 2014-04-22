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
import javax.swing.JOptionPane;
import javax.servlet.http.HttpSession;
import modelo.registro;
/**
 *
 * @author Felipe Gonzalez
 */
public class ingresarvendedor extends HttpServlet {
   
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
          registro regis=new registro();
          String rut =request.getParameter("rut").toUpperCase();
          String contrasenna =request.getParameter("contrasenna").toUpperCase();
          String nombre =request.getParameter("nombre").toUpperCase();
          String repetircontrasenna = request.getParameter("repetircontrasenna").toUpperCase();
          int comision = Integer.parseInt(request.getParameter("comision"));
          HttpSession session = request.getSession();
          session.setAttribute("FormDataAvailable", "yes");
          session.setAttribute("FormRut", rut);
          session.setAttribute("FormPassword", contrasenna);
          session.setAttribute("FormName", nombre);
          session.setAttribute("FormPasswordValidation", repetircontrasenna);
          session.setAttribute("FormComision", request.getParameter("comision"));


         /*validacion de contrasena valida */
         if(contrasenna.compareTo(repetircontrasenna)!=0){
             session.setAttribute("Message", "Las contraseñas no coinciden");
             session.setAttribute("MessageType", "Error");
            response.sendRedirect("ingresarvendedor.jsp");
         }
         else{
          regis.IngresarVendedor(rut,contrasenna,nombre,comision);
          response.sendRedirect("ingresarvendedor.jsp");
          session.setAttribute("FormDataAvailable", "no");
          session.setAttribute("Message", "Vendedor ingresado correctamente");
          session.setAttribute("MessageType", "Assert");
          
          }
        }
        catch(NumberFormatException d)
        {
            HttpSession session = request.getSession();
            session.setAttribute("Message", "No se ingresó un número válido en comisión");
            session.setAttribute("MessageType", "Error");
            response.sendRedirect("ingresarvendedor.jsp");
        }
        catch(IOException e)
        {
            HttpSession session = request.getSession();
            session.setAttribute("Message", "Por favor, rellene todos los campos");
            session.setAttribute("MessageType", "Error");
            response.sendRedirect("ingresarvendedor.jsp");   
        }
        finally { 
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
