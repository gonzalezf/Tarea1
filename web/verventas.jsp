<%-- 
    Document   : verventas.jsp
    Created on : Apr 22, 2014, 7:34:04 PM
    Author     : felipe
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //Esto verifica que el usuario haya iniciado sesión
    //y que además tenga los permisos necesarios.
    String logged_in = null;
    try{
        logged_in = (String)session.getAttribute("LoggedIn");
    }
    catch(Exception e)
    {
        response.setStatus( 403 );
        return;
    }
    if(logged_in == null)
    {
        response.setStatus( 403 );
        return;
    }
    if(logged_in.equals("no"))
    {
        response.setStatus( 403 );
        return;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Ventas a Cliente</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="pagecontent">
              <h2>Selecione Cliente</h2>
                <form action="verventas" method="post" >
                  <%

            String classfor="oracle.jdbc.driver.OracleDriver";
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            String usuario="admin";
            String clave="pelife18";

            Connection con=null;
            PreparedStatement pr=null;
            ResultSet rs=null;

            try{
            Class.forName(classfor);

            con=DriverManager.getConnection(url, usuario, clave);

            } catch (ClassNotFoundException e) {
                 System.out.println(e.toString());
              }
             try{
            String sql= "select nombe from cliente";
            pr = con.prepareStatement(sql);


            rs = pr.executeQuery();
            //aqui debe ir el if!


           out.println("<select name='escogercliente'>");
            while(rs.next()){
                  out.println("<option id='cliente'>"+rs.getString(1)+"</option>");
            }
           out.println("</select>");

            rs.close();
            pr.close();
            con.close();

            } //fin del try
            catch (SQLException e) {
              }




%>
 
                <p> <input type="submit" value="Ver" name="verventas"></p>

        </form>




        </div>
    </body>
</html>