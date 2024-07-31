<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    String message = "";

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to the database
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmer", "root", "Akash1234");

        // Prepare the SQL statement
        String sql = "INSERT INTO regi (username, email, password) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        pstmt.setString(3, password);

        // Execute the SQL statement
        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            message = "Registration successful!";
        } else {
            message = "Registration failed. Please try again.";
        }
    } catch (SQLException ex) {
        message = "Error: " + ex.getMessage();
    } catch (ClassNotFoundException ex) {
        message = "Error: MySQL JDBC Driver not found";
    } finally {
        // Close the database connection and statement
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            message = "Error: " + ex.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Status</title>
</head>
<body>
    <h2><%= message %></h2>
    <a href="login.jsp">Back to Login Page</a>
</body>
</html>
