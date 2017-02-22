<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>系统管理</title>
<base href="<%=basePath%>">
<jsp:include page="../head.jsp"></jsp:include>
</head>

<body>
	<!--将这一部分1转化成iframe-->
	<div class="main-content" style="margin-left: 0px; margin-bottom: 0px;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="icon-folder-open-alt"> 系统用户编辑</i> <a href="#"></a>
				</li>
				<li class="active">系统用户编辑</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					系统用户编辑<small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<div>
				<div id="user-profile-3" class="user-profile row">
					<div class="col-sm-offset-1 col-sm-10">
						<div class="space"></div>

						<form class="form-horizontal" action="admin/user-editor" method="post">
							<div class="tabbable">
								<ul class="nav nav-tabs padding-16">
									<li class="active"><a data-toggle="tab" href="#edit-basic">
											<i class="green ace-icon fa fa-pencil-square-o bigger-125"></i>
											基本信息
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
														<input name="userid" class="form-control" type="hidden"
															value="${user.userid}" /> <input id="form-field-userName"
															class="col-xs-12 col-sm-10" type="text" name="username"
															 placeholder="用户名" required
															oninvalid="setCustomValidity('用户名不能为空！');"
															value="${user.username}" /> <span class="help-block"
															id="usernamemsg"></span>
													</div>
												</div>
												<script type="text/javascript">
													var oldname = $("#form-field-userName").val();
													$("#form-field-userName").blur(function() {
														if ($.trim($(this).val()) != $.trim(oldname)) {
															jQuery.ajax({
																		headers : {
																			'Accept' : 'application/json',
																			'Content-Type' : 'application/json'
																		},
																		type : "GET",
																		url : "admin/verifyUserName?userName="
																				+ $("#form-field-userName").val(),
																		success : function(message,tst,jqXHR) {
																			$("#usernamemsg").html(message.messageInfo);
																		}
																	});
														}
													});
												</script>
												<div class="space-4"></div>

												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right">性别</label>

													<div class="col-sm-8">
														<label class="inline"> <input name="usersex"
															type="radio" class="ace" value="0"
															<c:choose><c:when test="${user.usersex == '0'}">checked</c:when></c:choose> />
															<span class="lbl middle">男</span>
														</label> &nbsp; &nbsp; &nbsp; <label class="inline"> <input
															name="usersex" type="radio" class="ace" value="1"
															<c:choose><c:when test="${user.usersex == '1'}">checked</c:when></c:choose> />
															<span class="lbl middle">女</span>
														</label>
													</div>
												</div>

												<div class="space-4"></div>

												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right"
														for="form-field-userName">角色编码</label>

													<div class="col-sm-8">
														<select class="col-xs-12 col-sm-10" name="userauthority">
															<c:forEach items="${roleList}" var="role">
																<option value="${role.id}"
																	<c:if test="${user.userauthority eq role.authority}">selected="selected"</c:if> >${role.authority}</option>
															</c:forEach>
														</select> 
													</div>
												</div>
												<div class="space-4"></div>

												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right"
														for="form-field-userName">角色描述</label>

													<div class="col-sm-8">
														<input name="userdesc" class="col-xs-12 col-sm-10" type="text"
															 placeholder="用户描述" value="${user.userdesc}" />
													</div>
												</div>
												<div class="space-4"></div>

												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right"
														for="form-field-userName">用户兴趣</label>

													<div class="col-sm-8">	
														<input name="userhobby" class="col-xs-12 col-sm-10" type="text"
															id="" placeholder="用户兴趣"
															value="${user.userhobby}" />
													</div>
												</div>
												<div class="space-4"></div>

												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right"
														for="form-field-userName">用户工作</label>
													<div class="col-sm-8">
														<input name="userjob" class="col-xs-12 col-sm-10" type="text"
															id="" placeholder="用户工作"
															value="${user.userjob}" />
													</div>
												</div>
												<div class="space-4"></div>
												
												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right"
														for="form-field-userName">学历</label>

													<div class="col-sm-8">
														<select class="col-xs-12 col-sm-10" name="useredu">
															<option value="无">无</option>
															<option value="小学" <c:if test="${user.useredu=='小学'}">selected="selected"</c:if> >小学</option>
															<option value="中学" <c:if test="${user.useredu=='中学'}">selected="selected"</c:if>  >中学</option>
															<option value="高中" <c:if test="${user.useredu=='高中'}">selected="selected"</c:if>>高中</option>
															<option value="大学" <c:if test="${user.useredu=='大学'}">selected="selected"</c:if> >大学</option>
															<option value="研究生" <c:if test="${user.useredu=='研究生'}">selected="selected"</c:if> >研究生</option>
															<option value="硕士" <c:if test="${user.useredu=='硕士'}">selected="selected"</c:if> >硕士</option>
															<option value="博士" <c:if test="${user.useredu=='博士'}">selected="selected"</c:if> >博士</option>
															<option value="博士后" <c:if test="${user.useredu=='博士后'}">selected="selected"</c:if>>博士后</option>
														</select>	
													</div>
												</div>
												<div class="space-4"></div>
												
												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right"
														for="form-field-userName">个人标签</label>

													<div class="col-sm-8">
														<input name="usertag" class="col-xs-12 col-sm-10" type="text"
															id="" placeholder="个人标签"
															value="${user.usertag}" />
													</div>
												</div>
												<div class="space-4"></div>
												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right"
														for="form-field-userName">帐号状态</label>

													<div class="col-sm-8">
														<input name="enabled" class="col-xs-12 col-sm-10" type="text"
															id="" placeholder="帐号状态"
															value="${user.enabled}" />
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
													<input name="useremail" type="email" id=""
													value="${user.useremail}" required="required"
													oninvalid="setCustomValidity('请输入邮箱！');" /> <i
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
													type="text" name="userphone" id="form-field-phone"
													value="${user.userphone}" /> <i
													class="ace-icon fa fa-phone fa-flip-horizontal"></i>
												</span>
											</div>
										</div>
										<div class="space"></div>
									</div>
								</div>
							</div>

							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									&nbsp; &nbsp;&nbsp; &nbsp;
									<button id="submitButton" class="btn btn-info" type="submit">
										<i class="ace-icon fa fa-check bigger-110"></i> 更新
									</button>
								</div>
							</div>
						</form>
					</div>
					<!-- /.span -->
				</div>
				<!-- /.user-profile -->
			</div>


		</div>


	</div>


	<script>
		
	</script>
	<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>
