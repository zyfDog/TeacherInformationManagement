<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
  <div class="login">
	<h1>Login</h1>
    <form action= "LoginAction" method="post">
    	<input type="text" name="username" placeholder="Username" required="required" />
        <input type="password" name="password" placeholder="Password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large">Let me in.</button>
    </form>
</div>
</body>
</html>