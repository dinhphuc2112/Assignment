<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container-fluid pt-5 pb-3">
    <div class="row">
        <div class="col-lg-4"></div>
    <div class="col-lg-4 col-6 text-left">
        <form action="/index" method="get">
            <div class="input-group">
                <input type="text" class="form-control" name="name"
                       placeholder="Search for products">
                <div class="input-group-append">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <div class="col-lg-4"></div>
    </div>
    </div>
    <h2
            class="section-title position-relative text-uppercase mx-xl-5 mb-4">
        <span class="bg-secondary pr-3">Recent Products</span>
    </h2>
    <div class="row px-xl-5">
        <c:forEach items="${listgundam }" var="gundam">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100 h-50" src="image/${gundam.photo}"
                             alt="">

                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href="">${gundam.name }</a>
                        <div
                                class="d-flex align-items-center justify-content-center mt-2">
                            <h5><fmt:formatNumber type="number" pattern="###,### VNĐ" value="${gundam.price}" /></h5>
                        </div>

                    </div>
                    <div class="text-center py-4">
                        <a class="btn btn-primary" href="/detail/${gundam.id }">Detail</a>
                    </div>
                </div>
            </div>
        </c:forEach>
<%--        <div class="col-12">--%>
<%--            <nav>--%>
<%--                <ul class="pagination justify-content-center">--%>
<%--                    <li class="page-item disabled"><a class="page-link" href="#">Previous</span></a></li>--%>
<%--                    <li class="page-item active"><a class="page-link" href="#">1</a></li>--%>
<%--                    <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                    <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                    <li class="page-item"><a class="page-link" href="#">Next</a></li>--%>
<%--                </ul>--%>
<%--            </nav>--%>
<%--        </div>--%>
    </div>
</div>