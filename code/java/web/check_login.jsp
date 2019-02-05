<%-- 
    Document   : check_login
    Created on : 4-feb-2019, 16.37.11
    Author     : ST4CK
--%>

<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/shopping_list", "root", "password");
    Statement stmt;
    stmt = conn.createStatement();

    if(!request.getParameter("email").equals("") && !request.getParameter("password").equals("")){
        ResultSet user = stmt.executeQuery("SELECT `id`,`password` FROM `User` WHERE `email` = \"lorenzo.pilati-3@studenti.unitn.it\";");
        user.next();

        MessageDigest md = MessageDigest.getInstance("SHA-512");
        byte[] hashInBytes = md.digest(request.getParameter("password").getBytes(StandardCharsets.UTF_8));

        StringBuilder sb = new StringBuilder();
        for (byte b : hashInBytes) {
            sb.append(String.format("%02x", b));
        }
        
        if(sb.toString().equals(user.getString("password"))){
            out.println("MATCH");
        }
        else{
            out.println("DOESN'T MATCH");
        }
    }
    else{
        out.println("VOID");
    }
%>