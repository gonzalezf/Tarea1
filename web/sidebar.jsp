<%-- 
    Document   : sidebar.jsp
    Created on : Apr 20, 2014, 7:45:30 PM
    Author     : felipe
--%>
<div id = "sidebar">
<div class="crbox">
    <h1>Información de Sesión</h1>
    <div id="pl">Usuario:</div>
    <div id="pr"><% out.print(session.getAttribute("UserName").toString());%></div>
    <div class = "clearfix"></div>
    <div id="pl">Nivel:</div>
    <div id="pr"><% out.print(session.getAttribute("UserLevel").toString());%> </div>
    <div class = "clearfix"></div>
    <a id="logout" href="logout.jsp">Log out </a>
</div>
<div class = "clearfix"></div>
<div id="menu">
    <div class="item"><a href="home.jsp">Inicio</a><br></div>
<%
    if(session.getAttribute("UserLevel").toString().equals("Administrador"))
        out.println("<div class=\"item\"><a href=\"ingresarvendedor.jsp\">Ingresar Vendedor</a><br></div>");
%>
    <div class="item"><a href="ingresarcliente.jsp">Ingresar Cliente</a><br></div>
<%
    if(session.getAttribute("UserLevel").toString().equals("Administrador"))
        out.println("<div class=\"item\"><a href=\"administrarproductos.jsp\">Administrar Productos</a><br></div>");
%>
    <div class="item"><a href="ingresarcompra.jsp">Ingresar Compra</a><br></div>
    <div class="item"><a href="ingresarventa.jsp">Ingresar Venta</a><br></div>
    <div class="item"><a href="verventas.jsp">Ver Ventas a Cliente</a><br></div>
    <div class="item"><a href="misventas.jsp">Mis Ventas </a><br></div>
    <div class="sidebarend"><div id="pepe">Pepe's Work</div><img src='img/logout.jpg'></div>
</div>
<div class = "clearfix"></div>
</div>
<script type="text/javascript">
</script>
