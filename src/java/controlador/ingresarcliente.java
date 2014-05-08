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

import modelo.registro;
/**
 *
 * @author Felipe Gonzalez
 */
public class ingresarcliente extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        response.setContentType("text/plain");  
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            registro regis=new registro();
            String rut =request.getParameter("rut").toUpperCase();
            String nombre =request.getParameter("nombre").toUpperCase();
            if(!regis.validRut(rut))
            {
                out.write("ERROR:El RUT no es válido:#form_1");
            }
            else if(nombre.equals(""))
            {
                out.write("ERROR:Debe ingresar un nombre:#form_2");
            }
            else
            {
                String error = regis.IngresarCliente(rut, nombre);
                if(error.equals(""))
                {
                    out.write("SUCCESS:Cliente ingresado exitosamente");
                }
                else
                {
                    out.write("ERROR:Ya existe un cliente con aquel RUT"+error+":#form_3");
                }
            }
        }
        finally
        {
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
