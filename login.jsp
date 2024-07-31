<%@ page import="java.sql.*" %>
<%
    // Retrieve form data
    String email = request.getParameter("Email");
    String password = request.getParameter("password");
    
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/farmer";
    String username = "root";
    String dbPassword = "Akash1234";

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        
        // Connect to the database
        Connection con = DriverManager.getConnection(url, username, dbPassword);
        
        // Prepare a SQL statement to insert data into the 'users' table
        String sql = "INSERT INTO users (email, password) VALUES (?, ?)";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);
        
        // Execute the statement
        int rowsInserted = statement.executeUpdate();
        
        // Close the database connection
        con.close();
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
    }
%>
<html>
<head>
    <title>Form Submission Result</title>
</head>
<style>
body{

    background-color:red;
}
h2{
text-align:center;
}
</style>
<body>
  <footer>
<p>Redirecting back to previous page in <span id="countdown">10</span> seconds...</p>
<button onclick="goBack()">Back to Home</button>
</footer>

<script>
function goBack() {
    window.location.href = "index.html"; // Change "index.html" to the path of your home page
}

</script>
</body>
</html>
