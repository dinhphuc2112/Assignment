<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Shop Gundam</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
<%--    <link href="/img/favicon.ico" rel="icon">--%>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet">

    <!-- Font Awesome -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css"
          rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/style.css" rel="stylesheet">
    <style type="text/css">
        a.disabled {
            pointer-events: none;
        }
    </style>
</head>

<body>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row bg-secondary py-1 px-xl-5">
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <div class="btn-group">
                    <c:choose>
                        <c:when test="${ !empty sessionScope.customer }">
                            <button type="button"
                                    class="btn btn-sm btn-light dropdown-toggle offset-6"
                                    data-toggle="dropdown">Welcome, ${ !empty sessionScope.customer.fullname }</button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <!-- 									<a class="dropdown-item" type="button" href="/login">Sign
                                    in</a> -->
                                <a class="dropdown-item" type="button" href="/logout">Logout
                                    up</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <button type="button"
                                    class="btn btn-sm btn-light dropdown-toggle offset-6"
                                    data-toggle="dropdown">Welcome</button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" type="button" href="/login">Sign
                                    in</a> <a class="dropdown-item" type="button" href="/registration">Sign
                                up</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="d-inline-flex align-items-center d-block d-lg-none">
                <a href="" class="btn px-0 ml-2"> <i
                        class="fas fa-heart text-dark"></i> <span
                        class="badge text-dark border border-dark rounded-circle"
                        style="padding-bottom: 2px;">0</span>
                </a> <a href="" class="btn px-0 ml-2"> <i
                    class="fas fa-shopping-cart text-dark"></i> <span
                    class="badge text-dark border border-dark rounded-circle"
                    style="padding-bottom: 2px;">${sl }</span>
            </a>
            </div>
        </div>
    </div>
    <div
            class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <img
                    src="https://gundamshop.vn/wp-content/uploads/2020/12/logo-234.jpg"
                    alt="" style="height: 100px; background-color: #FFFFFF">
        </div>
<%--        <div class="col-lg-4 col-6 text-left">--%>
<%--            <form action="/index" method="get">--%>
<%--                <div class="input-group">--%>
<%--                    <input type="text" class="form-control" name="name"--%>
<%--                           placeholder="Search for products">--%>
<%--                    <div class="input-group-append">--%>
<%--                        <button type="submit" class="btn btn-primary">--%>
<%--                            <i class="fa fa-search"></i>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
<%--        <div class="col-lg-3 d-none d-lg-block">--%>
<%--            <a--%>
<%--                    class="btn d-flex align-items-center justify-content-between bg-primary w-100"--%>
<%--                    data-toggle="collapse" href="#navbar-vertical"--%>
<%--                    style="height: 65px; padding: 0 30px;">--%>
<%--               --%>
<%--            </a>--%>

<%--        </div>--%>
        <div class="col-lg-11">
            <nav
                    class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none"> <span

                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse"
                        data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between"
                     id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/index" class="nav-item nav-link active">Home</a> <a
                            href="/listorder" class="nav-item nav-link">History</a> <a
                            href="/allgundam" class="nav-item nav-link">Product</a>
                        <a href="/cart" class="nav-item nav-link">Cart</a>
<%--                        <div class="nav-item dropdown">--%>
<%--                            <a href="#" class="nav-link dropdown-toggle"--%>
<%--                               data-toggle="dropdown">Pages <i--%>
<%--                                    class="fa fa-angle-down mt-1"></i></a>--%>
<%--                            <div class="dropdown-menu bg-primary rounded-0 border-0 m-0">--%>
<%--                                <a href="/cart" class="dropdown-item">Shopping Cart</a> <a--%>
<%--                                    href="checkout.jsp" class="dropdown-item">Checkout</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                    </div>
<%--                    <div class="navbar-nav ml-auto py-0 d-none d-lg-block">--%>
<%--                        <a href="" class="btn px-0 ml-3"> <i--%>
<%--                            class="fas fa-shopping-cart text-primary"></i> <span--%>
<%--                            class="badge text-secondary border border-secondary rounded-circle"--%>
<%--                            style="padding-bottom: 2px;">0</span>--%>
<%--                    </a>--%>
<%--                    </div>--%>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->
<!-- Featured Start -->

<!-- Featured End -->


<div>
    <jsp:include page="${ view }"></jsp:include>
</div>



<!-- Footer Start -->
<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <h5 class="text-secondary text-uppercase mb-4">Get In Touch</h5>
            <p class="mb-4">No dolore ipsum accusam no lorem. Invidunt sed
                clita kasd clita et et dolor sed dolor. Rebum tempor no vero est
                magna amet no</p>
            <p class="mb-2">
                <i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street,
                New York, USA
            </p>
            <p class="mb-2">
                <i class="fa fa-envelope text-primary mr-3"></i>info@example.com
            </p>
            <p class="mb-0">
                <i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890
            </p>
        </div>
        <div class="col-lg-8 col-md-12">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Quick Shop</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="#"><i
                                class="fa fa-angle-right mr-2"></i>Home</a> <a
                            class="text-secondary mb-2" href="#"><i
                            class="fa fa-angle-right mr-2"></i>Our Shop</a> <a
                            class="text-secondary mb-2" href="#"><i
                            class="fa fa-angle-right mr-2"></i>Shop Detail</a> <a
                            class="text-secondary mb-2" href="#"><i
                            class="fa fa-angle-right mr-2"></i>Shopping Cart</a> <a
                            class="text-secondary mb-2" href="#"><i
                            class="fa fa-angle-right mr-2"></i>Checkout</a> <a
                            class="text-secondary" href="#"><i
                            class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">My Account</h5>
                    <div class="d-flex flex-column justify-content-start">
                        <a class="text-secondary mb-2" href="#"><i
                                class="fa fa-angle-right mr-2"></i>Home</a> <a
                            class="text-secondary mb-2" href="#"><i
                            class="fa fa-angle-right mr-2"></i>Our Shop</a> <a
                            class="text-secondary mb-2" href="#"><i
                            class="fa fa-angle-right mr-2"></i>Shop Detail</a> <a
                            class="text-secondary mb-2" href="#"><i
                            class="fa fa-angle-right mr-2"></i>Shopping Cart</a> <a
                            class="text-secondary mb-2" href="#"><i
                            class="fa fa-angle-right mr-2"></i>Checkout</a> <a
                            class="text-secondary" href="#"><i
                            class="fa fa-angle-right mr-2"></i>Contact Us</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <h5 class="text-secondary text-uppercase mb-4">Newsletter</h5>
                    <p>Duo stet tempor ipsum sit amet magna ipsum tempor est</p>
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control"
                                   placeholder="Your Email Address">
                            <div class="input-group-append">
                                <button class="btn btn-primary">Sign Up</button>
                            </div>
                        </div>
                    </form>
                    <h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
                    <div class="d-flex">
                        <a class="btn btn-primary btn-square mr-2" href="#"><i
                                class="fab fa-twitter"></i></a> <a
                            class="btn btn-primary btn-square mr-2" href="#"><i
                            class="fab fa-facebook-f"></i></a> <a
                            class="btn btn-primary btn-square mr-2" href="#"><i
                            class="fab fa-linkedin-in"></i></a> <a
                            class="btn btn-primary btn-square" href="#"><i
                            class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row border-top mx-xl-5 py-4"
         style="border-color: rgba(256, 256, 256, .1) !important;">
        <div class="col-md-6 px-xl-0">
            <p class="mb-md-0 text-center text-md-left text-secondary">
                &copy; <a class="text-primary" href="#">Domain</a>. All Rights
                Reserved. Designed by <a class="text-primary"
                                         href="https://htmlcodex.com">HTML Codex</a>
            </p>
        </div>
        <div class="col-md-6 px-xl-0 text-center text-md-right">
<%--            <img class="img-fluid" src="img/payments.png" alt="">--%>
        </div>
    </div>
</div>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i
        class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/lib/easing/easing.min.js"></script>
<script src="/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="/mail/jqBootstrapValidation.min.js"></script>
<script src="/mail/contact.js"></script>
<!-- Template Javascript -->
<script src="/js/main.js"></script>
</body>

</html>