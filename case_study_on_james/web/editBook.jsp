<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/16/2020
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/templet/header.jsp" %>
<%@ include file="/templet/nav.jsp" %>
<form action="?action=saveEdit" method="post">
    <div class="form-group">
        <label>Id </label>
        <input type="text" class="form-control" id="exampleInputId" name="id" readonly value="${book.id}">
    </div>
    <div class="form-group">
        <label>Title </label>
        <input type="text" class="form-control" id="exampleInputTitle" name="title" value="${book.title}">
    </div>
    <div class="form-group">
        <label>Content</label>
        <input type="text" class="form-control" id="exampleInputContent" name="content" value="${book.content}">
    </div>
    <div class="form-group">
        <label>Id book</label>
        <select name="idBook">
            <c:forEach var="listBookType" items="${listBooksType}">
                <c:choose>
                    <c:when test="${listBookType.id == book.idBookType}">
                        <option selected value="${book.idBookType}"><c:out value="${listBookType.name}"/></option>
                    </c:when>
                    <c:otherwise>
                        <option value="${listBookType.id}"><c:out value="${listBookType.name}"/></option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
</body>
</heml>