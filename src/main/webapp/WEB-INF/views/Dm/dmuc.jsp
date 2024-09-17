<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
<%@ include file="../TrangChu/header.jsp" %>
<div class="container">

    <form action="/DMuc/add" method="post" ><br>
        Mã : <input type="text" class="form-control" name="maDanhMuc" value="${dm.maDanhMuc}"> <br>
        Tên : <input type="text" class="form-control" name="tenDanhMuc" value="${dm.tenDanhMuc}"><br>
        <div class="mt-4 d-flex align-items-center">
            <label class="me-3"> Trạng thái </label>
            <div class="form-check mx-3">
                <input class="form-check-input" type="radio" name="trangThai" id="1" value="active" ${dm.trangThai == "active" ? "checked" : ""} checked>
                <label class="form-check-label" for="1">
                    active
                </label>
            </div>
            <div class="form-check mx-3">
                <input class="form-check-input" type="radio" name="trangThai" id="2" value="inactive" ${dm.trangThai == "inactive" ? "checked" : ""}>
                <label class="form-check-label" for="2">
                    inactive
                </label>
            </div>
        </div>
        <br>
        <button type="submit" class="btn btn-success">Add</button><br>
        <br>
    </form>

    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th>STT</th>
            <th>ID</th>
            <th>Mã danh muc</th>
            <th>Tên danh muc</th>
            <th>Trạng thái</th>
            <th>Ngày tạo</th>
            <th>Ngày Sửa</th>
            <th>ACTYON</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${DMuclist}" var="dm" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${dm.id}</td>
                <td>${dm.maDanhMuc}</td>
                <td>${dm.tenDanhMuc}</td>
                <td>${dm.trangThai}</td>
                <td>${dm.ngayTao}</td>
                <td>${dm.ngaySua}</td>
                <td>
                    <a onclick="return confirm('Bạn có mún xóa không ')" href="/DMuc/delete?id=${dm.id}"><button class="btn btn-danger">Xóa</button></a>
                    <a href="/DMuc/detail/${dm.id}"><button class="btn btn-warning">update</button></a>
                </td>
            </tr>
        </c:forEach>

        </tbody>

    </table>



</div>

</body>
</html>