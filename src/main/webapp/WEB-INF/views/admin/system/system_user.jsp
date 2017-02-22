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
<title>系统管理</title>
<base href="<%=basePath%>">
<jsp:include page="../head.jsp"></jsp:include>
</head>

<body>
	<!--将这一部分1转化成iframe-->
	<div class="main-content" style="margin-left: 0px; margin-bottom: 0px;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

			<ul class="breadcrumb">
				<li><i class="icon-folder-open-alt"> 系统管理</i> <a href="#"></a>
				</li>
				<li class="active">用户管理</li>
			</ul>
		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					用户管理 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<div class="row">

								<div class="col-xs-12">

									<div class="row">
										<div class="col-sm-6">
											<div class="dataTables_info" id="sample-table-2_info">
												<div class="btn-group">
													<button class="btn btn-info green" data-toggle="modal"
														data-target="#userAdd">
														<i class="icon-edit bigger-125"></i> 
														<a href="#"> <i class="icon-double-angle-right"></i> 用户添加</a>
														
													</button>
												</div>
											</div>
										</div>
										<div class="col-sm-6"></div>
									</div>

									<div class="table-header">用户管理</div>

									<div class="table-responsive">
										<table id="sample-table-2"
											class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">选择</th>
													<th>序号</th>
													<th>用户姓名</th>
													<th>用户性别</th>
													<th>用户邮箱	</th>
													<th>电话</th>
													<th>用户角色</th>
													<th>描述</th>
													<th>爱好</th>
													<th>工作情况</th>
													<th>学历</th>
													<th>个人标签</th>
													<th>状态</th>
													<th>操作</th>
												</tr>
											</thead>

											<tbody>
												<c:if test=""></c:if>
												<c:forEach items="${page.results}" var="user"
													varStatus="status">
													<tr>
														<td class="center"><label> <input
																type="checkbox" class="ace" value="" name="check" /> <span
																class="lbl"></span>
														</label></td>
														<td>${status.index + 1}</td>
														<td class="username">${user.username}</td>
														<td>${user.usersex eq '0' ? '男' : '女'}</td>
														<td>${user.useremail}</td>
														<td>${user.userphone}</td>
														<td>${user.userauthority}</td>
														<td>${user.userdesc}</td>
														<td>${user.userhobby}</td>
														<td>${user.userjob}</td>
														<td>${user.useredu}</td>
														<td>${user.usertag}</td>
														<td>${user.enabled eq '1' ? '可用' : '禁用'}</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																
																<a id="editor"class="green" 
																		href="admin/to-usereditor?userId=${user.userid}"> 
																	<i class="icon-pencil bigger-130"></i> 编辑
																</a>
																<a class="red" style="cursor:pointer;" data-url="admin/delete-user?id=${user.userid}"> <i
																	class="icon-trash bigger-130"></i> 删除
																</a>
															</div>

															<div class="visible-xs visible-sm hidden-md hidden-lg">
																<div class="inline position-relative">
																	<button
																		class="btn btn-minier btn-yellow dropdown-toggle"
																		data-toggle="dropdown">
																		<i class="icon-caret-down icon-only bigger-120"></i>
																	</button>

																	<ul
																		class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																		<li><a href="#" class="tooltip-info"
																			data-rel="tooltip" title="View"> <span
																				class="blue"> <i
																					class="icon-zoom-in bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-success"
																			data-rel="tooltip" title="Edit"> <span
																				class="green"> <i
																					class="icon-edit bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-error"
																			data-rel="tooltip" title="Delete"> <span
																				class="red"> <i class="icon-trash bigger-120"></i>
																			</span>
																		</a></li>
																	</ul>
																</div>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="row">
										<div class="col-sm-8 col-sm-offset-4">
											<div class="dataTables_paginate paging_bootstrap">
												<ul class="pagination">${pageStr}</ul>
											</div>
										</div>
									</div>
								</div>

							</div>

						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->

			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->

	<div id="userAdd" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-padding">
					<div class="table-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="white">×</span>
						</button>
						用户添加
					</div>
				</div>

				<div class="modal-body no-padding">
					<form class="clearfix form-actions" id="user-add-form">
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">用户名</label>
									<div class="col-sm-9">
										<input type="text" id="username" placeholder="用户名"
										required class="form-control">
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">性别</label>
									<div class="col-sm-9">
										<select id="usersex" class="form-control">
											<option value="0">男</option>
											<option value="1">女</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">邮箱</label>
									<div class="col-sm-9">
										<input type="email" id="useremail" placeholder="tilte"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">联系电话</label>
									<div class="col-sm-9">
										<input type="text" id="userphone" placeholder="tilte"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">角色</label>
									<div class="col-sm-9">
										<select id="userauthority" class="form-control">
										<c:forEach items="${roleList}" var="role">
											<option  value="${role.id}">${role.authority}</option>
										</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">登陆密码</label>
									<div class="col-sm-9">
										<input type="text" id="userpsw" placeholder="tilte"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">状态</label>
									<div class="col-sm-9">
										<input class="state" name="state" type="radio" value="1" checked/>启用
										<input class="state" name="state" type="radio" value="0" />禁用
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="form-actions">
								<div class="text-center">
									<button class="btn btn-primary" type="submit" id="submit">
										<i class="icon-ok bigger-110"></i> 保存
									</button>
									&nbsp; &nbsp; &nbsp;
									<button class="btn btn-primary" type="reset">
										<i class="icon-undo bigger-110"></i> 重置
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	

	<script>
	
	
	
$(function() {
	
		userAdd.initial();
	});
	var userAdd = {
			initial : function initial() {
				this.bindSubmitForm();
			},
			bindSubmitForm : function bindSubmitForm() {
				var form = $("form#user-add-form");
					form.submit(function() {
						var result = userAdd.verifyUserName();
						if (result) {
							var data = new Object();
							data.userid = "";
							data.username= $("#username").val();
							data.usersex = $("#usersex").val();
							data.useremail = $("#useremail").val();
							data.userphone = $("#userphone").val();
							data.userauthority = $("#userauthority").val(); 
							data.userpsw = $("#userpsw").val();
							var obj = $(".state");
							var state = "1";
						    for(var i=0; i<obj.length; i++){
						        if(obj[i].checked){
						            state = obj[i].value;
						        }
						    }
						    data.enabled = state;
						}
							jQuery.ajax({
								headers : {
									'Accept' : 'application/json',
									'Content-Type' : 'application/json'
								},
								type : "POST",
								url : "admin/user-add",
								data : JSON.stringify(data),
								success : function(message, tst, jqXHR) {
									 if (message.result == "success") {
										 return dialog.success(message.messageInfo,"admin/system-user");
									} else {
										return dialog.error(message.result);
										}
									} 
								}
							); 
						
						return false;
					});
				
				
			},
			/*用户名验证*/
			verifyUserName:function verifyUserName(){
				var isOk=true;
				$(".username").each(function(){
				    if($(this).text()==$("#username").val())
				    {
				    	layer.alert('该用户名已存在，请从新输入', {
				    		  skin: 'layui-layer-molv' //样式类名
				    		  ,closeBtn: 0
				    		});
				    	isOk=false;
				    }
				  });
			    return isOk;
			}
		};
		
	$("#editor").on('click',function(){
		$('#Table1 tr').find('td').each(function() {
            if ($(this).index() == "0") { // 假设要获取第一列的值
                $('#Result').append($(this).text() + ',');
            }
        });
	});
	/*删除*/
	$("a.red").on('click',function(){
		var url = $(this).data('url');
		layer.open({
	        type:0,
	        title:'是否提交?',
	        btn:['yes','no'],
	        icon:3,
	        closeBtn:2,
	        content:'是否确定操作',
	        scrollbar:true,
	        yes:function(){
	            //执行跳转			 	
	        	dialog.success("删除成功！",url);
	        },
	    });	
	});
	</script>
	<script src="resources/js/laydate/laydate.js"></script>
	<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>
