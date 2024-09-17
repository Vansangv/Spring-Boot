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
<div class="container">
    <form action="/Sanpham/update" method="post" ><br>
        ID : <input type="text" class="form-control" name="id"  value="${sp.id}" readonly> <br>
        Mã sản phẩm : <input type="text" class="form-control" name="maSanPham" value="${sp.maSanPham}" > <br>
        Tên sản phẩm : <input type="text" class="form-control" name="tenSanPham" value="${sp.tenSanPham}"><br>

        <div class="mt-4 d-flex align-items-center">
            <label class="me-3"> Trạng thái </label>
            <div class="form-check mx-3">
                <input class="form-check-input" type="radio" name="trangThai" id="1" value="active" ${sp.trangThai == "active" ? "checked" : ""} checked>
                <label class="form-check-label" for="1">
                    active
                </label>
            </div>
            <div class="form-check mx-3">
                <input class="form-check-input" type="radio" name="trangThai" id="2" value="inactive" ${sp.trangThai == "inactive" ? "checked" : ""}>
                <label class="form-check-label" for="2">
                    inactive
                </label>
            </div>
        </div>
        Tên Danh Mục:
        <select name="danhMuc" class="form-select" aria-label="Default select example">
            <c:forEach items="${listDM}" var="danhMuc">
                <option name="" value="${danhMuc.id}" ${sp.danhMuc.id == danhMuc.id ? "selected" : ""}>${danhMuc.tenDanhMuc}</option>
            </c:forEach>
        </select>
        <br>
        <button type="submit" class="btn btn-success">Update</button><br>

    </form>

</div>
</body>
</html>