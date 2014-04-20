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
    private Statement consulta = null;
    private ResultSet rs=null;

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

