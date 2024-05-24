<%--
  Created by IntelliJ IDEA.
  User: arkim
  Date: 2024-05-22
  Time: 오후 5:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>List</title>
</head>
<body>
    <div class="container">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Title</th>
                <th scope="col">Writer</th>
                <th scope="col">Counts</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="list" >
                <tr onclick="location.href='/board/detail/${list.bno}'">
                    <th scope="row"><c:out value="${list.bno}" /></th>
                    <td><c:out value="${list.title}" /></td>
                    <td><c:out value="${list.user_id}" /></td>
                    <td><c:out value="${list.counts}" /></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="button_area">
            <button type="button" class="btn btn-light" onclick="location.href='/board/write'">작성</button>
        </div>
    </div>
</body>

<style>
    .container {
        margin-top:50px;
    }
    table {
        text-align: center;
        align-items: center;
    }
    tr {
        cursor: pointer;
    }
    .button_area {
        text-align: right;
    }
</style>
</html>
