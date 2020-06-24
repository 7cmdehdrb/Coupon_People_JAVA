<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="flex justify-between h-24 py-4">
    <div class="flex-1">.</div>
    <div class="flex-1">
        <a href="${pageContext.request.contextPath}/app/core/index.jsp"><img src="${pageContext.request.contextPath}/app/static/img/logo.png" class="mx-auto" style="cursor: pointer;" width="96px" /></a>
    </div>
    <div class="flex-1 flex items-start justify-end mr-5">
        <a href="#">
        	<div style="cursor: pointer;" class="text-center inline-block mx-2 hover:text-gray-700">쿠폰보기</div>
        </a>
        <span onclick="openSearchField()">
        	<div style="cursor: pointer;" class="text-center inline-block mx-2 hover:text-gray-700"><i class="fas fa-search"></i> 검색하기</div>
        </span>
		<c:choose>
			<c:when test="${email eq null}">
	            <a href="${pageContext.request.contextPath}/app/users/signup.jsp"><div style="cursor: pointer;" class="text-center inline-block mx-2 hover:text-gray-700">회원가입</div></a>
	            <a href="${pageContext.request.contextPath}/app/users/login.jsp"><div style="cursor: pointer;" class="text-center inline-block mx-2 hover:text-gray-700">로그인</div></a>			
			</c:when>
			<c:otherwise>
		        <a href="#"><div style="cursor: pointer;" class="text-center inline-block mx-2 hover:text-gray-700">${nickname} 님</div></a>
		        <a href="${pageContext.request.contextPath}/users/logoutOkAction.us"><div style="cursor: pointer;" class="text-center inline-block mx-2 hover:text-gray-700">로그아웃</div></a>			
			</c:otherwise>
		</c:choose>
    </div>
</div>

<div id="searchField" style="display: none;" class="w-1/2 h-32 mx-auto">
    <form class="flex justify-center items-center h-32" action="#" method="get">
        <input name="search" type="text" class="object-center w-7/12 h-16 text-3xl text-center border-b-8 border-gray-300" style="outline: none; background-color: #f9f9f9;" />
        <button><i class="fas fa-search ml-5 text-3xl"></i></button>
    </form>
</div>

<script src="${pageContext.request.contextPath}/app/static/js/nav.js"></script>