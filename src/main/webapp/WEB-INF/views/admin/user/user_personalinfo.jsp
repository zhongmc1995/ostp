<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>系统用户</title>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
	<!--将这一部分1转化成ifream-->
	<div class="main-content" style="margin-left: 0px; margin-bottom: 0px;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="icon-dashboard"></i> <a href="#">系统管理</a></li>
				<li class="active">系统用户</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					系统用户 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					
						

					<div>
						<div id="user-profile-3" class="user-profile row">
							<div class="col-sm-offset-1 col-sm-10">
								<!-- <div class="well well-sm">
									<div class="inline middle blue bigger-110">个人资料完整度90%</div>
									&nbsp; &nbsp; &nbsp;
									<div style="width: 200px;" data-percent="70%"
										class="inline middle no-margin progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											style="width: 90%"></div>
									</div>
								</div> -->
								<!-- /.well -->

								<div class="space"></div>

								<form class="form-horizontal">
									<div class="tabbable">
										<ul class="nav nav-tabs padding-16">
											<li class="active"><a data-toggle="tab"
												href="#edit-basic"> <i
													class="green ace-icon fa fa-pencil-square-o bigger-125"></i>
													基本信息
											</a></li>

											<li><a data-toggle="tab" href="#edit-password"> <i
													class="blue ace-icon fa fa-key bigger-125"></i> 修改密码
											</a></li>
										</ul>

										<div class="tab-content profile-edit-tab-content">
											<div id="edit-basic" class="tab-pane in active">
												<h4 class="header blue bolder smaller">基本信息</h4>

												<div class="row">
													<div class="vspace-12-sm"></div>
													<div class="col-xs-12 col-sm-8">
														<div class="form-group">
															<label class="col-sm-4 control-label no-padding-right"
																for="form-field-userName">用户名</label>

															<div class="col-sm-8">
																<input class="col-xs-12 col-sm-10" type="text"
																	id="form-field-userName" placeholder="用户名"
																	required oninvalid="setCustomValidity('用户名不能为空！');" value="${sysuser.username}" />
																<span class="help-block" id="usernamemsg"></span>
															</div>
														</div>
														<script type="text/javascript">
															var oldname = $("#form-field-userName").val();
															$("#form-field-userName").blur(function(){
																if($.trim($(this).val())!=$.trim(oldname)){
																	jQuery.ajax({
																		headers : {
																			'Accept' : 'application/json',
																			'Content-Type' : 'application/json'
																		},
																		type : "GET",
																		url : "admin/verifyUserName?userName="+$("#form-field-userName").val(),
																		success : function(message, tst, jqXHR) {
																				$("#usernamemsg").html(message.messageInfo);
																			} 
																		}
																	); 
																}
															});
														</script>
														<div class="space-4"></div>

														<div class="form-group">
															<label class="col-sm-4 control-label no-padding-right">性别</label>

															<div class="col-sm-8">
																<label class="inline"> <input name="sex"
																	type="radio" class="ace" value="0"
																	<c:choose><c:when test="${sysuser.usersex == '0'}">checked</c:when></c:choose> />
																	<span class="lbl middle">男</span>
																</label> &nbsp; &nbsp; &nbsp; <label class="inline"> <input
																	name="sex" type="radio" class="ace" value="1"
																	<c:choose><c:when test="${sysuser.usersex == '1'}">checked</c:when></c:choose> />
																	<span class="lbl middle">女</span>
																</label>
															</div>
														</div>

														<div class="space-4"></div>
														
													
														
														<div class="form-group">
															<label class="col-sm-4 control-label no-padding-right"
																for="form-field-userName">角色编码</label>

															<div class="col-sm-8">
																<input class="col-xs-12 col-sm-10" type="text"
																	id="form-field-userName" placeholder="角色编码"
																	readonly value="${sysuser.userauthority}" />
															</div>
														</div>
														
														<div class="form-group">
															<label class="col-sm-4 control-label no-padding-right"
																for="form-field-userName">用户描述</label>

															<div class="col-sm-8">
																<input class="col-xs-12 col-sm-10" type="text"
																	id="form-field-userName" placeholder="用户描述"
																	value="${sysuser.userdesc}" />
															</div>
														</div>

														<div class="space-4"></div>
														
														<div class="form-group">
															<label class="col-sm-4 control-label no-padding-right"
																for="form-field-userName">用户兴趣</label>

															<div class="col-sm-8">
																<input class="col-xs-12 col-sm-10" type="text"
																	id="form-field-userName" placeholder="用户兴趣"
																	value="${sysuser.userhobby}" />
																<%-- <textarea class="col-xs-12 col-sm-10" rows="3" cols="10">
																	${sysuser.userhobby}
																</textarea>	 --%>
															</div>
														</div>

														<div class="space-4"></div>
														
														<div class="form-group">
															<label class="col-sm-4 control-label no-padding-right"
																for="form-field-userName">用户工作</label>

															<div class="col-sm-8">
																<input class="col-xs-12 col-sm-10" type="text"
																	id="form-field-userName" placeholder="用户工作"
																	value="${sysuser.userjob}" />
																<%-- <textarea class="col-xs-12 col-sm-10" rows="3" cols="10">
																	${sysuser.userjob}
																</textarea>	 --%>	
															</div>
														</div>

														<div class="space-4"></div>
													</div>
												</div>

												<div class="space"></div>
												<h4 class="header blue bolder smaller">联系方式</h4>

												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-email">邮箱</label>

													<div class="col-sm-9">
														<span class="input-icon input-icon-right" title="邮箱不可以更改">
															<input type="email" id="form-field-email"
															value="${sysuser.useremail}" required="required" oninvalid="setCustomValidity('请输入邮箱！');" /> <i
															class="ace-icon fa fa-envelope"></i>
														</span>
													</div>
												</div>

												<div class="space-4"></div>

												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-phone">联系电话</label>

													<div class="col-sm-9">
														<span class="input-icon input-icon-right"> <input
															type="text" id="form-field-phone"
															value="${sysuser.userphone}" /> <i
															class="ace-icon fa fa-phone fa-flip-horizontal"></i>
														</span>
													</div>
												</div>

												<div class="space"></div>

											</div>

											<div id="edit-password" class="tab-pane">
												<div class="space-10"></div>

												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-pass1">新密码</label>

													<div class="col-sm-9">
														<input type="password" id="form-field-pass1" />
													</div>
												</div>

												<div class="space-4"></div>

												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-pass2">确认密码</label>

													<div class="col-sm-9">
														<input type="password" id="form-field-pass2" />
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											&nbsp; &nbsp;&nbsp; &nbsp;
											<button id="submitButton" class="btn btn-info" type="submit">
												<i class="ace-icon fa fa-check bigger-110"></i> 保存
											</button>
										</div>
									</div>
								</form>
							</div>
							<!-- /.span -->
						</div>
						<!-- /.user-profile -->
					</div>

					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->


		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->

	<jsp:include page="../foot.jsp"></jsp:include>

</body>
</html>
