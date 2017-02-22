
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

						<%-- 	<li>
								<a href="shequ" class="dropdown-toggle" target="mainFrame">
									<i class="${bar.menu.icon}"></i>
									<span class="menu-text">${bar.menu.menuname}</span>
									<b class="arrow icon-angle-down"></b>
								</a>
								
								<ul class="submenu">
									<c:forEach items="${bar.childMenu}" var="child">
									<li>
										<a href="${child.href}" target="mainFrame">
											<i class="icon-double-angle-right"></i>
											${child.menuname}
										</a>
									</li>
									</c:forEach>
								</ul>
							</li> --%>




<c:forEach items="${menuList}" var="menu">
	<li>
		<%-- <c:if test="${empty menu.children }">
			<a href="${menu.href}" target="mainFrame">
					<i class="icon-double-angle-right"></i>
						${menu.menuname}
			</a>
		</c:if> --%>
		<a href=${not empty menu.icon ? '#' : menu.href}  class="dropdown-toggle" target="mainFrame">
			<i class="${not empty menu.children ? menu.icon : 'icon-double-angle-right'}"></i>
			<span class="menu-text">${menu.menuname}</span>
			<c:if test="${not empty menu.children}"><b class="arrow icon-angle-down"></b></c:if>
		</a>
		<c:if test="${not empty menu.children}">
			<ul class="submenu">
				<li>
					<c:set var="menuList" value="${menu.children}" scope="request" />
					<jsp:include page="recursive.jsp" />
				</li>
									
			</ul>

		</c:if>
		
	</li>
</c:forEach>
