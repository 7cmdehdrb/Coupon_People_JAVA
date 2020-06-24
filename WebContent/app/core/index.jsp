<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../partial/head.jsp"%>
<jsp:useBean id="userDAO" class="com.couponPeople.app.user.dao.UserDAO"></jsp:useBean>
</head>
<body>
	<%@ include file="../partial/nav.jsp"%>

	<div class="container mx-auto py-5">
		<ul class="flex items-center">
			<li class="flex-1"><i
				style="transform: rotate(-90deg); position: relative;"
				class="fas fa-arrow-up text-4xl mx-2" onclick="updatePhoto(-1)"></i>
			</li>
			<li><img style="display: none;"
				class="mx-auto slider_img rounded-lg"
				src="https://images.unsplash.com/photo-1542992015-4a0b729b1385?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1367&q=80"
				alt="" srcset="" /></li>
			<li><img style="display: none;"
				class="mx-auto slider_img rounded-lg"
				src="https://images.unsplash.com/photo-1534951009808-766178b47a4f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
				alt="" srcset="" /></li>
			<li><img style="display: none;"
				class="mx-auto slider_img rounded-lg"
				src="https://images.unsplash.com/photo-1521791136064-7986c2920216?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
				alt="" srcset="" /></li>
			<li><img style="display: none;"
				class="mx-auto slider_img rounded-lg"
				src="https://images.unsplash.com/photo-1559526324-593bc073d938?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
				alt="" srcset="" /></li>
			<li class="flex-1"><i style="transform: rotate(90deg);"
				class="fas fa-arrow-up text-4xl mx-2" onclick="updatePhoto(1)"></i>
			</li>
		</ul>
	</div>

	<script src="${pageContext.request.contextPath}/app/static/js/slider.js"></script>

	<div class="container mx-auto py-5">
		<p class="text-4xl ml-20">카테고리로 쿠폰을 찾아보세요!</p>
		<div class="flex text-center py-10">
			<a href="#" class="catagory_selector flex-1 mx-2 py-6"
				style="border: solid black 5px; border-radius: 20px; cursor: pointer;">
				<i class="fas fa-utensils block text-6xl"></i> <span
				class="block text-xl font-bold">식사</span>
			</a> <a href="#" class="catagory_selector flex-1 mx-2 py-6"
				style="border: solid black 5px; border-radius: 20px; cursor: pointer;">
				<i class="fas fa-ice-cream block text-6xl"></i> <span
				class="block text-xl font-bold">디저트</span>
			</a> <a href="#" class="catagory_selector flex-1 mx-2 py-6"
				style="border: solid black 5px; border-radius: 20px; cursor: pointer;">
				<i class="fas fa-shopping-cart block text-6xl"></i> <span
				class="block text-xl font-bold">편의점/마트</span>
			</a> <a href="#" class="catagory_selector flex-1 mx-2 py-6"
				style="border: solid black 5px; border-radius: 20px; cursor: pointer;">
				<i class="fas fa-ticket-alt block text-6xl"></i> <span
				class="block text-xl font-bold">상품권</span>
			</a> <a href="#" class="catagory_selector flex-1 mx-2 py-6"
				style="border: solid black 5px; border-radius: 20px; cursor: pointer;">
				<i class="fas fa-video block text-6xl"></i> <span
				class="block text-xl font-bold">영화/공연</span>
			</a> <a href="#" class="catagory_selector flex-1 mx-2 py-6"
				style="border: solid black 5px; border-radius: 20px; cursor: pointer;">
				<i class="fas fa-prescription-bottle-alt block text-6xl"></i> <span
				class="block text-xl font-bold">뷰티</span>
			</a>
		</div>
	</div>

	<div class="container mx-auto py-5">
		<p class="text-4xl ml-20">쿠폰의 민족에서 필요한 쿠폰을 찾으세요!</p>
		<div class="flex text-center my-10 py-10"
			style="border: 10px #b4b4b4 solid;">
			<div class="flex-1">
				<p class="text-4xl">전체 회원수</p>
				<p class="text-2xl"><%= userDAO.getTotalUser() %>명</p>
			</div>
			<div class="flex-1">
				<p class="text-4xl">등록된 쿠폰수</p>
				<p class="text-2xl">0개</p>
			</div>
			<div class="flex-1">
				<p class="text-4xl">총 거래량</p>
				<p class="text-2xl">0건</p>
			</div>
		</div>
	</div>

	<%@ include file="../partial/footer.jsp"%>
</body>
</html>