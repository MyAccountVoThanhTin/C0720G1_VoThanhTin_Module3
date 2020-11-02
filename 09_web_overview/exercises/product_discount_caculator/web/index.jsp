<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/2/2020
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/caculator" method="post">
    <lable>Product Description : </lable>
    <br>
    <textarea></textarea>
    <br>
    <lable>List Price  :</lable>
    <input type="text" name="price">
    <br>
    <lable>Discount Percent</lable>
    <input type="text" name="discount">
    <br>
    <input type = "submit" id = "submit" value = "Search"/>
  </form>
  </body>
</html>
