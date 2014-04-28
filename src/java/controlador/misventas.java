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
import modelo.registro;
public class misventas extends HttpServlet {
   
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

          String rut =request.getParameter("rut").toUpperCase();
          String contrasenna =request.getParameter("contrasenna").toUpperCase();


         int comprobacion = regis.MisVentasLogin(rut, contrasenna); //ojo aqui , revisar! porque puse 1? .-.
      //   out.println("'"+comprobacion+"'");
         session.getAttribute("UserLevel").toString();

          //response.sendRedirect("index.jsp"); //redirecciona cuando ya ingreso en la BD
          if (comprobacion==1){ //asi se compara?

            String classfor="oracle.jdbc.driver.OracleDriver";
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            String usuario="admin";
            String clave="pelife18";

            Connection con=null;
            PreparedStatement pr=null;
            Statement consulta = null;
            ResultSet rs=null;

            try{
                Class.forName(classfor);

                con=DriverManager.getConnection(url, usuario, clave);

           } catch (ClassNotFoundException e) {
                     System.out.println(e.toString());
           }
                 try{
                   
            String sql= "select id_venta,id_cliente,monto_total,fecha,time from venta where id_usuario ='"+rut+"'";
        //   out.println(sql);
            pr = con.prepareStatement(sql);


            rs = pr.executeQuery();
            //aqui debe ir el if!

            out.println("<table><td>ID VENTA</td><td>ID CLIENTE </td> <td>MONTO TOTAL</td> <td>FECHA</td> <td>HORA</td>");
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
            rs.close();
            pr.close();
            con.close();

            } //fin del try
            catch (SQLException e) {
              }




          }
           else{
           out.println("Usuario o contrasenna invalida");
           }

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
