<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/10/2020
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
</head>
<body>

<div class="header-content">
    <div class="container">
        <div class="row">
            <div class="col-auto col-sm-5 col-lg-3 d-flex align-items-center bestel-logo">
                <a href="#" class="header-logo"><img id="logo"
                                                     src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png"
                                                     alt="logo " class="img-fluid" width="63" height="100"></a>
            </div>
            <div class="col col-md-auto col-lg-3 d-flex">
                <div class="catalog-widget d-none d-sm-block">
                    <div class="catalog-widget-inside" style="visibility: visible;">
                        <a href="#" target="_blank">
                            <div class="widget-tripadvisor">
                                <div class="inside">
                                    <div class="widget-tripadvisor-logo"><img
                                            src="https://smartdata.tonytemplates.com/bestel/wp-content/uploads/2018/05/widget-tripadvisor-logo.png"
                                            alt=""></div>
                                    <div class="widget-tripadvisor-rating"><img
                                            src="https://furamavietnam.com/wp-content/uploads/2018/08/widget-tripadvisor-rating.png"
                                            alt=""></div>
                                </div>
                            </div>
                        </a>
                        <span class="catalog-widget-toggle js-catalog-widget-toggle"></span></div>
                </div>
                <div class="catalog-widget-mobile d-flex d-sm-none align-items-center mx-auto">
                </div>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%;">
    <a class="navbar-brand" href="#k">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="background-color: #64f3ff">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="?action=showAllCustomer">Employee<span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/customer?action">Customer</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contract</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Service
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Villa</a>
                    <a class="dropdown-item" href="#">House</a>
                    <a class="dropdown-item" href="#">Room</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<%--tạo mới Customer--%>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelCreateCustomer">
    Create New
</button>

<!-- Modal -->
<div class="modal fade" id="modelCreateCustomer" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/customer?action=create" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-form-label">Name:</label>
                        <input type="text" class="form-control" id="recipientname" name="name">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Birthday:</label>
                        <input type="date" class="form-control" id="recipientbirthday" name="birthday">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Gender:</label>
                        <select name="gender">
                            <option value="Nu">Nam</option>
                            <option value="Name">Nu</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Id Card:</label>
                        <input type="text" class="form-control" id="recipientidCard" name="idCard">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Phone:</label>
                        <input type="text" class="form-control" id="recipientphone" name="phone">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Email:</label>
                        <input type="text" class="form-control" id="recipientemail" name="email">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Address:</label>
                        <input type="text" class="form-control" id="recipientaddress" name="address">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Customer Type:</label>
                        <select name="idCustomerType">
                            <c:forEach var="customerType" items="${list.get(1)}">
                                <option value="${customerType.idCustomerType}">
                                    <c:out value="${customerType.nameCustomerType}"/>
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Ok</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--show all customer--%>
<div class="container-fluid mx-0">
    <table class="table table table-striped" style="width: 100%" id="tableCustomer">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>Id Card</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Customer Type</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="listCustomer" items="${list.get(0)}">
            <tr>
                <th><c:out value="${listCustomer.id}"/></th>
                <td><c:out value="${listCustomer.name}"/></td>
                <td><c:out value="${listCustomer.birthday}"/></td>
                <td><c:out value="${listCustomer.gender}"/></td>
                <td><c:out value="${listCustomer.id_card}"/></td>
                <td><c:out value="${listCustomer.phone}"/></td>
                <td><c:out value="${listCustomer.email}"/></td>
                <td><c:out value="${listCustomer.address}"/></td>
                <c:forEach var="listCustomerType" items="${list.get(1)}">
                    <c:if test="${listCustomer.idCustomerType == listCustomerType.idCustomerType}">
                        <td><c:out value="${listCustomerType.nameCustomerType}"/></td>
                    </c:if>
                </c:forEach>
                <td>
                    <form action="/customer" method="get">
                        <input type="hidden" name="action" value="getCustomer">
                        <input type="hidden" name="id" value="${listCustomer.id}">
                        <button class="btn btn-primary" type="submit">Edit</button>
                    </form>
                    <button id="modalEdit" hidden="hidden" type="button" class="btn btn-primary btn-lg"
                            data-toggle="modal"
                            data-target="#modelEditCustomer"></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="modelEditCustomer" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Customer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-form-label">Id:</label>
                        <input type="text" class="form-control" name="name" value="${customer.id}" readonly>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Name:</label>
                        <input type="text" class="form-control" name="name" value="${customer.name}">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Birthday:</label>
                        <input type="text" class="form-control" name="name" value="${customer.birthday}">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Id Card:</label>
                        <input type="text" class="form-control" name="name" value="${customer.id_card}">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Phone:</label>
                        <input type="text" class="form-control" name="name" value="${customer.phone}">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Email:</label>
                        <input type="text" class="form-control" name="name" value="${customer.email}">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Address:</label>
                        <input type="text" class="form-control" name="name" value="${customer.address}">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Gender:</label>
                        <select name="gender">
                            <c:choose>
                                <c:when test="${customer.gender == 'Nam'}">
                                    <option value="Nam" selected>Nam</option>
                                    <option value="Nu">Nu</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="Nu" selected>Nu</option>
                                    <option value="Nam">Nam</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Customer Type:</label>
                        <select name="idCustomerType">
                            <c:forEach var="customerType" items="${list.get(1)}">
                                <c:choose>
                                    <c:when test="${customerType.idCustomerType == customer.idCustomerType}">
                                        <option value="${customer.idCustomerType}" selected><c:out
                                                value="${customerType.nameCustomerType}"/></option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${customerType.idCustomerType}"><c:out
                                                value="${customerType.nameCustomerType}"/></option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
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
        $("#tableCustomer").dataTable({
            "pageLength": 2
        });
    })

    <c:if test="${messageEdit == '1'}">
    document.getElementById("modalEdit").click();
    </c:if>
</script>
</body>
</html>
