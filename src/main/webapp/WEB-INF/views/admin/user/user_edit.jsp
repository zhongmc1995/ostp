<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>资讯</title>
		<base href="<%=basePath%>">
		<jsp:include page="../head.jsp"></jsp:include>
	</head>
	<body>
				<!--将这一部分1转化成iframe-->
				<div class="main-content" style="margin-left: 0px;margin-bottom: 0px;">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-dashboard"></i>
								<a href="#">用户管理</a>
							</li>
							<li class="active">用户编辑</li>
						</ul><!-- .breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								用户编辑
								<small>
									<i class="icon-double-angle-right"></i>
									 编辑
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<div class="row">
									<div class="col-xs-12">
										<!-- PAGE CONTENT BEGINS -->
										
										<form action="user_update" method="POST" class="clearfix form-actions">
										<input type="hidden" name="userId" value="${user.userid}" />
											<div class="row">
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="Username">用户名</label>
				
														<div class="col-sm-9">
																<input type="text" id="Username" name="username" placeholder="Username" value="${user.username}"   class="form-control">																
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
															<label class="col-sm-3 control-label no-padding-right" for="Usersex">性别</label>
					
															<div class="col-sm-9">
																
																		男<input type="radio" id="Usersex"  name="usersex"   <c:if test="${user.usersex== '1'}">checked="checked"</c:if>>
																
																
																 女<input type="radio" id="Usersex"  name="usersex"      <c:if test="${user.usersex== '0'}">checked="checked"</c:if>>
																
															</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="Useremail">邮箱</label>
				
														<div class="col-sm-9">
															<input type="text" id="Useremail" name="useremail" placeholder="Useremail" value="${user.useremail}"   class="form-control">	
														</div>
													</div>
												</div>
											</div>
											<br />
											<div class="row">
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="Userphone">电话</label>
				
														<div class="col-sm-8">
															<input type="text" id="Userphone" name="userphone" placeholder="Userphone" value="${user.userphone}"   class="form-control">	
														</div>
												   </div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="Userhobby">兴趣</label>
				
														<div class="col-sm-8">
															<input type="text" id="Userhobby" name="userhobby" placeholder="Userhobby" value="${user.userhobby}"   class="form-control">		
														</div>
													</div>
												</div>
												<div class="col-sm-4">
														<div class="form-group">
															<label class="col-sm-4 control-label no-padding-right" for="Userjob">职业</label>
					
															<div class="col-sm-8">
																<input type="text" id="Userjob" name="userjob" placeholder="Userjob" value="${user.userjob}"   class="form-control">	
															</div>
														</div>
												</div>
											</div>
											<br />
											<div class="row">
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="Useredu">教育程度</label>
				
														<div class="col-sm-8">
															<input type="text" id="Useredu" name="useredu" placeholder="Useredu" value="${user.useredu}"   class="form-control">	
														</div>
												   </div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
																<label class="col-sm-4 control-label no-padding-right" for="UserTag">标记</label>
						
																<div class="col-sm-8">
																	<input type="text" id="UserTag" name="usertag" placeholder="UserTag" value="${user.usertag}"   class="form-control">		
																</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="Userdesc">描述</label>
				
														<div class="col-sm-8">
															<input type="text" id="Userdesc" name="userdesc" placeholder="Userdesc" value="${user.userdesc}"   class="form-control">	
														</div>
													</div>
												</div>
											</div>
											<br />
										
											<div class="row">
												<div class="form-actions">
													<div class="col-sm-offset-5 col-md-3">
														<button class="btn btn-primary" type="submit">
															<i class="icon-ok bigger-110"></i>
															修改
														</button>
			
														&nbsp; &nbsp; &nbsp;
														<button class="btn btn-info" type="reset">
															<i class="icon-undo bigger-110"></i>
															重置
														</button>
													</div>
												</div>
											</div>
											
										</form>
										
									</div><!-- /.col -->
								</div><!-- /.row -->
							
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->
					
				<jsp:include page="../foot.jsp"></jsp:include>

	

		
</body>
</html>
