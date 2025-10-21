<%@ page import="java.util.*" %>
<%
    List<Map<String,Object>> cart = (List<Map<String,Object>>) session.getAttribute("cart");
    if (cart == null) cart = new ArrayList<>();
    double total = 0;
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Cart</title></head>
<body>
  <h2>Your Cart</h2>
  <a href="food">Continue shopping</a><br/><br/>
  <% if (cart.isEmpty()) { %>
    <p>Your cart is empty.</p>
  <% } else { %>
    <table border="1" cellpadding="6">
      <tr><th>Item</th><th>Qty</th><th>Price</th><th>Subtotal</th></tr>
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
    <h3>Total: ₹<%= String.format("%.2f", total) %></h3>
    <form method="post" action="order">
      <button type="submit">Place Order</button>
    </form>
  <% } %>
</body>
</html>
