<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/16/2020
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/templet/header.jsp" %>
<%@ include file="/templet/nav.jsp" %>
<form action="/book" method="get">
    <input type="hidden" name="action" value="getBookType">
    <button type="submit" class="btn btn-primary">CreateNew</button>
</form>
<div class="container">
    <table class="table table-striped" id="tableBook" style="width: 100%">
        <thead>
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Content</th>
            <th>BookType</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="listBook" items="${list.get(0)}">
            <tr>
                <td><c:out value="${listBook.id}"/></td>
                <td><c:out value="${listBook.title}"/></td>
                <td><c:out value="${listBook.content}"/></td>
                <c:forEach var="listBookType" items="${list.get(1)}">
                    <c:if test="${listBookType.id == listBook.idBookType}">
                        <td><c:out value="${listBookType.name}"/></td>
                    </c:if>
                </c:forEach>
                <td>
                    <form action="/book" method="get">
                        <input type="hidden" name="action" value="getBook">
                        <input type="hidden" name="idEdit" value="${listBook.id}">
                        <button type="submit" class="btn btn-primary">Edit</button>
                    </form>
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelDelete"
                            onclick="getId(${listBook.id})">Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Button trigger modal -->
<%--delete book--%>
<div class="modal fade" id="modelDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Do you want delete ?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/book" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="idDelette" id="id">
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Oke</button>
                </div>
            </form>
        </div>
    </div>
</div>
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
<script>
    $(document).ready(function () {
        $("#tableBook").dataTable({
            "pageLength": 2
        });
    });

    function getId(id) {
        document.getElementById("id").value = id;
    }

</script>
</body>
</html>