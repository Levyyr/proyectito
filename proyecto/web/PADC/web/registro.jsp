<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <% 
            Connection con = null;
            Statement sta = null;
            String correo = request.getParameter("correo");
            String usuario = request.getParameter("usuario");
            String contraseña = request.getParameter("contra");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection
                ("jdbc:mysql://localhost:3306/PA?autoReconnect=true&useSS1=false","root","n0m3l0");

            } catch (SQLException e) {
                out.print("Error de conexion con la base de datos");
            }
            
            sta = con.createStatement();
            sta.executeUpdate("insert into inicio_sesion values('"+correo+"','"+contraseña+"','"+usuario+"');");
            
            con.close();
            sta.close();
            
            out.println("<script>window.location.href='inicio.html';</script>");
            
            
            
            
        %>
    </body>
</html>
