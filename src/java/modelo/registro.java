/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Felipe Gonzalez
 */


public class registro{

    private String rut;
    private String nombre;
    private String contrasenna;
    private String tipo;
    private int comision;


    private final String classfor="oracle.jdbc.driver.OracleDriver";
    private final String url="jdbc:oracle:thin:@localhost:1521:XE";
    private final String usuario="ADMIN";
    private final String clave="pelife18";

    private Connection con=null;
    private PreparedStatement pr=null;
    private Statement consulta = null;
    private ResultSet rs=null;
    
    static public boolean IsValidNumber(String check)
    {
        if(check.equals(""))
            return false;
        try
        {
            Integer.parseInt(check);
            return true;
        }
        catch(NumberFormatException e)
        {
            return false;
        }
    }
    static public boolean IsLoggedIn(HttpSession session)
    {
        String logged_in;
        try
        {
            logged_in = (String)session.getAttribute("LoggedIn");
            if(logged_in == null)
            {
                return false;
            }
            else if(logged_in.equals("no"))
            {
                return false;
            }
            return true;
        }
        catch(Exception e)
        {
            return false;
        }
    }
    
    static public String GetUserLevel(HttpSession session)
    {
        if(!IsLoggedIn(session))
            return "";
        return (String)session.getAttribute("UserLevel");
    }
    
    static public String GetUserRUT(HttpSession session)
    {
        if(!IsLoggedIn(session))
            return "";
        return (String)session.getAttribute("UserRUT");
    }
    //Verifica que el rut sea válido
    public boolean validRut(String rut)
    {
        //Lista de caracteres validos
        String validCharacters = "0123456789kK";
        if(!rut.contains("-"))
            return false;
        
        //Dividirlos por -
        String info[] = rut.split("-", 2);
        int i;
        for(i = 0; i < info[0].length(); i++)
        {
            if(validCharacters.indexOf(info[0].charAt(i)) == -1)
                return false;
        }
        
        //Solo un caracter despues del digito verificador
        if(info[1].length() != 1)
            return false;
        return validCharacters.indexOf(info[1].charAt(0)) != -1;
    }
    
    public void InsertarUsuario(String rut,String contrasenna,String nombre,String tipo,int comision){
    String sql = "Insert into usuario values(?,?,?,?,?)";
    try{
        Class.forName(classfor);

        con=DriverManager.getConnection(url, usuario, clave);

       /* pr=con.prepareStatement(sql);
        pr.setString(1, rut);
        pr.setString(2,contrasenna); HOLAAAAAAAAAA!!!!
        pr.setString(3,nombre);
        pr.setString(4,tipo);
        pr.setInt(5,comision);

        pr.executeUpdate();
        */



        consulta = con.createStatement();
        int r = consulta.executeUpdate("INSERT INTO usuario (rut, contrasenna,nombre,tipo,comision) VALUES ('"+rut+"','"+contrasenna+"','"+nombre+"','"+tipo+"',"+comision+")");

        System.out.println(r);
    }

    catch(Exception e)
    {
      

      System.out.println(e.getMessage());
    } //fin de catch

    } // fin de InsertarUsuario
    // 0 : funciono; 1 = usuario no encontrado, 2 = contraseña incorrecta


    public ArrayList<String> SearchProduct(String id_producto){

    try{
        Class.forName(classfor);
        con=DriverManager.getConnection(url, usuario, clave);
        String sql = "select nombre,descripcion, categoria,stock, precio from producto where id_producto = ?";

        pr = con.prepareStatement(sql);
        pr.setString(1, id_producto);


        rs = pr.executeQuery();
        //aqui debe ir el if!
        ArrayList<String> str=new ArrayList<String>();
        if(rs.next()){

            str.add(rs.getString(1)); //nombre
            str.add(rs.getString(2)); //descripcion
            str.add(rs.getString(3)); //categoria
            str.add(rs.getString(4)); //stock
            str.add(rs.getString(5)); //precio
            return str;
        }
        else{
            str.add("rs.ERROR - Codigo 2");
            return str;
        }
    }//fin del try
    catch(Exception e){
        ArrayList<String> str=new ArrayList<String>();

        System.out.println(e.getMessage());

        str.add("ERROR!");
        return str;

    } //fin de catch

    } //fin de SearchProduct

    public ArrayList<String> Login(String rut, String contrasenna){
    try{
        Class.forName(classfor);

        con=DriverManager.getConnection(url, usuario, clave);
        String sql = "SELECT CONTRASENNA, TIPO, NOMBRE FROM USUARIO WHERE RUT = ?";

        pr = con.prepareStatement(sql);
        pr.setString(1, rut);


        rs = pr.executeQuery();
        //aqui debe ir el if!
        ArrayList<String> str=new ArrayList<String>();
        if (rs.next())
        {
            if(rs.getString(1).equals(contrasenna))
            {

                str.add("0");

                str.add(rs.getString(2)); //tipo
                str.add(rs.getString(3)); //nombre
                return str;
            }
            else
            {
                str.add(rs.getString(1)+"=="+contrasenna);
                str.add("2"); //contrasenna incorrecta
                str.add("incorrecto");
                str.add("incorrecto");
                return str;
            }
        }
        else
        {
            str.add("1");
            str.add("noexiste");
            str.add("noexiste");
            return str; //usuario no registrado
        }
    }
    catch(Exception e)
    {
        ArrayList<String> str=new ArrayList<String>();

        System.out.println(e.getMessage());

        str.add("3");
        return str;
        
    } //fin de catch
    } // fin de login



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

    public String IngresarVendedor(String rut, String contrasenna, String nombre, int comision)
    {
 //   String sql = "Insert into usuario values(?,?,?,?,?)";
        String tipo = "VENDEDOR";
        try
        {
            Class.forName(classfor);

            con=DriverManager.getConnection(url, usuario, clave);
            consulta = con.createStatement();
            int r = consulta.executeUpdate("INSERT INTO usuario (rut, contrasenna,nombre,tipo,comision) VALUES ('"+rut+"','"+contrasenna+"','"+nombre+"','"+tipo+"',"+comision+")");

            System.out.print(r);
        }
        catch(ClassNotFoundException e)
        {
            return "Class not found (Class.forName(classfor))";
        }
        catch(SQLException ex)
        {
            String error = " ";
            for (Throwable e : ex)
            {
                if (e instanceof SQLException)
                {
                    e.printStackTrace(System.err);
                    error = error + " " + e.getMessage();
                }
            }
            return error;
        }
        return "";
    } // fin de IngresarVendedor



    public String IngresarCliente(String rut,String nombre)
    {
        try
        {
            Class.forName(classfor);

            con=DriverManager.getConnection(url, usuario, clave);
            consulta = con.createStatement();
            int r = consulta.executeUpdate("INSERT INTO cliente (rut, nombre) VALUES ('"+rut+"','"+nombre+"')");

            System.out.println(r);
        }
        catch(ClassNotFoundException e)
        {
            return "Class not found (Class.forName(classfor))";
        }
        catch(SQLException ex)
        {
            String error = " ";
            for (Throwable e : ex)
            {
                if (e instanceof SQLException)
                {
                    e.printStackTrace(System.err);
                    error = error + " " + e.getMessage();
                }
            }
            return error;
        }
        return "";
    } // fin de IngresarCliente

    public void AgregarProducto(int id_producto,String nombre,String descripcion,String categoria,int stock,int precio){


    try{
        Class.forName(classfor);

        con=DriverManager.getConnection(url, usuario, clave);
        consulta = con.createStatement();
        int r = consulta.executeUpdate("INSERT INTO producto (id_producto,descripcion,categoria,stock,precio) VALUES (DEFAULT,'"+descripcion+"','"+categoria+"',"+stock+","+precio+")");

        System.out.println(r);
    }

    catch(Exception e)
    {


      System.out.println(e.getMessage());
    } //fin de catch

    } // fin de AgregarProducto


   public void EditarProducto(int id_producto,String nombre,String descripcion,String categoria,int stock,int precio){


    try{
        Class.forName(classfor);

        con=DriverManager.getConnection(url, usuario, clave);
        consulta = con.createStatement();
        int r = consulta.executeUpdate("UPDATE producto SET descripcion = '"+descripcion+"',categoria ='"+categoria+"',precio ='"+precio+"' WHERE id_producto ="+id_producto+"");

        System.out.println(r);
    }

    catch(Exception e)
    {


      System.out.println(e.getMessage());
    } //fin de catch

    } // fin de EditarProducto

    public void AgregarCompra(int id_producto,int cantidad,int precio){

   //terminar
 //  Date date = new Date();
    try{

        Class.forName(classfor);
        con=DriverManager.getConnection(url, usuario, clave);
        consulta = con.createStatement();
   //     int r = consulta.executeUpdate("INSERT INTO producto (id_producto,nombre,descripcion,categoria,stock,precio) VALUES ("+id_producto+",'"+nombre+"','"+descripcion+"','"+categoria+"',"+stock+","+precio+")");
 //       System.out.println(r);
    }

    catch(Exception e)
    {
      System.out.println(e.getMessage());
    } //fin de catch

    } // fin de AgregarCompra

    public int IngresarCompra(int monto_total, String fecha, String hora)
    {
        try
        {
            Class.forName(classfor);
            con = DriverManager.getConnection(url, usuario, clave);
            String query = "BEGIN INSERT INTO COMPRA (MONTO_TOTAL, FECHA, HORA) VALUES (?, ?, ?) returning ID_COMPRA into ?; END;";
            CallableStatement cs = con.prepareCall(query);
            cs.setInt(1, monto_total);
            cs.setString(2, fecha);
            cs.setString(3, hora);
            cs.registerOutParameter(4, java.sql.Types.NUMERIC);
            cs.executeQuery();
            return cs.getInt(4);
        }
        catch (ClassNotFoundException e)
        {
            return -1;
        }
        catch(SQLException e)
        {
            return -2;
        }
    }
    
    public String IngresarCompraDetalle(int id_compra, int id_producto, int total, int precio)
    {
        try
        {
            Class.forName(classfor);
            con = DriverManager.getConnection(url, usuario, clave);
            String query = "INSERT INTO DETALLE_COMPRA (ID_COMPRA, ID_PRODUCTO, CANTIDAD, PRECIO) VALUES(?, ?, ?, ?)";
            CallableStatement cs = con.prepareCall(query);
            cs.setInt(1, id_compra);
            cs.setInt(2, id_producto);
            cs.setInt(3, total);
            cs.setInt(4, precio);
            cs.executeQuery();
            return "";
        }
        catch (ClassNotFoundException e)
        {
            return e.toString();
        }
        catch(SQLException e)
        {
            return e.toString();
        }
    }
    
    
    public void IngresarVenta(String cliente, String id, int cantidad, int precio){
 //   String sql = "Insert into usuario values(?,?,?,?,?)";
    //String tipo = "VENDEDOR";
    try{
        Class.forName(classfor);

        con=DriverManager.getConnection(url, usuario, clave);



        consulta = con.createStatement();
      //  int r = consulta.executeUpdate("INSERT INTO usuario (rut, contrasenna,nombre,tipo,comision) VALUES ('"+rut+"','"+contrasenna+"','"+nombre+"','"+tipo+"',"+comision+")");
        int r = consulta.executeUpdate("INSERT INTO venta (id_venta,id_cliente,id_usuario,monto_total,fecha,horan) VALUES ('"+rut+"','"+contrasenna+"','"+nombre+"','"+tipo+"',"+comision+")");

        System.out.println(r);
    }

    catch(Exception e)
    {


      System.out.println(e.getMessage());
    } //fin de catch
    } // fin de IngresarVendedor


    public int MisVentasLogin(String rut, String contrasenna){
        try{

            Class.forName(classfor);

        con=DriverManager.getConnection(url, usuario, clave);

      
        consulta = con.createStatement();

      //  int r = consulta.executeUpdate("INSERT INTO usuario (rut, contrasenna,nombre,tipo,comision) VALUES ('"+rut+"','"+contrasenna+"','"+nombre+"','"+tipo+"',"+comision+")");
   //     int r = consulta.executeUpdate("INSERT INTO venta (id_venta,id_cliente,id_usuario,monto_total,fecha,horan) VALUES ('"+rut+"','"+contrasenna+"','"+nombre+"','"+tipo+"',"+comision+")");
           String sql="select contrasenna from usuario where rut ='"+rut+"'";
           
  //         String sql= "'select id_venta,id_cliente,monto_total,fecha,hora from venta where id_usuario ="+id_usuario+"'";
            pr = con.prepareStatement(sql);


            rs = pr.executeQuery();
            //aqui debe ir el if!



            while(rs.next()){

                    if(rs.getString(1).equals(contrasenna)){
                        rs.close();
                        return 1;
                    }
                    else{
                        rs.close();
                        return 2; //contrasenna invalida!
                    }

            }
            
            return -1;

    }

    catch(Exception e)
    {


      System.out.println(e.getMessage());

    } //fin de catch


    return 8;

    }

/*
   public void VistaAdministrarProductos(){
   // String sql = "Insert into usuario values(?,?,?,?,?)";
    try{
        Class.forName(classfor);

        con=DriverManager.getConnection(url, usuario, clave);


      
        String sql= "select id_producto, nombre, stock from producto";
        pr = con.prepareStatement(sql);


        ResultSet rs = pr.executeQuery();
        //aqui debe ir el if!
        ArrayList<String> str=new ArrayList<String>();

        while(rs.next()){
                out.println("<TR>");
                out.println("<TD>"+rs.getString(1)+"</TD>");
                out.println("<TD>"+rs.getString(2)+"</TD>");
                out.println("<TD>"+rs.getString(3)+"</TD>");

                out.println("</TR>");



        }
        rs.close();
        pr.close();
        con.close();

        } //fin del try
        catch (SQLException e) {
          }
        } // fin de agregar productos
*/
    } //fin clase registro
