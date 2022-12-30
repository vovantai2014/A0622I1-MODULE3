<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/30/2022
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<form action="/display" method="post">
  <h1>Product Description : ip 14</h1>
  <label>List Price: </label><br/>
  <input type="text" name="price"  value=""/><br/>
  <label>Discount Percent: </label><br/>
  <input type="text" name="percent" value=""/><br/>
  <input type = "submit" id = "submit" value = "Calculate Discount"/>
</form>
</body>
</html>
