<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container">
    <form action="/gundam/deleteList" method="get">
        <div class="card">
            <div class="card-body">
                <table class="table table-hover m-0 p-0">
                    <thead>
                    <th>ID</th>
                    <th>Address</th>
                    <th>CreatedDate</th>
                    <th>Total</th>
                    <th colspan="3">Activity</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${listorder }" var="order">
                        <tr>
                            <td>${order.id }</td>
                            <td>${order.address }</td>
                            <td><fmt:formatDate value="${order.createdDate }"
                                                pattern="dd-MM-yyyy" /></td>
                            <td><fmt:formatNumber pattern="###,### vnđ">${order.total }</fmt:formatNumber></td>
                            <c:if test="${order.trangThai==0 }">
                                <td><a class="btn btn-danger" href="/cancle/${order.id }">Hủy
                                    Đơn</a></td>
                                <td><a class="btn btn-primary" href="/accept/${order.id }">Xác
                                    nhận</a></td>
                            </c:if>
                            <c:if test="${order.trangThai==1 }">
                                <td>Đã Hủy Đơnx
                            </c:if>
                            <c:if test="${order.trangThai==2 }">
                                <td>Đã Xác Nhận</td>
                            </c:if>
                            <td><a class="btn btn-success"
                                   href="/listorderdetail/${order.id }">Xem chi tiết</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center">
                    <a class="btn btn-primary mr-1 ${currentPage==0?'disabled':'' }"
                       href="/listorder?page=0"> <span class="fas fa-backward"></span>
                    </a> <a class="btn btn-primary mr-1 ${currentPage==0?'disabled':'' }"
                            href="/listorder?page=${currentPage-1 }"> <span
                        class="fas fa-backward-step"><</span>
                </a>
                    <h3>${currentPage+1 }/${maxPage }</h3>
                    <a
                            class="btn btn-primary mr-1 ${currentPage==maxPage-1?'disabled':'' }"
                            href="/listorder?page=${currentPage+1 }"> <span
                            class="fas fa-forward-step">></span>
                    </a> <a
                        class="btn btn-primary ${currentPage==maxPage-1?'disabled':'' }"
                        href="/listorder?page=${maxPage-1 }"> <span
                        class="fas fa-forward"></span>
                </a>
                </div>
            </div>
        </div>
    </form>
</div>

