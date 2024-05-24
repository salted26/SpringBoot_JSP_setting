<%--
  Created by IntelliJ IDEA.
  User: arkim
  Date: 2024-05-22
  Time: 오후 5:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Write</title>
</head>
<body>
<div class="container">
    <form class="row g-3" action="/board/write" method="post">
        <div class="col-md-2">
            <label for="board_type" class="form-label">CATEGORY</label>
        </div>
        <div class="col-md-4">
            <select id="board_type" class="form-select" name="board_type">
                <option selected>Choose...</option>
                <option value="1">Notice</option>
                <option value="2">Diary</option>
                <option value="3">Memo</option>
            </select>
        </div>
        <div class="col-md-2">
            <label for="writer" class="form-label">WRITER</label>
        </div>
        <div class="col-md-4">
            <input type="text" class="form-control" id="writer" name="user_id" value="${board.user_id}">
        </div>
        <div class="col-md-2">
            <label for="title" class="form-label">TITLE</label>
        </div>
        <div class="col-md-10">
            <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요." name="title" value="${board.title}">
        </div>
        <div class="col-md-2">
            <label for="content" class="form-label">CONTENT</label>
        </div>
        <div class="col-md-10">
            <textarea type="text" class="form-control" id="content"
                      placeholder="내용을 입력해주세요." name="content" rows="5"><c:out value="${board.content}" /></textarea>
        </div>

        <div class="button_area">
            <button type="submit" class="btn btn-outline-success">등록</button>
        </div>
    </form>

</div>
</body>
<style>
    .container {
        margin-top:50px;
    }
    form > div{
        text-align: center;
    }
    .button_area {
        text-align: right;
    }
</style>
</html>