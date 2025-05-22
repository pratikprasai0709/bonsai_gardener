<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css" />
</head>
<body>
    <div class="header">
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="${pageContext.request.contextPath}/images/bg.png" alt="Bonsai" width="70px">
                </div>
                
                <form action="${pageContext.request.contextPath}/search" method="get" style="display: flex; align-items: center; margin-left: 20px;">
    <input type="text" name="query" placeholder="Search products..." 
           style="padding: 5px 10px; border-radius: 5px; border: 1px solid #ccc;"/>
    <button type="submit" 
            style="margin-left: 5px; padding: 5px 10px; background-color: #28a745; color: white; border: none; border-radius: 5px;">
        Search
    </button>
</form>
                <nav>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/product">Product</a></li>
                        <li><a href="${pageContext.request.contextPath}/AboutUs">About us</a></li>
                        <li><a href="${pageContext.request.contextPath}/register">Contact us</a></li>
                        <c:if test="${empty sessionScope.user_id}">
                        	<li><a href="${pageContext.request.contextPath}/register">Account</a></li>
                        </c:if>
                    </ul>
                </nav>
                
                <!-- Existing cart icon -->
                <a href ="${pageContext.request.contextPath}/viewCart">
				<img src="${pageContext.request.contextPath}/images/shopping-cart.png" alt="Cart" width="30px" height="30px" style="margin-right: 15px;">
				</a>
				
				<!-- Show profile icon only if user_id exists in session -->
				<c:if test="${not empty sessionScope.user_id}">
				    <a href ="${pageContext.request.contextPath}/userprofile">
				        <img src="${pageContext.request.contextPath}/images/usericon.png" alt="User" width="30px" height="30px">
				    </a>
				</c:if>
            </div>
        </div>
    </div>
</body>
</html>
