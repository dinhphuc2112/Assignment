<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container">
    <form action="/gundam/deleteList" method="get">
        <div class="card">
            <div class="card-header">
                <div class="row d-flex justify-content-between">
                    <div class="col-3 fs-5">Manage gundam</div>
                    <div class="col-2">
                        <a class="btn btn-success ml-5" href="/gundam/add">Add</a>
                        <!-- Modal -->
                        <div class="modal fade" id="delete" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">Are you sure that you want to
                                        delete all clothes are choosed?</div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-danger">Yes</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-hover m-0 p-0">
                    <thead>
                    <th>Name</th>
                    <th>Created Date</th>
                    <th>Type</th>
                    <th>Photo</th>
                    <th>Origin</th>
                    <th>Ratio</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th colspan="2">Activity</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${listgundam }" var="gundam">
                        <tr>
                            <td>${gundam.name }</td>
                            <td><fmt:formatDate value="${gundam.createdDate }"
                                                pattern="dd-MM-yyyy" /></td>
                            <td>${gundam.type }</td>
                            <td>${gundam.photo }</td>
                            <td>${gundam.origin }</td>
                            <td>${gundam.ratio }</td>
                            <td>${gundam.quantity }</td>
                            <td><fmt:formatNumber pattern="###,### vnđ">${gundam.price }</fmt:formatNumber></td>
                            <td><a class="btn btn-warning"
                                   href="/gundam/edit?id=${gundam.id }">Update
                            </a></td>
                            <td>
                                <!-- Button trigger modal -->
                                <a class="btn btn-danger"
                                   data-toggle="modal" data-target="#exampleModal${gundam.id }">Delete</a>
                                <div class="modal fade" id="exampleModal${gundam.id }"
                                     tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Warning</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">Are you sure that you want to
                                                delete this?</div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Close</button>
                                                <a class="btn btn-danger"
                                                   href="/gundam/delete?id=${gundam.id }"> Yes </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center">
                    <a class="btn btn-primary me-1 ${currentPage==0?'disabled':'' }" href="/allgundam?page=0"
                    > <span
                            class="fas fa-backward"></span>
                    </a> <a class="btn btn-primary me-1 ${currentPage==0?'disabled':'' }" href="/allgundam?page=${currentPage-1 }"
                > < <span
                        class="fas fa-backward-step"></span>
                </a>
                    <h3>${currentPage+1 }/${maxPage }</h3>
                    <a class="btn btn-primary me-1 ${currentPage==maxPage-1?'disabled':'' }" href="/allgundam?page=${currentPage+1 }"
                    > > <span
                            class="fas fa-forward-step"></span>
                    </a> <a class="btn btn-primary ${currentPage==maxPage-1?'disabled':'' }" href="/allgundam?page=${maxPage-1 }"
                > <span
                        class="fas fa-forward"></span>
                </a>
                </div>
            </div>
        </div>
    </form>
</div>

