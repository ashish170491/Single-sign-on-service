<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Authorization Server - Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        form {
            width: 300px;
            margin: 0 auto;
        }
        div {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Authorization Server Login</h1>
    <form action="${pageContext.request.contextPath}/login" method="post">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <button type="submit">Login</button>
        </div>
    </form>
</body>
</html>
