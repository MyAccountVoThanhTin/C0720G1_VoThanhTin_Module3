<%@ page import="java.util.List" %>
<%@ page import="models.customer_employee.Employee" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.customer_employee.PositionEmployee" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/10/2020
  Time: 6:22 PM
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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
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
    <a class="navbar-brand" href="/employee?action=comeBack">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" style="background-color: #64f3ff">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="?action=showAllEmployee">Employee<span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="?action=showAllCustomer">Customer</a>
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


<%--Bảng tạo mới Employee--%>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modelCreate">
    CreateNew
</button>

<!-- Modal -->
<div class="modal fade" id="modelCreate" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">New Employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/employee?action=createEmployee" method="post">
                <div class="modal-body">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Name:</label>
                            <input type="text" class="form-control" id="recipientname" name="name">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Birthday:</label>
                            <input class="form-control" id="message-text" name="birthday">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Id_Card:</label>
                            <input class="form-control" id="message-textidCard" name="idCard">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Salary:</label>
                            <input class="form-control" id="message-textsalary" name="salary">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Phone:</label>
                            <input class="form-control" id="message-textphone" name="phone">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Email:</label>
                            <input class="form-control" id="message-textemail" name="email">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Address:</label>
                            <input class="form-control" id="message-textaddress" name="address">
                        </div>
                        <div class="form-group">
                            <label class="col-form-label">Position:</label>
                            <%--                            <input class="form-control" id="message-textposition" name="idPosition" value="" readonly>--%>
                            <%--                            <div class="dropdown">--%>
                            <%--                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Id Position--%>
                            <%--                                    <span class="caret"></span></button>--%>
                            <%--                                <ul class="dropdown-menu">--%>
                            <%--                                    <c:forEach var="listPosition" items="${list.get(1)}">--%>
                            <%--                                        <li onclick=clickPosition('${listPosition.idPosition}')><c:out value="${listPosition.namePosition}"/></li>--%>
                            <%--                                    </c:forEach>--%>
                            <%--                                </ul>--%>
                            <%--                            </div>--%>
                            <select class="custom-select" name="idPosition">
                                <c:forEach var="listPosition" items="${list.get(1)}">
                                    <option value="${listPosition.idPosition}"><c:out
                                            value="${listPosition.namePosition}"/></option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">Education:</label>
                            <select class="custom-select" name="idEducation">
                                <c:forEach var="listEducation" items="${list.get(2)}">
                                    <option value="${listEducation.idEducatonDegree}"><c:out
                                            value="${listEducation.nameEducationDegree}"/></option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">Division:</label>
                            <select class="custom-select" name="idDivision">
                                <c:forEach var="listDivision" items="${list.get(3)}">
                                    <option value="${listDivision.idDivision}"><c:out
                                            value="${listDivision.nameDivision}"/></option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="col-form-label">User name:</label>
                            <select class="custom-select" name="userName">
                                <c:forEach var="listUser" items="${list.get(4)}">
                                    <option value="${listUser.userName}"><c:out
                                            value="${listUser.userName}"/></option>
                                </c:forEach>
                            </select>
                        </div>

                        <%--                        <div class="form-group">--%>
                        <%--                            <label for="message-text" class="col-form-label">User Name:</label>--%>
                        <%--                            <input class="form-control" id="message-textuserName" value="" name="userName">--%>
                        <%--                        </div>--%>
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
<br>
<%--Hiển thị bảng Employee--%>
<div class="container mx-5">
    <table class="table table-striped" style="width: 100%;" id="tableEmployee">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Birthday</th>
            <th scope="col">ID_Card</th>
            <th scope="col">Phone</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">Salary</th>
            <th scope="col">Position</th>
            <th scope="col">Education_Degree</th>
            <th scope="col">Division</th>
            <th scope="col">UserName</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${list.get(0)}">
            <%--            <%! String positionName;%>--%>
            <%--            <%! String educationName;%>--%>
            <%--            <%! String divisionName;%>--%>
            <%--            <c:forEach var="position" items="${list.get(1)}">--%>
            <%--                <c:if test="${position.idPosition == employee.idPosition}">--%>
            <%--                    positionName = position.namePosition;--%>
            <%--                </c:if>--%>
            <%--            </c:forEach>--%>
            <%--            <c:forEach var="education" items="${list.get(2)}">--%>
            <%--                <c:if test="${education.idEducatonDegree == employee.idEducation_degree}">--%>
            <%--                    educationName = --%>
            <%--                </c:if>--%>
            <%--            </c:forEach>--%>
            <tr>
                <th scope="row"><c:out value="${employee.id}"/></th>
                <td><c:out value="${employee.name}"/></td>
                <td><c:out value="${employee.birthday}"/></td>
                <td><c:out value="${employee.id_card}"/></td>
                <td><c:out value="${employee.phone}"/></td>
                <td><c:out value="${employee.email}"/></td>
                <td><c:out value="${employee.address}"/></td>
                <td><c:out value="${employee.salary}"/></td>
                <c:forEach var="position" items="${list.get(1)}">
                    <c:if test="${position.idPosition == employee.idPosition}">
                        <td><c:out value="${position.namePosition}"/></td>
                    </c:if>
                </c:forEach>
                <c:forEach var="education" items="${list.get(2)}">
                    <c:if test="${education.idEducatonDegree == employee.idEducation_degree}">
                        <td><c:out value="${education.nameEducationDegree}"/></td>
                    </c:if>
                </c:forEach>
                <c:forEach var="division" items="${list.get(3)}">
                    <c:if test="${division.idDivision == employee.idDivision}">
                        <td><c:out value="${division.nameDivision}"/></td>
                    </c:if>
                </c:forEach>
                <c:forEach var="user" items="${list.get(4)}">
                    <c:if test="${user.userName == employee.userName}">
                        <td><c:out value="${user.userName}"/></td>
                    </c:if>
                </c:forEach>
                <td>
                    <form action="/employee">
                        <input type="hidden" name="id" value="${employee.id}">
                        <input type="hidden" name="action" value="getEmployee">
                        <button type="submit" class="btn btn-success">Edit</button>
                    </form>
                    <button id="editEmployee" hidden="hidden" type="button" class="btn btn-primary btn-lg"
                            data-toggle="modal" data-target="#modelEdit"></button>

                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal"
                            data-target="#deleteEmployee" onclick="deleteEmployee(${employee.id})">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--Delete Employee--%>
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="deleteEmployee" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Are you sure delete ?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%--            <div class="modal-body">--%>
            <%--                Body--%>
            <%--            </div>--%>
            <form action="/employee" method="post">
                <input type="hidden" name="delete" id="idDelete">
                <input type="hidden" name="action" value="deleteEmployee">
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Ok</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Button trigger modal -->

<!-- Modal Edit Employee -->
<div class="modal fade" id="modelEdit" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/employee?action=saveEdit" method="post">
                    <input type="hidden" name="id" value="${employee.id}">
                    <div class="modal-body">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Name:</label>
                                <input type="text" class="form-control" name="name" value="${employee.name}">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Birthday:</label>
                                <input class="form-control" name="birthday" value="${employee.birthday}">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Id_Card:</label>
                                <input class="form-control" name="idCard" value="${employee.id_card}">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Salary:</label>
                                <input class="form-control" name="salary" value="${employee.salary}">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Phone:</label>
                                <input class="form-control" name="phone" value="${employee.phone}">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Email:</label>
                                <input class="form-control" name="email" value="${employee.email}">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Address:</label>
                                <input class="form-control" name="address" value="${employee.address}">
                            </div>
                            <div class="form-group">
                                <label class="col-form-label">Position:</label>
                                <select class="custom-select" name="idPosition">
                                    <c:forEach var="listPosition" items="${list.get(1)}">
                                        <c:choose>
                                            <c:when test="${listPosition.idPosition == employee.idPosition}">
                                                <option value="${listPosition.idPosition}" selected><c:out
                                                        value="${listPosition.namePosition}"/></option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${listPosition.idPosition}"><c:out
                                                        value="${listPosition.namePosition}"/></option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="col-form-label">Education:</label>
                                <select class="custom-select" name="idEducation">
                                    <c:forEach var="listEducation" items="${list.get(2)}">
                                        <c:choose>
                                            <c:when test="${listEducation.idEducatonDegree == employee.idEducation_degree}">
                                                <option value="${listEducation.idEducatonDegree}" selected><c:out
                                                        value="${listEducation.nameEducationDegree}"/></option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${listEducation.idEducatonDegree}"><c:out
                                                        value="${listEducation.nameEducationDegree}"/></option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="col-form-label">Division:</label>
                                <select class="custom-select" name="idDivision">
                                    <c:forEach var="listDivision" items="${list.get(3)}">
                                        <c:choose>
                                            <c:when test="${listDivision.idDivision == employee.idDivision}">
                                                <option value="${listDivision.idDivision}" selected><c:out
                                                        value="${listDivision.nameDivision}"/></option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${listDivision.idDivision}"><c:out
                                                        value="${listDivision.nameDivision}"/></option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="col-form-label">User Name:</label>
                                <select class="custom-select" name="username">
                                    <c:forEach var="listUsername" items="${list.get(4)}">
                                        <c:choose>
                                            <c:when test="${listUsername.userName == employee.userName}">
                                                <option value="${listUsername.userName}" selected><c:out
                                                        value="${listUsername.userName}"/></option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${listUsername.userName}"><c:out
                                                        value="${listUsername.userName}"/></option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <%--                            <div class="form-group">--%>
                            <%--                                <label for="message-text" class="col-form-label">User Name:</label>--%>
                            <%--                                <input class="form-control" value="" name="userName">--%>
                            <%--                            </div>--%>
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
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
        $("#tableEmployee").dataTable({
            "pageLength": 2
        });
    });

    function deleteEmployee(id) {
        document.getElementById("idDelete").value = id;
    }

    <c:if test="${message == '1'}">
    document.getElementById("editEmployee").click();
    </c:if>
</script>
</body>
</html>
