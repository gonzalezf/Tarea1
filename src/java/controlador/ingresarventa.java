/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        registro regis = new registro();
        
        try
        {
            HttpSession session = request.getSession();
            String rut = (String) session.getAttribute("UserRUT");
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
            //Esto es para ver el stock
            ArrayList<int[]> list = new ArrayList<int[]>();
            //Primero verificamos que el stock este completo...
            String client = request.getParameter("client");
            for(int i = 1; i <= total; i++)
            {
                String producto = request.getParameter("id_producto_"+i);
                String cantidad = request.getParameter("cantidad_"+i);
                if(!registro.IsValidNumber(producto))
                {
                    int number = (i-1)*2+2;
                    out.write("ERROR:Debe seleccionar un producto:#form_"+number);
                    return;
                }
                else if(!registro.IsValidNumber(cantidad))
                {
                    int number = (i-1)*2+3;
                    out.write("ERROR:Debe ingresar una cantidad:#form_"+number);
                    return;
                }
                int id = Integer.parseInt(producto);
                int cant = Integer.parseInt(cantidad);
                if(cant < 0)
                {
                    int number = (i-1)*2+3;
                    out.write("ERROR:Debe ingresar una cantidad positiva:#form_"+number);
                    return;
                }
                //Esto para venta
                boolean found = false;
                for(int[] array: list)
                {
                    if(array[0] == id)
                    {
                        array[1] += cant;
                        found = true;
                        break;
                    }
                }
                if(!found)
                {
                    int[] array = {id, cant};
                    list.add(array);
                }
            }
            int monto_total = 0;
            for(int[] array: list)
            {
                if(regis.HasEnoughStock(array[0], array[1]))
                    monto_total += regis.GetProductPrice(array[0])*array[1];
                else
                {
                    out.write("ERROR:No hay suficiente stock para todos los productos:#form_0");
                    return;
                }
            }
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
            Date date = new Date();
            Date time = new Date();
            int id_compra = regis.IngresarVenta(client, rut, monto_total, dateFormat.format(date), timeFormat.format(time));
            if(id_compra == -1)
            {
                out.write("ERROR:No se pudo ingresar la compra ("+id_compra+"):#none");
                return;
            }
            //No hay mas errores, se supone.
            for(int[] array: list)
            {
                regis.IngresarVentaDetalle(id_compra, array[0], array[1]);
            }
            out.write("SUCCESS:Compra ingresada satisfactoriamente:"+id_compra);
        }
        catch(NullPointerException e)
        {
            out.write("ERROR:No existe productos o no se seleccionó uno en todos los campos:#form__000");
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
