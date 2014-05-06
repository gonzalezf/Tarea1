/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Felipe Gonzalez
 */
import modelo.registro;
public class ingresarventa extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/plain");  
        response.setCharacterEncoding("UTF-8"); 
        PrintWriter out = response.getWriter();
        try
        {
            String total_s = request.getParameter("total");
            int total;
            try
            {
                total = Integer.parseInt(total_s);
            }
            catch(NumberFormatException e)
            {
                out.write("ERROR:Ocurrio un error con los datos:#none");
                return;
            }
            //Primero verificamos que el stock este completo...
            for(int i = 1; i <= total; i++)
            {
                String producto = request.getParameter("id_producto_"+i);
                String cantidad = request.getParameter("cantidad_"+i);
                String precio = request.getParameter("precio_"+i);
                if(!registro.IsValidNumber(producto))
                {
                    out.write("ERROR:Debe seleccionar un producto:#form_"+i*1);
                    return;
                }
                else if(!registro.IsValidNumber(cantidad))
                {
                    out.write("ERROR:Debe ingresar una cantidad:#form_"+i*2);
                }
                else if(!registro.IsValidNumber(precio))
                {
                    out.write("ERROR:Debe ingresar un precio:#form_"+i*3);
                }
            }

          //regis.IngresarVenta(cliente,producto,cantidad);
          response.sendRedirect("ventaexitosa.jsp");




          }finally {
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
