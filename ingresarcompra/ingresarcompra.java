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

/**
 *
 * @author Felipe Gonzalez
 */

import modelo.registro;

public class ingresarcompra extends HttpServlet {
   
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
             

          registro regis=new registro();

          String contador = request.getParameter("contador");
          if (contador.equals("")){
            out.println("ERROR: No ingreso datos");
            response.sendRedirect("compraexitosa.jsp");

          }
          else{
              int contador2 = Integer.parseInt(request.getParameter("contador"));
              //out.println(contador2);


              int i = 0;
              for (i=1;i<=contador2;i++){
            
              out.println("contador es"+contador2+"");
             // out.println("id_producto"+i+"");
           
          //    out.println(request.getParameter("'id_producto"+i+"'"));
              out.println(request.getParameter("id_compra"+i+""));
         //     out.println(request.getParameter("cantidad'"+i+"'"));
              out.println(request.getParameter("cantidad"+i+""));
       //       out.println(request.getParameter("'precio"+i+"'"));
              out.println(request.getParameter("precio"+i+""));

              int id_compra = Integer.parseInt(request.getParameter("id_compra"+i+""));
              
              int cantidad = Integer.parseInt(request.getParameter("cantidad"+i+""));
              int precio = Integer.parseInt(request.getParameter("precio"+i+""));
              out.print("buenaa!");

              } //fin del for
         //     regis.IngresarCompra(id_producto,cantidad,precio);
              //response.sendRedirect("compraexitosa.jsp");
            } // fin del else.

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
