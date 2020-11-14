<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/6/2020
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>
<%--    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>--%>
<%--    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>--%>
    <!-- Bootstrap CSS -->
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"--%>
<%--          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.19/css/jquery.min.js">--%>
</head>
<body>
<h2 style="text-align: center">LIST PRODUCT</h2>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelCreate">
        Create New
    </button>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    SORT
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="?action=sortById">Sort By Id</a>
                    <a class="dropdown-item" href="?action=sortByName">Sort By Name</a>
                    <a class="dropdown-item" href="?action=sortByCost">Sort By Cost</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="?action=findByName" method="post">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            <button type="button" hidden="hidden" class="btn btn-primary btn-lg" data-toggle="modal"
                    data-target="#modelFindByName" id="findByName"></button>
        </form>
    </div>
</nav>

<%--Tìm Product theo tên--%>
<div class="modal fade" id="modelFindByName" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">List Product Find</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-dark">
                    <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Cost</th>
                        <th scope="col">NSX</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${productFindByName}">
                        <tr>
                            <th scope="row"><c:out value="${product.id}"/></th>
                            <td><c:out value="${product.name}"/></td>
                            <td><c:out value="${product.cost}"/></td>
                            <td><c:out value="${product.nsx}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<%--Tạo Product Mới--%>
<div class="modal fade" id="modelCreate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">CREATE NEW PRODUCT</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="?action=create" method="post">
                <div class="modal-body">
                    <form action="?action=edit" method="post">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Id:</label>
                                <input type="hidden" class="form-control" id="recipient-name12" name="id">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Name:</label>
                                <input type="text" class="form-control" id="recipient-name13" name="name">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">COST:</label>
                                <input class="form-control" id="message-text13" name="cost">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">NSX:</label>
                                <input class="form-control" id="message-text12" name="nsx">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="Submit" class="btn btn-primary">CREATE</button>
                        </div>
                    </form>
                </div>
            </form>
        </div>
    </div>
</div>

<%--Hiển Thị Bản Products--%>
<form action="" class="form" style="text-align: center">
    <div class="container">
        <table class="table table-striped" id="tableStudent" style="width:100%">
            <thead>
            <tr id="list-header">
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">COST</th>
                <th scope="col">NSX</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${listProducts}">
                <tr>
                    <th scope="row"><c:out value="${list.id}"/></th>
                    <td><c:out value="${list.name}"/></td>
                    <td><c:out value="${list.cost}"/></td>
                    <td><c:out value="${list.nsx}"/></td>
                    <td>
                        <a href="?action=edit&id=${list.id}" class="btn btn-danger">EDIT</a>
                        <button type="button" id="hiddenButton" class="btn btn-primary btn-lg"
                                data-toggle="modal"
                                hidden="hidden" data-target="#modelIdEdit"></button>
                        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
                                data-target="#modelIdDelete" onclick="onDelete(${list.id})">
                            DELETE
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</form>

<%--Sửa Products--%>
<div class="modal fade" id="modelIdEdit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">EDIT PRODUCT</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="?action=edit" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Id:</label>
                        <input type="hidden" class="form-control" id="recipient-name1" value="${productEdit.id}"
                               name="id">
                    </div>
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Name:</label>
                        <input type="text" class="form-control" id="recipient-name" value="${productEdit.name}"
                               name="name">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">COST:</label>
                        <input class="form-control" id="message-text" value="${productEdit.cost}" name="cost">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">NSX:</label>
                        <input class="form-control" id="message-text1" value="${productEdit.nsx}" name="nsx">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="Submit" class="btn btn-primary">EDIT</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--Xóa Product--%>
<div class="modal fade" id="modelIdDelete" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">DO YOU WANT DELETE ?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="?action=delete" method="post">
                <input type="hidden" name="id" id="modalId">
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">OK</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
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
<%--<script src="jquery/jquery-3.5.1.min.js"></script>--%>
<%--<script src="datatables/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="datatables/js/dataTables.bootstrap4.min.js"></script>--%>
<%--<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>--%>
<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
<script>
    function onDelete(id) {
        document.getElementById("modalId").value = id;
    }

    function onGetProduct(id) {
        document.getElementById("getProduct").value = id;
    }

    // message edit product
    <c:if test="${message =='1'}">
    document.getElementById("hiddenButton").click();
    </c:if>

    // mesage find by name
    <c:if test="${mesageFindByName == '1'}">
    document.getElementById("findByName").click();
    </c:if>

    $(document).ready(function () {
        $('#tableStudent').dataTable({
             // "dom": 'lrtip',
            // "lengthChange": false,
             "pageLength": 2
        });
    });

    $(document).ready(function () {
        $("#list-header").on({
            mouseenter: function () {
                $(this).css("background-color", "lightgray");
            },
            mouseleave: function () {
                $(this).css("background-color", "lightblue");
            },
        });
    });


</script>
</body>
</html>
