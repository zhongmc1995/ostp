<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" 
	import="com.ibcio.WebSocketMessageServlet" 
	import="com.peace.ostp.security.UserInfo"
	import= "org.springframework.security.core.context.SecurityContextHolder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String name = (String)session.getAttribute("user");
	if(name == null){
		//为用户生成昵称
		name = userInfo.getUsername();
		session.setAttribute("user", name);
	}
%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		
		<title>后台首页</title>
		<base href="<%=basePath%>">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<!-- websocket
		<link rel="stylesheet" type="text/css"  href="resources/ext4/resources/css/ext-all.css">
		<link rel="stylesheet" type="text/css"  href="resources/css/mycss/websocket.css" />
		 -->
		<!-- 映入Ext的JS开发包，及自己实现的webscoket. 
		<script type="text/javascript" src="resources/ext4/ext-all-debug.js"></script>
		<script type="text/javascript" src="resources/js/myjs/websocket.js"></script>
		-->
		<script type="text/javascript">
			var user = "${userInfo.userName}";
		</script>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="resources/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

		<!-- ace styles -->

		<link rel="stylesheet" href="resources/assets/css/ace.min.css" />
		<link rel="stylesheet" href="resources/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="resources/assets/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="resources/css/ostp.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="resources/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="resources/assets/js/ace-extra.min.js"></script>
		

		<link type="text/css" href="resources/assets/css/jquery-ui.css" rel="stylesheet" />

	  
	
	     <script src="resources/assets/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="resources/assets/js/jquery-ui.min.js"></script>
	   
	
	    
	  
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="resources/assets/js/html5shiv.js"></script>
		<script src="resources/assets/js/respond.min.js"></script>
		<![endif]-->
	</head>
	
	<body>
		
		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							OSTP后台管理系统
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
				
				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
					
						<li class="light-blue">
						
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="resources/assets/avatars/user.jpg" alt="Jason's Photo" />
								
								<span class="user-info">
									<small style="font-size: 60%;">欢迎回来</small>
									${userInfo.userName}
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a style="cursor:pointer;" id="modifyPwd" >
										<i class="icon-cog"></i>
										密码修改
									</a>
								</li>

								<li>
									<a style="cursor:pointer;" id="editUser">
										<i class="icon-user"></i>
										个人资料
										
									</a>
								</li>
								
								<li>
									<a onclick="Websocket()" style="cursor:pointer;">
										<i class="icon-user"></i>
										websocket
									</a>
								</li>
								<li>
									<a style="cursor:pointer;" id="modifyPwd" >
										<i class="icon-cog"></i>
										密码修改
									</a>
								</li>
								<li class="divider"></li>

								<li>
									<a href="j_spring_security_logout">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
					
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
				
			</div><!-- /.container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					<ul class="nav nav-list">
						<li class="active">
							<a href="wc" target="mainFrame">
								<i class="icon-desktop"></i>
								<span class="menu-text"> 后台首页 </span>
							</a>
						</li>
						<jsp:include page="recursive.jsp" />
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>
				<div class="right-iframe">
					<iframe src="wc" frameborder="0" name="mainFrame" scrolling="auto" marginheight="0" marginwidth="0" id="iframepage" onLoad="iFrameHeight()" width="100%" height="800px">
						
					</iframe>
					<script type="text/javascript" language="javascript">   
						function iFrameHeight(){   
							var ifm= document.getElementById("iframepage");   
							var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument;   
							if(ifm != null && subWeb != null) {
							   ifm.height = subWeb.body.scrollHeight;
							   ifm.width = subWeb.body.scrollWidth;
							}   
						}
					</script>
				</div>
				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="default" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; 选择皮肤</span>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl">切换到左边</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
							<label class="lbl" for="ace-settings-add-container">
								切换窄屏
								<b></b>
							</label>
						</div>
					</div>
				</div><!-- /#ace-settings-container -->
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='resources/assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='resources/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='resources/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
		</script>
		<script src="resources/assets/js/bootstrap.min.js"></script>
		<script src="resources/assets/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="resources/assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="resources/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="resources/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="resources/assets/js/jquery.slimscroll.min.js"></script>
		<script src="resources/assets/js/jquery.sparkline.min.js"></script>

		<!-- ace scripts -->

		<script src="resources/assets/js/ace-elements.min.js"></script>
		<script src="resources/assets/js/ace.min.js"></script>
		<script>
				$("#editUser").click(function(){
					var userId ="${userInfo.userid}";
					window.mainFrame.location.href = document.getElementsByTagName('base')[0].href
					+ 'admin/edit-user/' + userId;  
				});
				
				$("#modifyPwd").click(function(){
					var userId ="${userInfo.userid}";
					window.mainFrame.location.href = document.getElementsByTagName('base')[0].href
					+ 'admin/modify-pwd/'+userId;  
				});
				
				$("#logout").click(function(){
					
					window.mainFrame.location.href = document.getElementsByTagName('base')[0].href
					+ 'admin/logout/';  
				});
				
				/* 
				websocket实现
				*/
			function Websocket(){
				window.open("admin/toWebsocket","_blank","top=100,left=300,height=435,width=730,toolbar=no,menubar=no,scrollbar=no, resizable=0,location=no, status=no");	
			}  
		</script>
		<!-- <div id="websocket_button"></div> -->
</body>
</html>

