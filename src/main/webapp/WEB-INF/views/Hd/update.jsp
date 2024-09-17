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

    <form action="/HDon/update" method="post" ><br>

        ID : <input type="text" class="form-control" name="id"  value="${hd.id}" readonly> <br>

        Tên Khách hàng :
        <select name="khachHang" class="form-select" aria-label="Default select example">
            <c:forEach items="${listKHang}" var="khachHang">
                <option name="" value="${khachHang.id}" ${hd.khachHang.id == khachHang.id ? "selected" : ""}>${khachHang.hoTen}</option>
            </c:forEach>
        </select>

        <div class="mt-4 d-flex align-items-center">
            <label class="me-3"> Trạng thái </label>
            <div class="form-check mx-3">
                <input class="form-check-input" type="radio" name="trangThai" id="1" value="active" ${hd.trangThai == "active" ? "checked" : ""} checked>
                <label class="form-check-label" for="1">
                    active
                </label>
            </div>
            <div class="form-check mx-3">
                <input class="form-check-input" type="radio" name="trangThai" id="2" value="inactive" ${hd.trangThai == "inactive" ? "checked" : ""}>
                <label class="form-check-label" for="2">
                    inactive
                </label>
            </div>
        </div>
        <br>
        Địa chỉ : <input type="text" class="form-control" name="diaChi" value="${hd.diaChi}"><br>
        SĐT : <input type="text" class="form-control" name="sdt" value="${hd.sdt}"><br>
        <br>
        <button type="submit" class="btn btn-success">Update</button><br>

    </form>
</div>
</body>
</html>