<%--
  Created by Intellij IDEA.
  User: Vitaly Zubov
  Email: Zubov.VP@yandex.ru
  Version: $Id$
  Date: 05.02.2019
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User_view</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ page import="ru.job4j.models.User" %>
<style type="text/css">
    body {
        background-color: darkgray;
        color: black;
        margin: 0;
    }

    .display-4 {
        text-align: center;
    }

    .navbar-brand img {
        width: 40px;
    }

    table {
        border: black;
        background-color: white;
        margin: auto;
        width: 75%;
    }

</style>
<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #99ffff;">
    <div class="container-fluid">
        <a class="navbar-brand" href="http://www.bootstrap.com">
            <img src="<c:url value="https://www.drupal.org/files/project-images/bootstrap-stack.png"/>"
                 class="float-left">
        </a>
        <a class="navbar-brand" href="https://html.com">
            <img src="<c:url value="https://cdn-images-1.medium.com/max/1200/1*MJ9Y4_tCTv99Gs_xZYlKrA.png"/>"
                 class="float-left">
        </a>
        <a class="navbar-brand" href="https://www.w3.org/Style/CSS/">
            <img src="<c:url value="https://ru.w3docs.com/uploads/media/book_gallery/0001/02/c8d75681dcd87da6f7d8ebfa0cdb40cbb403bed8.png"/>"
                 class="float-left">
        </a>

        <a class="navbar-brand" href="https://www.javascript.com">
            <img src="<c:url value="https://img2.freepng.ru/20180417/fsw/kisspng-javascript-node-js-angularjs-jquery-github-5ad5a9c7373410.5023404615239520712261.jpg"/>"
                 class="float-left">
        </a>

        <a class="navbar-brand" href="https://www.java.com/">
            <img src="<c:url value="https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto/gigs/1284113/original/b39d9f8fd959132ec77dcd14a4df26b9620b34ba/code-java-program-fix-errors-and-do-your-assignments-and-projects.png"/>"
                 class="float-left">
        </a>
        <form class="form-inline" action="${pageContext.servletContext.contextPath}/">
            <!--<input class="form-control mr-sm-2" type="text" placeholder="Search">-->
            <button class="btn btn-success" type="submit">Home</button>
        </form>
    </div>
</nav>
<div class="display-4">
    User
</div>
<br>
<table width="100%" border="0">
    <th align="left">Id</th>
    <th align="left">Name</th>
    <th align="left">Login</th>
    <th align="left">Email</th>
    <th align="left">Create time</th>
    <th align="left">Country</th>
    <th align="left">City</th>
    <tr>
        <td align="left"><c:out value="${user.id}"></c:out></td>
        <td align="left"><c:out value="${user.name}"></c:out></td>
        <td align="left"><c:out value="${user.login}"></c:out></td>
        <td align="left"><c:out value="${user.email}"></c:out></td>
        <td align="left"><c:out value="${user.createDate}"></c:out></td>
        <td align="left"><c:out value="${user.country}"></c:out></td>
        <td align="left"><c:out value="${user.city}"></c:out></td>
        <td>
            <form action="${pageContext.servletContext.contextPath}/edit" method="GET">
                <input type="submit" name="submit" value="Correct" style="float: right">
                <input type="hidden" name="id" value="<c:out value="${user.id}"></c:out>">
                <input type="hidden" name="userName" value="<c:out value="${user.name}"></c:out>">
                <input type="hidden" name="login" value="<c:out value="${user.login}"></c:out>">
                <input type="hidden" name="email" value="<c:out value="${user.createDate}"></c:out>">
                <input type="hidden" name="country" value="<c:out value="${user.country}"></c:out>">
                <input type="hidden" name="city" value="<c:out value="${user.city}"></c:out>">
            </form>
        </td>
        <td>
            <form action="${pageContext.servletContext.contextPath}/delete" method="POST">
                <input type="submit" name="submit" value="Delete" style="float: left">
                <input type="hidden" name="id" value="<c:out value="${user.id}"></c:out>">
            </form>
        </td>
    </tr>
</table>
</body>
</html>