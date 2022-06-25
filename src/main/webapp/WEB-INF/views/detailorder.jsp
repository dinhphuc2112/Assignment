<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    <div class="row mt-4">
        <div class="col-8 d-flex justify-content-center">
            <form action="/back" method="get">
                <div class="card">
                    <h5 class="card-header">Details</h5>
                    <div class="card-body">
                        <table class="table table-hover m-0 p-0">
                            <thead>
                            <th>Mã sản phẩm</th>
                            <th>Tên người mua</th>
                            <th>Ngày mua</th>
                            <th>Giá sản phẩm</th>
                            <th>Số lượng</th>
                            </thead>
                            <tbody>
                            <c:forEach items="${listdetail }" var="order">
                                <tr>
                                    <td>${order.gundam.id }</td>
                                    <td>Hà Đình Phúc</td>
<%--                                    <td>${order.customer}</td>--%>
                                    <td><fmt:formatDate value="${order.order.createdDate }"
                                                        pattern="dd-MM-yyyy" /></td>
                                    <td><fmt:formatNumber pattern="###,### vnđ">${order.price }</fmt:formatNumber></td>
                                    <td>${order.quantity }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div>
<%--        <div class="col-4 offset-6 pt-2">--%>
<%--            <a href="/listorder" class="btn btn-primary">${orderid.total }</a>--%>
<%--        </div>--%>
    </div>
</div>