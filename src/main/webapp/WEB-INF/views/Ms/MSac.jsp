<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>
<div class="container">
    <%@ include file="../TrangChu/header.jsp" %>

    <form action="/MauSac/add" method="post" ><br>
        Mã : <input type="text" class="form-control" name="maMau" value="${ms.maMau}"> <br>
        Tên : <input type="text" class="form-control" name="tenMau" value="${ms.tenMau}"><br>
        <div class="mt-4 d-flex align-items-center">
            <label class="me-3"> Trạng thái </label>
            <div class="form-check mx-3">
                <input class="form-check-input" type="radio" name="trangThai" id="1" value="active" ${sm.trangThai == "active" ? "checked" : ""} checked>
                <label class="form-check-label" for="1">
                    active
                </label>
            </div>
            <div class="form-check mx-3">
                <input class="form-check-input" type="radio" name="trangThai" id="2" value="inactive" ${ms.trangThai == "inactive" ? "checked" : ""}>
                <label class="form-check-label" for="2">
                    inactive
                </label>
            </div>
        </div>
        <br>
        <button type="submit" class="btn btn-success">Add</button><br>
        <br>
    </form>


    <table class="table table-bordered table-hover" >
        <thead>
        <tr>
            <th>STT</th>
<%--            <th>ID</th>--%>
            <th>Mã Màu</th>
            <th>Tên Màu</th>
            <th>Trạng thái</th>
            <th>Ngày tạo</th>
            <th>Ngày Sửa</th>

            <th>ACTYON</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listMSac}" var="ms" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
<%--                <td>${ms.id}</td>--%>
                <td>${ms.maMau}</td>
                <td>${ms.tenMau}</td>
                <td>${ms.trangThai}</td>
                <td>${ms.ngayTao}</td>
                <td>${ms.ngaySua}</td>
                <td>
                    <a onclick="return confirm('Bạn có mún xóa không ')" href="/MauSac/delete?id=${ms.id}"><button class="btn btn-danger">Xóa</button></a>
                    <a href="/MauSac/detail/${ms.id}"><button class="btn btn-warning">update</button></a>
                </td>
            </tr>
        </c:forEach>

        </tbody>

    </table>

</div>
</body>
</html>