<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                <span class="breadcrumb-item active">Shopping Cart</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Cart Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
            <table class="table table-light table-borderless table-hover text-center mb-0">
                <thead class="thead-dark">
                <tr>
                    <th> </th>
                    <th>Products</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Remove</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                <c:forEach items="${listcart }" var="cart">
                    <tr>
                        <td> <input type="checkbox" name="chk" value="${cart.gundam.id }"></td>
                        <td class="align-middle"><img src="img/product-1.jpg" alt="" style="width: 50px;">${cart.gundam.name }</td>
                        <td class="align-middle">${cart.price } VND</td>
                        <td class="align-middle">
                            <div class="input-group quantity mx-auto" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-primary btn-minus" >
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" name="quantity" value="${cart.quantity }">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-primary btn-plus">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        </td>
                        <td class="align-middle"><a class="btn btn-sm btn-danger" href="/delete/${cart.id }"><i class="fa fa-times"></i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <button class="btn btn-primary offset-5" onclick="order()"> Đặt hàng </button>
    </div>
</div>
<!-- Cart End -->
