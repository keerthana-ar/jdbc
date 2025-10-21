<%@ page import="java.util.*, com.foodorder.model.FoodItem" %>
<%
    List<FoodItem> foods = (List<FoodItem>) request.getAttribute("foods");
    String username = (String) session.getAttribute("username");
    if (username == null) response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Menu</title></head>
<body>
  <h2>Welcome, <%= username %> — Menu</h2>
  <a href="cart.jsp">View Cart</a> |
  <a href="login.jsp">Logout</a>
  <hr/>
  <table border="1" cellpadding="6">
    <tr><th>Item</th><th>Price</th><th>Qty</th><th></th></tr>
    <% for (FoodItem f : foods) { %>
      <tr>
        <td><%= f.getName() %></td>
        <td>₹<%= String.format("%.2f", f.getPrice()) %></td>
        <td>
          <form method="post" action="cart">
            <input type="hidden" name="id" value="<%= f.getId() %>">
            <input type="number" name="qty" value="1" min="1" style="width:60px;">
        </td>
        <td>
            <button type="submit">Add to Cart</button>
          </form>
        </td>
      </tr>
    <% } %>
  </table>
</body>
</html>
