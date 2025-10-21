<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .login-container {
            max-width: 400px;
            margin: 40px auto;
            padding: 40px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
        }
        .login-container h2 {
            text-align: center;
            color: #2c3e50;
            margin-top: 0;
            margin-bottom: 25px;
        }
        .login-container form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }
        .login-container label {
            font-weight: 600;
            margin-bottom: -10px;
        }
        input[type="text"],
        input[type="password"] {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1em;
            width: 100%;
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52,152,219,0.3);
            outline: none;
        }
        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 14px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1.1em;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #2980b9;
        }
        .error {
            color: #e74c3c;
            font-weight: bold;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
  <div class="login-container">
      <h2>Food Order Login</h2>
      <form method="post" action="login">
        <div>
            <label>Username</label><br>
            <input type="text" name="username" required>
        </div>
        <div>
            <label>Password</label><br>
            <input type="password" name="password" required>
        </div>
        <button type="submit">Login</button>
      </form>
      <% if (request.getParameter("error") != null) { %>
        <p class="error">Invalid username or password</p>
      <% } %>
  </div>
</body>
</html>