<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<Map<String,Object>> cart = (List<Map<String,Object>>) session.getAttribute("cart");
    if (cart == null) cart = new ArrayList<>();
    double total = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 900px;
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
            transition: color 0.3s;
        }
        .header-nav a:hover {
            color: #e74c3c;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 14px;
            text-align: left;
        }
        th {
            background-color: #f8f8f8;
            font-weight: 600;
            color: #555;
        }
        tr:nth-child(even) {
            background-color: #fdfdfd;
        }
        .cart-total {
            text-align: right;
            margin-top: 25px;
            font-size: 1.5em;
            font-weight: 600;
            color: #2c3e50;
        }
        .order-form {
            text-align: right;
            margin-top: 20px;
        }
        button {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 14px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1.1em;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #2ecc71;
        }
        .empty-cart {
            font-size: 1.1em;
            color: #777;
            text-align: center;
            padding: 40px;
        }
    </style>
</head>
<body>
  <div class="container">
      <div class="header">
          <h2>Your Cart</h2>
          <div class="header-nav">
              <a href="food">Continue Shopping</a>
          </div>
      </div>

      <% if (cart.isEmpty()) { %>
        <p class="empty-cart">Your cart is empty.</p>
      <% } else { %>
        <table>
          <tr>
              <th>Item</th>
              <th>Qty</th>
              <th>Price</th>
              <th>Subtotal</th>
          </tr>
          <% for (Map<String,Object> it : cart) {
               int qty = (int) it.get("qty");
               double price = ((Number) it.get("price")).doubleValue();
               double subtotal = qty * price;
               total += subtotal;
           %>
            <tr>
              <td><%= it.get("name") %></td>
              <td><%= qty %></td>
              <td>₹<%= String.format("%.2f", price) %></td>
              <td>₹<%= String.format("%.2f", subtotal) %></td>
            </tr>
          <% } %>
        </table>
        
        <h3 class="cart-total">Total: ₹<%= String.format("%.2f", total) %></h3>
        
        <form method="post" action="order" class="order-form">
          <button type="submit">Place Order</button>
        </form>
      <% } %>
  </div>
</body>
</html>