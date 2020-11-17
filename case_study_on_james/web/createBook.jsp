<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/16/2020
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/templet/header.jsp" %>
<%@ include file="/templet/nav.jsp" %>
<form action="?action=createNew" method="post">
    <div class="form-group">
        <label>Title </label>
        <input id="titleValidate" type="text" class="form-control" id="exampleInputTitle" name="title">
        <c:if test="${listValidate.get(0) == '0'}" >
            <p style="color: red">Fail Format</p>
        </c:if>
    </div>
    <div class="form-group">
        <label>Content</label>
        <input type="text" class="form-control" id="exampleInputContent" name="content">
        <p class="hide" style="color: red">Fail Format</p>
    </div>
    <div class="form-group">
        <label>Id book</label>
        <select name="idBook">
            <c:forEach var="listBookTpe" items="${listBookType}">
                <option value="${listBookTpe.id}"><c:out value="${listBookTpe.name}"/></option>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<script>
    $(document).ready(function () {
        $(".hide").hide();
    });
    $(document).ready(function () {
        document.getElementById("titleValidate").value = "${books.title}";
    });
</script>
</body>
</html>
