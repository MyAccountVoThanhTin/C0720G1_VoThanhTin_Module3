<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/5/2020
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>List Users</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
</head>
<body>
<%--<form action="?action=sortByName" method="post">--%>
    <a  class="btn btn-danger" href="?action=sortByName">SortByName</a>
<%--</form>--%>

<h2 style="text-align: center">LIST USERS</h2>
<form action="" class="form" style="text-align: center">
    <table class="table table-striped" id="tableStudent" style="width: 100%;">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Country</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${listUser}">
            <tr>
                <th scope="row"><c:out value="${list.id}"/></th>
                <td><c:out value="${list.name}"/></td>
                <td><c:out value="${list.email}"/></td>
                <td><c:out value="${list.country}"/></td>
                <td>
                    <a href="?action=edit&id=${list.id}" class="btn btn-warning">Edit</a>
                    <a href="?action=delete&id=${list.id}" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
<form action="?action=create" method="post">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Create New</button>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Create New</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Name</label>
                        <input type="text" class="form-control" id="recipient-name" name="name">
                    </div>
                    <div class="form-group">
                        <label  class="col-form-label">Email</label>
                        <input type="text" class="form-control" name="email">
                    </div>
                    <div class="form-group">
                        <label  class="col-form-label">Country</label>
                        <input type="text" class="form-control" name="country">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Create</button>
            </div>
        </div>
    </div>
</div>
</form>
<br>
<form action="?action=findName" method="post">
    <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Search</button>
    <input type="text" name="search" class="text-input">
</form>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"--%>
<%--        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"--%>
<%--        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"--%>
<%--        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"--%>
<%--        crossorigin="anonymous"></script>--%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            // "dom": 'lrtip',
            // "lengthChange": false,
            // "pageLength": 3
        });
    });
</script>
</body>
</html>
