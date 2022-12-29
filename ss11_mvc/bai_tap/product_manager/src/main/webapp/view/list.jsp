<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/25/2022
  Time: 11:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<center>
    <h1>Product Management</h1>
    <h2>
        <a href="/products?action=create">Add New Product</a>
    </h2>
    <hr>
    <form action="/products" method="get">
        <input type="text" name="action" value="search" hidden>
        <input type="text" name="nameSearch" placeholder="nhập tên">
        <input type="text" name="priceSearch" placeholder="nhập giá">
        <select name="producerSearch">
            <option value="">---Chọn Nhà sản xuất---</option>
            <c:forEach var="product" items="${productList}">
                <option value="${product.producer}">${product.producer}</option>
            </c:forEach>
        </select>

        <button type="submit">Tìm kiếm</button>
    </form>
    <hr>
</center>
<div align="center">
    <table class="table table-striped">
        <tr>
            <th>PRODUCT ID</th>
            <th>PRODUCT NAME</th>
            <th>PRODUCT PRICE</th>
            <th>PRODUCT DESCRIBE</th>
            <th>PRODUCER</th>
        </tr>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td><c:out value="${product.id}"/></td>
                <td><c:out value="${product.name}"/></td>
                <td><c:out value="${product.price}"/></td>
                <td><c:out value="${product.describe}"/></td>
                <td><c:out value="${product.producer}"/></td>
                <td>
                    <a href="/products?action=edit&id=${product.id}">Edit</a>
                        <%--                    <a href="/products?action=delete&id=${product.id}">Delete</a>--%>
                    <button onclick="xoa('${product.id}','${product.name}')" type="button" class="btn btn-primary"
                            data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<!-- Button trigger modal -->
<!-- Modal -->
<form action="/products" method="get">
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có muốn xóa  <span id="nameDelete"></span> không ?
                    <input name="action" value="delete" hidden>
                    <input name="id" id="idDelete" hidden>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    function xoa(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idDelete").value = id;
    }
</script>
</html>