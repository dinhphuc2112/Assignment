<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
    <div class="row mt-4">
        <div class="col-8 d-flex justify-content-center">
            <form action="/gundam/update?id=${gundam.id }" method="post">
                <div class="card">
                    <h5 class="card-header">Update</h5>
                    <div class="card-body">
                        <div class="mt-2">
                            <label>Name</label> <input type="text" name="name"
                                                       class="form-control" value="${gundam.name }" required="required">
                        </div>
                        <div class="mt-2">
                            <div class="row">
                                <div class="col-6">
                                    <label>Type</label> <select class="form-control" name="type">
                                    <c:forEach items="${type }" var="t">
                                        <option value="${t }" ${t==gundam.type?'selected':'' }>${t }</option>
                                    </c:forEach>
                                </select>
                                </div>
                                <div class="col-6">
                                    <label>Photo</label> <input type="text" name="photo"
                                                                class="form-control" required="required" value="${gundam.photo }">
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Origin</label> <input type="text" name="origin"
                                                                   class="form-control" required="required" value="${gundam.origin}">
                                </div>
                                <div class="col-6">
                                    <label>Ratio</label> <input type="text" name="ratio"
                                                                 class="form-control" required="required" value="${gundam.ratio }">
                                </div>
                            </div>
                        </div>
                        <div class="mt-2">
                            <div class="row">
                                <div class="col-6">
                                    <label>Quantity</label> <input type="number" name="quantity"
                                                                   class="form-control" value="${gundam.quantity }" min="0">
                                </div>
                                <div class="col-6">
                                    <label>Price</label>
                                    <div class="input-group">
                                        <input type="number" name="price" min="0"
                                               class="form-control" value="${gundam.price }"> <span
                                            class="input-group-text">vnđ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div>
                        <button class="btn btn-success">Update</button>
                        <button type="reset" class="btn btn-secondary">Reset</button>

                    </div>
                </div>
            </form>
        </div>
    </div>
</div>