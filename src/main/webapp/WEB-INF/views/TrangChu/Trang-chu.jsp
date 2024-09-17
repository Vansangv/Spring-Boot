<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        body {
            margin-top: 20px;
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd5VnQ-hYbA2Y3TiSbe6lBnYEQ9Mm4LGeC5g&s');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: white;
        }

        .table th, .table td {
            vertical-align: middle;
            background-color: rgba(255, 255, 255, 0.8);
            color: black;
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            color: black;
        }
        h2 {
            color: white;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">

    <div class="row">


        <div class="col-lg-8">
            <form class="border border-3 border-primary p-3">
                <section>
                    <h2>Hóa đơn</h2>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">ID</th>
                            <th scope="col">Khách hàng</th>
                            <th scope="col">Ngày tạo</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${hd}" var="a" varStatus="i">
                            <tr>
                                <th scope="row">${i.index + 1}</th>
                                <td>${a.id}</td>
                                <td>${a.khachHang.hoTen}</td>
                                <td>${a.ngayTao}</td>
                                <td>
                                    <a href="/ban-hang/detail?idHoaDon=${a.id}" class="btn btn-primary">Chọn</a>
                                    <a href="/ban-hang/delete?idHoaDon=${a.id}" class="btn btn-danger">Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </section>

                <section class="mt-4">
                    <h2>Các sản phẩm đã chọn</h2>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>id hd</th>
                            <th>id sp</th>
                            <th>Sản phẩm</th>
                            <th>Số lượng mua</th>
                            <th>Giá bán</th>
                            <th>Tổng tiền</th>
                            <th>Hành động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listHDCT}" var="hdct" varStatus="i">
                            <tr>
                                <td>${i.index + 1}</td>
                                <td>${hdct.hoaDon.id}</td>
                                <td>${hdct.sanPhamChiTiet.id}</td>
                                <td>${hdct.sanPhamChiTiet.sanPham.tenSanPham} - ${hdct.sanPhamChiTiet.mauSac.tenMau} - ${hdct.sanPhamChiTiet.size.tenSize}</td>
                                <td>
                                    <form id="form-${hdct.id}" method="POST" action="/ban-hang/update-quantity" onsubmit="return updateQuantity(${hdct.id});">
                                        <input type="hidden" name="id" value="${hdct.id}">
                                        <input type="hidden" name="idHoaDon" value="${hdct.hoaDon.id}">
                                        <input type="number" name="soLuong" value="${hdct.soLuongMua}" min="1" class="form-control">
                                        <button type="submit" class="btn btn-primary mt-2">Cập Nhật</button>
                                    </form>
                                </td>
                                <td>${hdct.sanPhamChiTiet.giaBan}</td>
                                <td>${hdct.tongTien}</td>
                                <td>
                                    <a href="/ban-hang/edit?id=${hdct.id}&idHoaDon=${hdct.hoaDon.id}" class="btn btn-secondary">Sửa</a>
                                    <a href="/ban-hang/delete?id=${hdct.id}&idHoaDon=${hdct.hoaDon.id}" class="btn btn-danger">Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </section>

                <section class="mt-4">
                    <h2>Sản phẩm</h2>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">ID</th>
                            <th scope="col">Sản phẩm</th>
                            <th scope="col">Màu</th>
                            <th scope="col">Size</th>
                            <th scope="col">Giá</th>
                            <th scope="col">SL</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${ds}" var="a" varStatus="i">
                            <tr>
                                <th scope="row">${i.index + 1}</th>
                                <td>${a.id}</td>
                                <td>${a.sanPham.tenSanPham}</td>
                                <td>${a.mauSac.tenMau}</td>
                                <td>${a.size.tenSize}</td>
                                <td>${a.giaBan}</td>
                                <td>${a.soLuong}</td>
                                <td>
                                    <form method="POST" action="/ban-hang/addsp">
                                        <input type="hidden" name="idHoaDon" value="${param.idHoaDon}">
                                        <input type="hidden" name="idSanPhamCT" value="${a.id}">
                                        <input type="number" name="soLuong" value="1" min="1" class="form-control d-inline-block" style="width: 60px;">
                                        <button type="submit" class="btn btn-primary mt-2">Thêm</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </section>
            </form>
        </div>


        <div class="col-lg-4">
            <section class="form-container">
                <h2>Thêm Hóa Đơn</h2>
                <form id="addProductForm" method="POST" action="/ban-hang/addhd">
                    <div class="mb-3">
                        <label class="form-label">Khách hàng</label>
                        <select class="form-select" name="khachHang.id">
                            <c:forEach items="${kh}" var="a">
                                <option value="${a.id}">${a.hoTen}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Thêm Hóa đơn</button>
                </form>
            </section>

            <section class="form-container">
                <h2>Thông tin hóa đơn</h2>
                <form method="post" action="/ban-hang/update?idHoaDon=${hoaDon.id}&khachHangId=${hoaDon.khachHang.id}">
                    <input type="hidden" name="idHoaDon" value="${hoaDon.id}">

                    <div class="mb-3">
                        <label class="form-label">Hóa đơn ID</label>
                        <input type="text" class="form-control" value="${hoaDon.id}" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Khách hàng</label>
                        <input type="text" class="form-control" value="${hoaDon.khachHang.hoTen}" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tổng tiền</label>
                        <input type="text" class="form-control" value="${totalAmount}" id="tongTien" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tiền khách đưa</label>
                        <input type="text" class="form-control" id="tienKhachDua" oninput="calculateTienThua()">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tiền thừa</label>
                        <input type="text" class="form-control" id="tienThua" readonly >
                        <span></span>
                    </div>
                    <button >Thanh toán</button>

                </form>
            </section>
        </div>
    </div>

</div>


<script>
    function updateQuantity(id) {
        var form = document.getElementById('form-' + id);
        var formData = new FormData(form);

        fetch('/ban-hang/update-quantity', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (response.ok) {
                    location.reload(); // Reload the page to reflect the updated data
                } else {
                    alert('Failed to update quantity.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to update quantity.');
            });

        return false;
    }

    function calculateTienThua() {
        const tongTien = parseFloat(document.getElementById('tongTien').value);
        const tienKhachDua = parseFloat(document.getElementById('tienKhachDua').value);
        const tienThua = tienKhachDua - tongTien;
        if (tienThua<0) {
            document.getElementById('tienThua').value = "Tiền Thiếu:"+ Math.sqrt(tienThua*tienThua)+"$";
        }else if (tienThua>0) {
            document.getElementById('tienThua').value ="Tiền thừa:"+ tienThua+"$";

        }else {
            document.getElementById('tienThua').value = tienThua+"$";
        }

    }


</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
