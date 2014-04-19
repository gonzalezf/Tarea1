/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

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
public class registro2 extends HttpServlet {

    private String rut;
    private String nombre;
    private String contrasenna;
    private String tipo;
    private int comision;


    private String classfor="oracle.jdbc.driver.OracleDriver";
    private String url="jdbc:oracle:thin:@localhost:1521:XE";
    private String usuario="admin";
    private String clave="pelife18";

    private Connection con=null;
    private PreparedStatement pr=null;
    private ResultSet rs=null;

    public void InsertarUsuario(String rut,String contrasenna,String nombre,String tipo,int comision){

    String sql = "Insert into USUARIO values(?,?,?,?,?)";

    try{
        Class.forName(classfor);
        con=DriverManager.getConnection(url, usuario, clave);

        pr=con.prepareStatement(sql);
        pr.setString(1, rut);
        pr.setString(2,contrasenna);
        pr.setString(3,nombre);
        pr.setString(4,tipo);
        pr.setInt(5,comision);

        pr.executeUpdate();

    }

    catch(Exception ev){
        sql="update USUARIO set rut=?,contrasenna=?,nombre=?,tipo=? where comision=?";
        try
        {
        Class.forName(classfor);
        con=DriverManager.getConnection(url, usuario, clave);


        pr=con.prepareStatement(sql);
        pr.setString(1,rut);
        pr.setString(2,contrasenna);
        pr.setString(3, nombre);
        pr.setString(4,tipo);
        pr.setInt(5, comision);

        pr.executeUpdate();
        }
        catch(Exception e)
        {}


      } //fin de catch

    } // fin de InsertarUsuario

    public int getComision() {
        return comision;
    }

    public void setComision(int comision) {
        this.comision = comision;
    }

    public String getContrasenna() {
        return contrasenna;
    }

    public void setContrasenna(String contrasenna) {
        this.contrasenna = contrasenna;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }










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
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registro at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
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

} //fin clase registro
