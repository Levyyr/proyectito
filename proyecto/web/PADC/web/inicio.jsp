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
            ResultSet rs = null;
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
            rs = sta.executeQuery("SELECT * FROM inicio_sesion WHERE usuario = '" + usuario + "' AND contra = '" + contraseña + "'");
            
            if (rs.next()) {
                response.sendRedirect("prueba.html");
            } else {
                out.println("<script>alert('Usuario o contraseña incorrectos');</script>");
                out.println("window.location.href='inicio.html';");
            }
            
        %>
    </body>
</html>

