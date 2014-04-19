/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;


import java.sql.*;
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


    private String classfor="oracle.jdbc.driver.OracleDriver";
    private String url="jdbc:oracle:thin:@localhost:1521:XE";
    private String usuario="admin";
    private String clave="pelife18";

    private Connection con=null;
    private PreparedStatement pr=null;
    private ResultSet rs=null;

    public void InsertarUsuario(String rut,String contrasenna,String nombre,String tipo,int comision){
    String sql = "INSERT INTO USUARIO VALUES(?,?,?,?,?,?)";
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
        System.out.println("ingresado!");
    }

    catch(Exception ev)
    {
      System.out.println(ev.getMessage());
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

    } //fin clase registro

