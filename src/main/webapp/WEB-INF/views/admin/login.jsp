<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>登陆</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- basic styles -->

<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css" />

<!--[if IE 7]>
		  <link rel="stylesheet" href="resources/Sports/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

<!-- page specific plugin styles -->

<!-- fonts -->

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

<!-- ace styles -->

<link rel="stylesheet" href="resources/assets/css/ace.min.css" />
<link rel="stylesheet" href="resources/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="resources/css/ostp.css" />

<!--[if lte IE 8]>
		  <link rel="stylesheet" href="resources/Sports/assets/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
		<script src="resources/assets/js/html5shiv.js"></script>
		<script src="resources/assets/js/respond.min.js"></script>
		<![endif]-->
		<base href="<%=basePath%>">
</head>

<body class="login-layout" style="background-color: #BCE8F1;">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="position-relative" style="margin-top: 200px;">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="icon-coffee blue"></i> 用户登录
										</h4>

										<div class="space-6"></div>

										<form action="j_spring_security_check" method="post"
											name="loginForm" id="loginForm">
											     
												<label class="block clearfix">
													 <span class="block input-icon input-icon-right"> 
													 <input type="text" class="form-control" name="j_username"
															placeholder="请输入用户名" /> <i class="icon-user"></i>
													</span>
												</label> 
												<label class="block clearfix">
													 <span class="block input-icon input-icon-right"> 
													 <input type="password" name="j_password" class="form-control"
															placeholder="请输入密码" /> <i class="icon-lock"></i>
													</span>
												</label>
												<label class="block clearfix">
													 <span class="block input-icon input-icon-right form-message"> 
															${result}	
													</span>
												</label>
											

												<div class="clearfix">
													<label class="inline"> <input type="checkbox" id="_spring_security_remember_me" 
													name="_spring_security_remember_me" class="ace" /> <span class="lbl">记住密码</span>
													</label> 
													
														<input type="submit" value="登陆"  class="width-35 pull-right btn btn-sm btn-primary"> 
													
												</div>

												<div class="space-4"></div>
										
										</form>
									</div>
									<!-- /widget-main -->
									<div class="toolbar clearfix">
											<h4 class="white bolder smaller">Copyright &copy 和平新技术研究院</h4>
										</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /login-box -->
							<!-- /signup-box -->
						</div>
						<!-- /position-relative -->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->



	<!--[if !IE]> -->

	<script type="text/javascript">
			window.jQuery || document.write("<script src='resources/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

	<!-- <![endif]-->

	


</body>
</html>
