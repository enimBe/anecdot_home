<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<header>
			<div class="header-left">
				<div class="header-logo-home">
					AnecDOT.
				</div>
				<div class="header-logo-page">
					timeline
				</div>
			</div>
			<div class="header-right">
				<div class="header-nav">
					<ul class="nav">
					  <li class="nav-item">
					    <a class="nav-link" href="/anecdot/timeline">Timeline</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/anecdot/calendar">Calendar</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/anecdot/gallery">Gallery</a>
					  </li>
					  <li class="nav-item dropdown">
					    <a class="nav-link" href="">Post</a>
						    <ul class="dropdown-menu">
						      <li><a class="dropdown-item" href="#">Action</a></li>
						      <li><a class="dropdown-item" href="#">Another action</a></li>
						      <li><a class="dropdown-item" href="#">Something else here</a></li>
						      <li><a class="dropdown-item" href="#">Separated link</a></li>
						    </ul>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="/anecdot/following">Following</a>
					  </li>
					</ul>
				</div>
				
				<div class="header-session">
					<c:if test="${not empty userName }">
						<div class="mr-4" style="line-height:100%">${userName }님 <a href="/anecdot/user/signout" style="color:gray">로그아웃</a> </div>
					</c:if>
				</div>
			</div>
		</header>