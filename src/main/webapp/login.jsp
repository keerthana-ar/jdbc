<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Login</title></head>
<body>
  <h2>Login</h2>
  <form method="post" action="login">
    <label>Username</label><br>
    <input type="text" name="username" required><br>
    <label>Password</label><br>
    <input type="password" name="password" required><br><br>
    <button type="submit">Login</button>
  </form>
  <% if (request.getParameter("error") != null) { %>
    <p style="color:red;">Invalid username or password</p>
  <% } %>
</body>
</html>
