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
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

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
    throws ServletException, IOException
     {
        response.setContentType("text/plain");  
        response.setCharacterEncoding("UTF-8"); 
        PrintWriter out = response.getWriter();
        registro regis = new registro();
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
            //Esto es para ver el stock
            //ArrayList<int[]> list = new ArrayList<int[]>();
            ArrayList<int[]> queryList = new ArrayList<int[]>();
            //Primero verificamos que el stock este completo...
            int monto_total = 0;
            for(int i = 1; i <= total; i++)
            {
                String producto = request.getParameter("id_producto_"+i);
                String cantidad = request.getParameter("cantidad_"+i);
                String precio = request.getParameter("precio_"+i);
                if(!registro.IsValidNumber(producto))
                {
                    int number = (i-1)*3+1;
                    out.write("ERROR:Debe seleccionar un producto:#form_"+number);
                    return;
                }
                else if(!registro.IsValidNumber(cantidad))
                {
                    int number = (i-1)*3+2;
                    out.write("ERROR:Debe ingresar una cantidad:#form_"+number);
                    return;
                }
                else if(!registro.IsValidNumber(precio))
                {
                    int number = (i-1)*3+3;
                    out.write("ERROR:Debe ingresar un precio:#form_"+number);
                    return;
                }
                int id = Integer.parseInt(producto);
                int cant = Integer.parseInt(cantidad);
                int price = Integer.parseInt(precio);
                monto_total += price;
                if(cant < 0)
                {
                    out.write("ERROR:Debe ingresar una cantidad positiva:#form_"+(i-1)*3+2);
                    return;
                }
                else if(price < 0)
                {
                    out.write("ERROR:Debe ingresar un precio positivo:#form_"+(i-1)*3+3);
                    return;
                }
                //Esto para venta
                /*
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
                */
                int[] array = {id, cant, price};
                queryList.add(array);
            }
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
            Date date = new Date();
            Date time = new Date();
            int id_compra = regis.IngresarCompra(monto_total, dateFormat.format(date), timeFormat.format(time));
            if(id_compra == -1)
            {
                out.write("ERROR:No se pudo ingresar la compra ("+id_compra+"):#none");
                return;
            }
            //No hay mas errores, se supone.
            for(int[] array: queryList)
            {
                regis.IngresarCompraDetalle(id_compra, array[0], array[1], array[2]);
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
      /*
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
<<<<<<< HEAD:src/java/controlador/ingresarcompra.java
        try
        {
            registro regis=new registro();
            String totalString = request.getParameter("total");
            if(!registro.IsValidInt(totalString))
            {
                out.write("ERROR:Ocurrió un error cŕitico en el servidor:#form_0");
                out.close;
                break;
            }
            int total = Integer.parseInt(totalString);
            if()
=======
        try {
             

          registro regis=new registro();
>>>>>>> 0d68e5372caf37fd2d645951ceebae495d6821df:ingresarcompra/ingresarcompra.java

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

<<<<<<< HEAD:src/java/controlador/ingresarcompra.java
            regis.IngresarCompra(id_producto,cantidad,precio);
            response.sendRedirect("compraexitosa.jsp");
=======
              } //fin del for
         //     regis.IngresarCompra(id_producto,cantidad,precio);
              //response.sendRedirect("compraexitosa.jsp");
            } // fin del else.
>>>>>>> 0d68e5372caf37fd2d645951ceebae495d6821df:ingresarcompra/ingresarcompra.java

        } finally { 
            out.close();
        }
        */
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
