<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success</title>
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
        .success-container {
            max-width: 500px;
            margin: 40px auto;
            padding: 40px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success-container h2 {
            font-size: 2.2em;
            color: #27ae60;
            margin-top: 0;
            margin-bottom: 25px;
        }
        .success-container a {
            display: inline-block;
            margin-top: 20px;
            background-color: #27ae60;
            color: white;
            padding: 12px 25px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 1.1em;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        .success-container a:hover {
            background-color: #2ecc71;
        }
    </style>
</head>
<body>
  <div class="success-container">
      <h2>Order placed successfully! 🎉</h2>
      <a href="food">Back to Menu</a>
  </div>
</body>
</html>