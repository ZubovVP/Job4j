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
    <title>Create</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <script>
        function validate() {
            var result = true;
            if ($('#name').val() === '') {
                result = false;
                alert('Please, fill your name');
            }
            if ($('#login').val() === '') {
                result = false;
                alert('Please, fill your login');
            }
            if ($('#email').val() === '') {
                result = false;
                alert('Please, fill email');
            }
            if ($('#password').val() === '') {
                result = false;
                alert('Please, fill password');
            }
            if ($('#country').val() === '') {
                result = false;
                alert('Please, fill country');
            }
            if ($('#city').val() === '') {
                result = false;
                alert('Please, fill city');
            }
            if (result) {
                sendPerson();
            }
            return result;
        }

        function sendPerson() {
            var name = $('#name').val();
            var login = $('#login').val();
            var email = $('#email').val();
            var password = $('#password').val();
            var role = $('#role').val();
            var country = $('#country').val();
            var city = $('#city').val();
            $.ajax({
                type: 'POST',
                url: "${pageContext.servletContext.contextPath}/create",
                data: {name: name, login: login, email: email, password: password, role: role, country: country, city: city},
                dataType: 'application/json',
                success: function (data) {
                    console.log(JSON.parse(data.responseText));
                }
            });
        }
    </script>
</head>
<body>
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

    .create {
        width: 150px;
        height: 40px;
        border-radius: 20px;
        color: #fff;
        font-size: 18px;
        cursor: pointer;
        position: relative;
        left: 50%;
        transform: translate(-50%, 0);
    }

    table {
        border: black;
        background-color: white;
        margin: auto;
        width: 75%;
    }

    .header_table {
        color: black;
        font-weight: bold;
        text-align: center;
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
    New user
</div>
<br>
<table border="2">
    <tr class="header_table">
        <td>Name</td>
        <td>Login</td>
        <td>Email</td>
        <td>Password</td>
        <td>Role</td>
        <td>Country</td>
        <td>City</td>
    </tr>
    <form id="create" action="${pageContext.servletContext.contextPath}/" method="GET" onsubmit="return validate();">
        <td> name : <input type="text" id="name" name="name" placeholder="Your name"></td>
        <td> login : <input type="text" id="login" name="login" placeholder="Your login"></td>
        <td> email : <input type="text" id="email" name="email" placeholder="Your email"></td>
        <td> password : <input type="password" id="password" name="password"></td>
        <td> login : <input type="text" id="country" name="country" placeholder="Your country"></td>
        <td> email : <input type="text" id="city" name="city" placeholder="Your city"></td>
        <td> role : <label>
            <select name="role" id="role">
                <option value="viewer">viewer</option>
                <option value="admin">admin</option>
            </select>
        </label>
        </td>
    </form>
</table>
<br>
<button type="submit" class="create" form="create"> CreateNew</button>
</body>
</html>