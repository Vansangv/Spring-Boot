<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<%@ include file="../TrangChu/header.jsp" %>
<div class="container">

    <form action="/HDon/add" method="post" ><br>

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
        <button type="submit" class="btn btn-success">Add</button><br>
        <br>
    </form>



    <br>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th>STT</th>
<%--            <th>ID</th>--%>
            <th>Tên Khách hàng</th>
            <th>Trạng thái</th>
            <th>Ngày tạo</th>
            <th>Ngày Sửa</th>
            <th>Địa chỉ</th>
            <th>SĐT</th>
            <th>ACTYON</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${HDonlist}" var="hd" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
<%--                <td>${hd.id}</td>--%>
                <td>${hd.khachHang.hoTen}</td>
                <td>${hd.trangThai}</td>
                <td>${hd.ngayTao}</td>
                <td>${hd.ngaySua}</td>
                <td>${hd.diaChi}</td>
                <td>${hd.sdt}</td>
                <td>
                    <a onclick="return confirm('Bạn có mún xóa không ')" href="/HDon/delete?id=${hd.id}"><button class="btn btn-danger">xoa</button></a>
                    <a href="/HDon/detail/${hd.id}"><button class="btn btn-warning">update</button></a>
                </td>
            </tr>
        </c:forEach>

        </tbody>

    </table>


</div>



</body>
</html>