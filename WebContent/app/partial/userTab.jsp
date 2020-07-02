<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- TAB start-->
<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">

	<div class="mdl-tabs__tab-bar">
		<a href="#Coupon" class="mdl-tabs__tab is-active">Coupon</a> <a
			href="#Comments" class="mdl-tabs__tab">Comments</a> <a
			href="#History" class="mdl-tabs__tab">History</a> <a href="#Favorite"
			class="mdl-tabs__tab">Favorite</a>
	</div>

	<div class="mdl-tabs__panel is-active" id="Coupon">
		<ul class="demo-list-icon mdl-list">
			<li class="mdl-list__item"><a href=""> <span
					class="mdl-list__item-primary-content"> <i
						class="material-icons mdl-list__item-icon">request_quote</i>
						Coupon1
				</span>
			</a> <span class="mdl-list__item-secondary-content"> <!-- Right aligned menu below button -->
					<button id="coupon-lower-right"
						class="mdl-button mdl-js-button mdl-button--icon">
						<i class="material-icons">more_vert</i>
					</button>

					<ul
						class="mdl-menu mdl-menu--top-right mdl-js-menu mdl-js-ripple-effect"
						for="coupon-lower-right">
						<li class="mdl-menu__item"><a href="">use</a></li>
						<li class="mdl-menu__item"><a href="">cancle</a></li>
					</ul>
			</span></li>

		</ul>
	</div>
	<div class="mdl-tabs__panel" id="Comments">
		<ul class="demo-list-three mdl-list">
			<li class="mdl-list__item mdl-list__item--three-line"><span
				class="mdl-list__item-primary-content"> <a href=""> <i
						class="material-icons mdl-list__item-avatar">person</i> <span>qqwwwee</span>
						<span class="mdl-list__item-text-body"> Bryan Cranston
							played the role of Walter in Breaking Bad. He is also known for
							playing Hal in Malcom in the Middle. </span>
				</a>
			</span> <span class="mdl-list__item-secondary-content"> <!-- Right aligned menu below button -->
					<button id="comment-lower-right"
						class="mdl-button mdl-js-button mdl-button--icon">
						<i class="material-icons">more_vert</i>
					</button>

					<ul
						class="mdl-menu mdl-menu--top-right mdl-js-menu mdl-js-ripple-effect"
						for="comment-lower-right">
						<li class="mdl-menu__item"><a href="">delete</a></li>
						<li class="mdl-menu__item"><a href="">edit</a></li>
					</ul>
			</span></li>
		</ul>
	</div>
	<div class="mdl-tabs__panel" id="History">
		<ul class="demo-list-icon mdl-list">
			<li class="mdl-list__item"><a href=""> <span
					class="mdl-list__item-primary-content"> <i
						class="material-icons mdl-list__item-icon">request_quote</i> Test
						Coupon1
				</span>
			</a></li>
			<li class="mdl-list__item"><a href=""> <span
					class="mdl-list__item-primary-content"> <i
						class="material-icons mdl-list__item-icon">request_quote</i> Test
						Coupon2
				</span>
			</a></li>
			<li class="mdl-list__item"><a href=""> <span
					class="mdl-list__item-primary-content"> <i
						class="material-icons mdl-list__item-icon">request_quote</i> Test
						Coupon3
				</span>
			</a></li>
		</ul>
	</div>
	<div class="mdl-tabs__panel" id="Favorite">
		<ul class="demo-list-icon mdl-list">
			<li class="mdl-list__item"><a href=""> <span
					class="mdl-list__item-primary-content"> <i
						class="material-icons mdl-list__item-icon">request_quote</i>
						Coupon1
				</span>
			</a> <span class="mdl-list__item-secondary-content"> <!-- Right aligned menu below button -->
					<button id="favorite-lower-right"
						class="mdl-button mdl-js-button mdl-button--icon">
						<i class="material-icons">star</i>
					</button>

					<ul
						class="mdl-menu mdl-menu--top-right mdl-js-menu mdl-js-ripple-effect"
						for="favorite-lower-right">
						<li class="mdl-menu__item"><a href="">cancle</a></li>
					</ul>
			</span></li>
		</ul>
	</div>
</div>
<script defer src="${pageContext.request.contextPath}/assets/js/lib/material.min.js"></script>
<!-- TAB End-->