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
public class agregarproducto extends HttpServlet {
   
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
            registro regis=new registro();
            String nombre = request.getParameter("nombre").toUpperCase();
            String descripcion = request.getParameter("descripcion").toUpperCase();
            String categoria = request.getParameter("categoria").toUpperCase();
            int precio = 0;
            int stock = 0;
            
            if(nombre.equals(""))
            {
                out.write("ERROR:Debe ingresar un nombre:#form_1");
                return;
            }
            else if(nombre.equals(""))
            {
                out.write("ERROR:Debe ingresar una categoría:#form_3");
                return;
            }
            try{
                precio = Integer.parseInt(request.getParameter("precio"));
            }
            catch(NumberFormatException e)
            {
                out.write("ERROR:El precio es inválido:#form_5");
                return;
            }
            try{
                stock = Integer.parseInt(request.getParameter("stock"));
            }
            catch(NumberFormatException e){
                out.write("ERROR:El stock inicial es inválido:#form_4");
                return;
            }
            
            if(precio < 0)
            {
                out.write("ERROR:El precio debe ser un número positivo:#form_5");
                return;
            }
            else if(stock < 0)
            {
                out.write("ERROR:El stock inicial debe ser un número positivo:#form_4");
            }
          regis.AgregarProducto(nombre, descripcion, categoria, stock, precio);
          //out.println(nombre);
          out.write("SUCCESS:Producto añadido con éxito");

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
