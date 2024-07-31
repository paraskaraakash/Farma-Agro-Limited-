<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<%
    // Retrieve form data
    String product = request.getParameter("product");
    String quantityStr = request.getParameter("quantity");
    int quantity = 0; // Default quantity

    // Check if quantity parameter is provided
    if (quantityStr != null && !quantityStr.isEmpty()) {
        // Parse quantity string to integer
        try {
            quantity = Integer.parseInt(quantityStr);
        } catch (NumberFormatException e) {
            // Handle invalid quantity input
            out.println("<p>Invalid quantity input.</p>");
            return;
        }
    } else {
        // Handle missing quantity parameter
        out.println("<p>Quantity is required.</p>");
        return;
    }

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/farmer";
    String username = "root";
    String password = "Akash1234";

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Connect to the database
        Connection conn = DriverManager.getConnection(url, username, password);

        // SQL query to insert data into the database
        String sql = "INSERT INTO `order` (product, quantity, name, email, phone, address) VALUES (?, ?, ?, ?, ?, ?)";

        // Prepare the statement
        PreparedStatement statement = conn.prepareStatement(sql);

        // Set parameters for the query
        statement.setString(1, product);
        statement.setInt(2, quantity);
        statement.setString(3, name);
        statement.setString(4, email);
        statement.setString(5, phone);
        statement.setString(6, address);

        // Execute the query
        int rowsInserted = statement.executeUpdate();

        // Close the connections
        statement.close();
        conn.close();

        // Check if the data was inserted successfully
        if (rowsInserted > 0) {
            out.println("<p>Order placed successfully!</p>");
        } else {
            out.println("<p>Failed to place order.</p>");
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>

  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Success Page</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
<h1>Your order is successfully saved</h1>
<footer>
<p>Redirecting back to previous page in <span id="countdown">10</span> seconds...</p>
<button onclick="goBack()">Back to Home</button>
</footer>

<script>
function goBack() {
    window.location.href = "Add.html"; // Change "index.html" to the path of your home page
}

</script>
</body>
</html>
  
