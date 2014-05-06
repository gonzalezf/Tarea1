package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.registro;
import java.sql.*;
import java.util.ArrayList;

public final class ingresarcompra_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/sidebar.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");

    //Esto verifica que el usuario haya iniciado sesión
    //y que además tenga los permisos necesarios.
    if(!registro.IsLoggedIn(session))
    {
        response.sendRedirect("index.jsp");
        return;
    }
    else if(!registro.GetUserLevel(session).equals("Administrador"))
    {
        response.sendRedirect("index.jsp");
        return;
    }
    String classfor="oracle.jdbc.driver.OracleDriver";
    String url="jdbc:oracle:thin:@localhost:1521:XE";
    String usuario="admin";
    String clave="pelife18";

    Connection con=null;
    PreparedStatement pr = null;
    Statement consulta = null;
    ResultSet rs=null;

    try
    {
        Class.forName(classfor);
        con=DriverManager.getConnection(url, usuario, clave);

    }
    catch (ClassNotFoundException e)
    {
        System.out.println(e.toString());
    }
    ArrayList<String> items = new ArrayList<String>();
    ArrayList<String> ids = new ArrayList<String>();
    try
    {
        String sql= "select id_producto, nombre from producto";
        pr = con.prepareStatement(sql);
        rs = pr.executeQuery();
        while(rs.next())
        {
            ids.add(rs.getString(1));
            items.add(rs.getString(2));
        }
    }
    catch(Exception e)
    {
    }
    String selector = "";
    for(Iterator<String> i = ; i < items.size(); i++)
    {
        selector+="<option value=\\\""+ids.+"\\\">"+items[i]+"</option>";
    }

      out.write("\n");
      out.write("<script>\n");
      out.write("    ");
 out.print("var select_items = \""+selector+"\";"); 
      out.write("\n");
      out.write("</script>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Ingresar Compra</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\">\n");
      out.write("        <script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    ");
      out.write("\n");
      out.write("<div id = \"sidebar\">\n");
      out.write("<div class=\"crbox\">\n");
      out.write("    <h1>Información de Sesión</h1>\n");
      out.write("    <div id=\"pl\">Usuario:</div>\n");
      out.write("    <div id=\"pr\">");
 out.print(session.getAttribute("UserName").toString());
      out.write("</div>\n");
      out.write("    <div class = \"clearfix\"></div>\n");
      out.write("    <div id=\"pl\">Nivel:</div>\n");
      out.write("    <div id=\"pr\">");
 out.print(session.getAttribute("UserLevel").toString());
      out.write(" </div>\n");
      out.write("    <div class = \"clearfix\"></div>\n");
      out.write("    <a id=\"logout\" href=\"logout.jsp\">Log out </a>\n");
      out.write("</div>\n");
      out.write("<div class = \"clearfix\"></div>\n");
      out.write("<div id=\"menu\">\n");
      out.write("    <div class=\"item\"><a href=\"home.jsp\">Inicio</a><br></div>\n");

    if(session.getAttribute("UserLevel").toString().equals("Administrador"))
        out.println("<div class=\"item\"><a href=\"ingresarvendedor.jsp\">Ingresar Vendedor</a><br></div>");

      out.write("\n");
      out.write("    <div class=\"item\"><a href=\"ingresarcliente.jsp\">Ingresar Cliente</a><br></div>\n");

    if(session.getAttribute("UserLevel").toString().equals("Administrador"))
        out.println("<div class=\"item\"><a href=\"administrarproductos.jsp\">Administrar Productos</a><br></div>");

      out.write("\n");
      out.write("    <div class=\"item\"><a href=\"ingresarcompra.jsp\">Ingresar Compra</a><br></div>\n");
      out.write("    <div class=\"item\"><a href=\"ingresarventa.jsp\">Ingresar Venta</a><br></div>\n");
      out.write("    <div class=\"item\"><a href=\"verventas.jsp\">Ver Ventas a Cliente</a><br></div>\n");
      out.write("    <div class=\"item\"><a href=\"misventas.jsp\">Mis Ventas </a><br></div>\n");
      out.write("    <div class=\"sidebarend\"><div id=\"pepe\">Pepe's Work</div><img src='img/logout.jpg'></div>\n");
      out.write("</div>\n");
      out.write("<div class = \"clearfix\"></div>\n");
      out.write("</div>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("    <div class=\"pagecontent\">\n");
      out.write("        <form id = \"submit_form_compra\" action=\"ingresarcompra\" method=\"post\" >\n");
      out.write("            <h1>Ingresar Compra a la base de Datos</h1>\n");
      out.write("            <div id=\"InputAddStart\">\n");
      out.write("            <div id=\"left\">\n");
      out.write("             <p style=\"text-align:center;\">Producto</p>\n");
      out.write("            1\n");
      out.write("            <select class=\"input\" name=\"id_producto_1\">\n");
      out.write("                <script>\n");
      out.write("                    document.write(select_items);\n");
      out.write("                </script>\n");
      out.write("            </select>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div id=\"center\">\n");
      out.write("            <p style=\"text-align:center;\">Cantidad</p>\n");
      out.write("            <input class=\"input\" type=\"text\" value=\"\" name=\"cantidad_1\">\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div id=\"right\">\n");
      out.write("             <p style=\"text-align:center;\">Precio</p>\n");
      out.write("            <input class=\"input\" type=\"text\" value=\"\" name=\"precio_1\">\n");
      out.write("            <input id=\"plus_button\" class=\"submit\" type=\"submit\" value=\"+\" name=\"void\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"clearfix\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"submit_button_wrapper\">\n");
      out.write("            <input id=\"submit_button_compra\" class=\"submit\" type=\"submit\" value=\"Ingresar Compra\" name=\"ingresarcompra\">\n");
      out.write("            </div>\n");
      out.write("            <div id=\"form_reply_message\"></div>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("    </body>\n");
      out.write("    <script src=\"js/script.js\"> </script>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
