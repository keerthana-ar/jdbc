<%@ page import="java.util.*, com.foodorder.model.FoodItem" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<FoodItem> foods = (List<FoodItem>) request.getAttribute("foods");
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            padding: 30px 40px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        .header h2 {
            margin: 0;
            color: #2c3e50;
        }
        .header-nav a {
            color: #3498db;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: 500;
            margin-left: 20px;
            transition: color 0.3s;
        }
        .header-nav a:hover {
            color: #e74c3c;
        }
        .menu-container {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
            justify-content: flex-start;
        }
        .food-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.08);
            width: 280px;
            background: #fafafa;
            padding: 20px;
            display: flex;
            flex-direction: column;
            transition: box-shadow 0.3s, transform 0.3s;
        }
        .food-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.12);
        }
        .food-card h3 {
            margin-top: 0;
            margin-bottom: 10px;
            color: #e74c3c;
            font-size: 1.4em;
        }
        .food-card .price {
            font-size: 1.3em;
            font-weight: 600;
            color: #27ae60;
            margin-bottom: 15px;
        }
        .food-card form {
            margin-top: auto; /* Pushes form to the bottom */
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .food-card .qty-input {
            display: flex;
            align-items: center;
            gap: 10px;
        }
         .food-card label {
            font-weight: 500;
         }
        input[type="number"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1em;
            width: 70px;
            text-align: center;
            box-sizing: border-box;
        }
        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1em;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
  <div class="container">
      <div class="header">
          <h2>Welcome, <%= username %> &mdash; Menu</h2>
          <div class="header-nav">
              <a href="cart.jsp">View Cart</a>
              <a href="login.jsp">Logout</a>
          </div>
      </div>
      
      <div class="menu-container">
          <% for (FoodItem f : foods) { %>
            <div class="food-card">
              <h3><%= f.getName() %></h3>
              <p class="price">₹<%= String.format("%.2f", f.getPrice()) %></p>
              
              <form method="post" action="cart">
                <input type="hidden" name="id" value="<%= f.getId() %>">
                <div class="qty-input">
                    <label for="qty-<%= f.getId() %>">Qty:</label>
                    <input type="number" 
                           name="qty" 
                           id="qty-<%= f.getId() %>" 
                           value="1" 
                           min="1" 
                           style="width:70px;">
                </div>
                <button type="submit">Add to Cart</button>
              </form>
            </div>
          <% } %>
      </div>
  </div>
</body>
</html>