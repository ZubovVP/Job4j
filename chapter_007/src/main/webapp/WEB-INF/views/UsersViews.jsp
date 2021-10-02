<%--
 Created by Intellij IDEA.
 User: Vitaly Zubov
 Email: Zubov.VP@yandex.ru
 Version: $Id$
 Date: 30.12.2018
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
<style>
    .navbar-brand img {
        width: 40px;
    }

    body {
        margin: 0;
        color: black;
        background-color: darkgray;
    }

    table {
        color: black;
    }

    .display-4 {
        text-align: center;
    }

    .button {
        width: 150px;
        height: 40px;
        border-radius: 20px;
        background: #459DE5;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
        position: relative;
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
            <button class="btn btn-success" type="submit">Home</button>
        </form>
    </div>
</nav>
<div class="display-4">
    All users
</div>
<div class="container">
    <table class="table table-light table-hover" >
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Login</th>
            <th>Email</th>
            <th>Create time</th>
            <th>Role</th>
            <th>Country</th>
            <th>City</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
        <tr>
            <td align="left"><c:out value="${user.id}"></c:out></td>
            <td align="left"><c:out value="${user.name}"></c:out></td>
            <td align="left"><c:out value="${user.login}"></c:out></td>
            <td align="left"><c:out value="${user.email}"></c:out></td>
            <td align="left"><c:out value="${user.createDate}"></c:out></td>
            <td align="left"><c:out value="${user.role}"></c:out></td>
            <td align="left"><c:out value="${user.country}"></c:out></td>
            <td align="left"><c:out value="${user.city}"></c:out></td>
            <div>
                <td align="right" width="10%">
                    <form action="${pageContext.servletContext.contextPath}/edit" method="GET">
                        <input type="submit" value="Correct" style="background: #fdeaa8; width: 100px">
                        <input type="hidden" name="id" value="<c:out value="${user.id}"></c:out>">
                        <input type="hidden" name="userName" value="<c:out value="${user.name}"></c:out>">
                        <input type="hidden" name="login" value="<c:out value="${user.login}"></c:out>">
                        <input type="hidden" name="email" value="<c:out value="${user.email}"></c:out>">
                        <input type="hidden" name="password" value="<c:out value="${user.password}"></c:out>">
                        <input type="hidden" name="role" value="<c:out value="${user.role}"></c:out>">
                        <input type="hidden" name="country" value="<c:out value="${user.country}"></c:out>">
                        <input type="hidden" name="city" value="<c:out value="${user.city}"></c:out>">
                    </form>
                </td>
                <c:if test="${sessionScope.role == 'admin'}">
                    <td align="left" width="10%">
                        <form action="${pageContext.servletContext.contextPath}/delete" method="POST">
                            <input type="submit" value="Delete" style="background: #fdeaa8; width: 100px">
                            <input type="hidden" name="id" value="<c:out value="${user.id}"></c:out>">
                        </form>
                    </td>
                </c:if>
            </div>
        </tr>
        </c:forEach>
    </table>
    <c:if test="${sessionScope.role == 'admin'}">
    <td>
        <form action="${pageContext.servletContext.contextPath}/find" method="POST">
            <label for="sub"></label><input type="text" id="sub" name="id" value="0">
            <input type="submit" class="button" name="submit" value="Find by id">
        </form>
    </td>
    <td>
        <form action="${pageContext.servletContext.contextPath}/create" method="GET">
            <input type="submit" class="button" name="submit" value="Create new user">
        </form>
    </td>
    </c:if>
    <td>
        <form action="${pageContext.servletContext.contextPath}/logout" method="POST">
            <input type="submit" class="button" name="submit" value="Logout">
        </form>
    </td>
</body>
</html>
