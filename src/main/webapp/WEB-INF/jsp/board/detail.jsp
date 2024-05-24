<%--
  Created by IntelliJ IDEA.
  User: arkim
  Date: 2024-05-22
  Time: 오후 5:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/common.css">
    <title>Detail</title>
</head>
<body>
<jsp:include page="../module/header.jsp" />
<div class="wrapper">
    <form class="row g-3" >
        <input type="hidden" value="<c:out value='${board.bno}' />" name="bno" />
        <div class="col-md-2">
            <label for="board_type" class="form-label">CATEGORY</label>
        </div>
        <div class="col-md-4">
            <span id="board_type" class="detail_value"><c:out value="${board.board_type}" /></span>
        </div>
        <div class="col-md-2">
            <label for="writer" class="form-label">WRITER</label>
        </div>
        <div class="col-md-4">
            <span id="writer" class="detail_value"><c:out value="${board.user_id}" /></span>
        </div>
        <div class="col-md-2">
            <label for="title" class="form-label">TITLE</label>
        </div>
        <div class="col-md-10">
            <span id="title" class="detail_value"><c:out value="${board.title}" /></span>
        </div>
        <div class="col-md-2">
            <label for="content" class="form-label">CONTENT</label>
        </div>
        <div class="col-md-10">
            <textarea type="text" class="form-control" id="content" readonly
                      placeholder="내용을 입력해주세요." name="content" rows="8"><c:out value="${board.content}" />
            </textarea>
        </div>
        <div class="col-md-2">
            <label for="file" class="form-label">FILE</label>
        </div>
        <div class="col-md-10">
            <span id="file" class="detail_value"><a href="D:/Dev/workspaces/board_ver.jsp/src/main/images/${board.file_name}" class="link"><c:out value="${board.file_name}" /></a></span>
        </div>
        <div class="button_area">
            <button type="button" class="btn btn-light" onclick="location.href='/board/modify/${board.bno}'">수정</button>
            <button type="button" class="btn btn-light" onclick="location.href='/board'">목록</button>
            <button type="button" class="btn btn-light" onclick="location.href='/board/delete/${board.bno}'">삭제</button>
        </div>
    </form>
</div>
</body>
<style>
    .wrapper {
        margin-top:50px;
    }
    form > div{
        text-align: center;
    }
    .detail_value{
        display: flex;
    }
    .button_area {
        text-align: right;
    }
    #content {
        border: none;
    }
    #content:focus {
        box-shadow: none !important;
    }
</style>
</html>
