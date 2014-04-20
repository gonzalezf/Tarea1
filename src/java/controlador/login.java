/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
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
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {


          registro mlogin=new registro();

          String rut =request.getParameter("rut").toUpperCase();
          String contrasenna =request.getParameter("contrasenna").toUpperCase();
          ArrayList<String> result = new ArrayList<String>();

          result = mlogin.Login(rut,contrasenna);
          
          if (result.get(0).equals("1")){
              out.println("usuario no existe!");
          }
          if (result.get(0).equals("2")){
              out.println("contraseña invalida");
          }
          if (result.get(0).equals("3")){
               out.println("algo paso ups!");
            }
          if (result.get(0).equals("0")){
            /*    out.println("usuario logueado");
                out.println("Usted es "+result.get(1)+"");
                out.println("Bienvenido "+result.get(2)+"");*/
                //HttpSession session = request.getSession();
                session.setAttribute("LoggedIn", "yes");
                if(result.get(1).equals("ADMINISTRADOR")){
                  response.sendRedirect("menuadministrador.jsp"); //redirecciona cuando ya ingreso en la BD

                }
                if(result.get(2).equals("VENDEDOR")){
                response.sendRedirect("menuvendedor.jsp");
                }

          }
          else{
               out.println("nose que onda");
          }
     

        }catch(Exception e){
            e.getStackTrace();
            out.println(e.getMessage());
        }
        finally {
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
