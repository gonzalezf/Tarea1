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
import java.sql.*;
/**
 *
 * @author Felipe Gonzalez
 */
public class verventas extends HttpServlet {
   
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


            

        //    String nombrecliente =request.getParameter("esgogercliente").toUpperCase();
          //  out.println(nombrecliente);
         /*  <script>
            var e = document.getElementById("<%=escogercliente%>");
            var strUser = e.options[e.selectedIndex].value;
            </script>*/
            String nombrecliente = request.getParameter("escogercliente");

            String classfor="oracle.jdbc.driver.OracleDriver";
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            String usuario="admin";
            String clave="pelife18";

            Connection con=null;
            PreparedStatement pr=null;
            PreparedStatement pr1 = null;
            Statement consulta = null;
            Statement consulta1 = null;
            ResultSet rs=null;
            ResultSet rs1 = null;
             
            try{
                Class.forName(classfor);

                con=DriverManager.getConnection(url, usuario, clave);
                

           } catch (ClassNotFoundException e) {
                System.out.println(e.toString());
           }
            try{
            
            String sql0 = "select rut from cliente where nombre ='"+nombrecliente+"'";
           // out.println(sql0);
            pr1 = con.prepareStatement(sql0);
            rs1 = pr1.executeQuery();

            while (rs1.next()){
            String id_cliente = rs1.getString(1);

            //out.println("id_cliente es = "+id_cliente+"");

                String sql= "select id_venta,id_usuario,monto_total,fecha,time from venta where id_cliente ='"+id_cliente+"'";
                //out.println(sql);
                pr = con.prepareStatement(sql);


                rs = pr.executeQuery();
  
                            out.println("<table><td>ID VENTA</td><td>ID USUARIO </td> <td>MONTO TOTAL</td> <td>FECHA</td> <td>HORA</td>");
            while(rs.next()){

                    out.println("<TR>");
                    out.println("<TD>"+rs.getString(1)+"</TD>");
                    out.println("<TD>"+rs.getString(2)+"</TD>");
                    out.println("<TD>"+rs.getString(3)+"</TD>");
                    out.println("<TD>"+rs.getString(4)+"</TD>");
                    out.println("<TD>"+rs.getString(5)+"</TD>");

                    out.println("</TR>");



                }
            out.println("</table>");
                }

            //aqui debe ir el if!

            rs1.close();
            rs.close();
            pr.close();
            pr1.close();
            con.close();

            } //fin del try
            catch (SQLException e) {
              }




          //response.sendRedirect("index.jsp"); //redirecciona cuando ya ingreso en la BD


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
