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
    <form action="/CTSP/update" method="post" ><br>

        ID : <input type="text" class="form-control" name="id"  value="${ctsp.id}" readonly> <br>

        Tên Sản Phẩm :
        <select name="sanPham" class="form-select" aria-label="Default select example">
            <c:forEach items="${listSPham}" var="sanPham">
                <option name="" value="${sanPham.id}" ${ctsp.sanPham.id == sanPham.id ? "selected" : ""}>${sanPham.tenSanPham}</option>
            </c:forEach>
        </select>
        <br>
        Tên Màu :
        <select name="mauSac" class="form-select" aria-label="Default select example">
            <c:forEach items="${listMau}" var="mauSac">
                <option name="" value="${mauSac.id}" ${ctsp.mauSac.id == mauSac.id ? "selected" : ""}>${mauSac.tenMau}</option>
            </c:forEach>
        </select>
        <br>

        Tên Size :
        <select name="size" class="form-select" aria-label="Default select example">
            <c:forEach items="${listSize}" var="size">
                <option name="" value="${size.id}" ${ctsp.size.id == size.id ? "selected" : ""}>${size.tenSize}</option>
            </c:forEach>
        </select>

        <br>
        Gía bán : <input type="text" class="form-control" name="giaBan" value="${ctsp.giaBan}"><br>
        Số lượng : <input type="text" class="form-control" name="soLuongTon" value="${ctsp.soLuongTon}"><br>
        <br>

        <div class="mt-4 d-flex align-items-center">
            <label class="me-3"> Trạng thái </label>
            <div class="form-check mx-3">
                <input class="form-check-input" type="radio" name="trangThai" id="1" value="active" ${ctsp.trangThai == "active" ? "checked" : ""} checked>
                <label class="form-check-label" for="1">
                    active
                </label>
            </div>
            <div class="form-check mx-3">
                <input class="form-check-input" type="radio" name="trangThai" id="2" value="inactive" ${ctsp.trangThai == "inactive" ? "checked" : ""}>
                <label class="form-check-label" for="2">
                    inactive
                </label>
            </div>
        </div>
        <br>

        <button type="submit" class="btn btn-success">Update</button><br>

    </form>

</div>


</body>
</html>