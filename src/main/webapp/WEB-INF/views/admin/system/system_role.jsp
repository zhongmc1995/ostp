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
				<li class="active">菜单管理</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					角色管理 <small> <i class="icon-double-angle-right"></i> 查看
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
													<button class="btn btn-info" data-toggle="modal"
														data-target="#roleAdd">
														<i class="icon-edit bigger-125"></i>  
														<a href="#"> 角色添加</a>
													</button>
												</div>
											</div>
										</div>
										<div class="col-sm-6"></div>
									</div>

									<div class="table-header">角色管理</div>

									<div class="table-responsive">
										<table id="sample-table-2"
											class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">选择</th>
													<th>序号</th>
													<th>角色编码</th>
													<th>角色名称</th>
													<th>角色描述</th>
													<th class="hidden-480">授权</th>

												</tr>
											</thead>
											<tbody>
												<c:if test=""></c:if>
												<input id="roleId" type="hidden" value="" />
												<c:forEach items="${roleList}" var="role"
													varStatus="status">
													<tr>
														<td class="center"><label> <input
																type="checkbox" class="ace" value="" name="check" /> <span
																class="lbl"></span>
														</label></td>
														<td>${status.index + 1}</td>
														<td  class="rolename">${role.authority}</td>
														<td>${role.name}</td>
														<td>${role.code}</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																
																<a data-toggle="modal" data-target="#roleEditor" 
																    data-rownum="${status.index+1}" data-roleid="${role.id}" class="green editor" href="#"> 
																	<i class="icon-pencil bigger-130"></i> 编辑
																</a>
																<a class="red" style="cursor:pointer;" data-url="admin/delete-role?id=${role.id}"> <i
																	class="icon-trash bigger-130"></i> 删除
																</a>
																<a class="blue authorityBtn" data-toggle="modal" data-roleid="${role.id}"
																	data-target="#roleAuthority" href="#"><i
																	class="icon-plus bigger-130"></i> 授权
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

	<div id="roleAuthority" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-padding">
					<div class="table-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="white">×</span>
						</button>
						角色授权
					</div>
				</div>
				
				<div class="modal-body no-padding">
					<form class="clearfix form-actions" id="role-authority-form">
						<jsp:include page="ztree.jsp"></jsp:include>
						<div class="row">
							<div class="form-actions">
								<div class="text-center">
									<button class="btn btn-primary" type="submit" id="submit">
										<i class="icon-ok bigger-110"></i> 保存
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
	
	<div id="roleAdd" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header no-padding">
						<div class="table-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<span class="white">×</span>
							</button>
							角色添加
						</div>
					</div>

				<div class="modal-body no-padding">
					<form class="clearfix form-actions" id="role-add-form">
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">角色编码</label>
									<div class="col-sm-9">
										<input type="text" id="authority" placeholder="ROLE_角色编码"
											class="form-control"><span id="authoritymsg"></span>
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">角色名称</label>
									<div class="col-sm-9">
										<input type="text" id="roleName" placeholder="tilte"
											class="form-control"><span id="roleNamemsg"></span>
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">角色描述</label>
									<div class="col-sm-9">
										<input type="text" id="roleCode" placeholder="tilte"
											class="form-control">
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
	
	<div id="roleEditor" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
					<div class="modal-header no-padding">
						<div class="table-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<span class="white">×</span>
							</button>
							角色编辑
						</div>
					</div>

				<div class="modal-body no-padding">
					<form class="clearfix form-actions" id="role-editor-form">
						<div class="row">
							<input id="roleId" type="hidden" value="" />
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">角色编码</label>
									<div class="col-sm-9">
										<input type="text" id="2" disabled="disabled" readonly="readonly"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">角色名称</label>
									<div class="col-sm-9">
										<input type="text" id="3" placeholder="tilte"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">角色描述</label>
									<div class="col-sm-9">
										<input type="text" id="4" placeholder="tilte"
											class="form-control">
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="form-actions">
								<div class="text-center">
									<button class="btn btn-primary" type="submit" id="submit">
										<i class="icon-ok bigger-110"></i> 更新
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

$(".authorityBtn").click(function(){
	var roleId = $(this).data('roleid');
	$("#roleId").val(roleId);
	jQuery.ajax({
		headers : {
			'Accept' : 'application/json',
			'Content-Type' : 'application/json'
		},
		type : "GET",
		url : "admin/getSelectMenuId?roleId="+roleId,
		success : function(data) {
				var ids = (data.ids).split(',');
				$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
				for (var i=0, l=ids.length; i < l; i++) {
					var nodes = treeObj.getNodeByParam("id", ids[i], null);
					treeObj.checkNode(nodes, true, false);
				}
			} 
		}
	); 
		
});

$(function() {
		roleAdd.initial();
	});
	var roleAdd = {
			initial : function initial() {
				this.bindSubmitForm();
			},
			bindSubmitForm : function bindSubmitForm() {
				var form = $("form#role-add-form");
					form.submit(function() {
						var result = roleAdd.verifyInput()&&roleAdd.verifyRoleName();
						if (result) {
							var data = new Object();
							data.id = "";
							data.authority= $("#authority").val();
							data.name = $("#roleName").val();
							data.code = $("#roleCode").val();
							jQuery.ajax({
										headers : {
											'Accept' : 'application/json',
											'Content-Type' : 'application/json'
										},
										type : "POST",
										url : "admin/role-add",
										data : JSON.stringify(data),
										success : function(message, tst, jqXHR) {
											 if (message.result == "success") {
												 return dialog.success(message.messageInfo,"admin/system-role");
											} else {
												return dialog.error(message.result);
												}
											} 
										}
									); 
						}
						return false;
					});
				
				
			},

			verifyInput : function verifyInput(){
				var authority = $("#authority").val();
				var roleName = $("#roleName").val();
				var reg = /ROLE_.*/;
				if(!reg.test(authority)){
					//$("#authoritymsg").html("请填写以ROLE_开头的编码");
					layer.alert('请填写以ROLE_开头的编码', {
			    		  skin: 'layui-layer-molv' //样式类名
			    		  ,closeBtn: 0
			    		});
				};
				var result = reg.test(authority);
				return result;
			},
			verifyRoleName:function verifyRoleName(){
				var isOk=true;
				$(".rolename").each(function(){
				    if($(this).text()==$("#authority").val())
				    {
				    	layer.alert('该角色名已存在，请从新输入', {
				    		  skin: 'layui-layer-molv' //样式类名
				    		  ,closeBtn: 0
				    		});
				    	isOk=false;
				    }
				  });
			    return isOk;
			}
			
		};
		
	$(".editor").on('click', function() {
		var index = $(this).data('rownum');
		var roleId = $(this).data('roleid');
		$("#roleId").val(roleId);
		var row = $('#sample-table-2').find('tr:eq(' + index + ')');
		for (var i = 2; i < 5; i = i + 1) {
			var tr = row.find('td:eq(' + i + ')');
				$('#' + i).val(tr.text());
			
		}
	});
	$(function() {
		roleEditor.initial();
	});
	var roleEditor = {
			initial : function initial() {
				this.bindSubmitForm();
			},
			bindSubmitForm : function bindSubmitForm() {
				var form = $("form#role-editor-form");
					form.submit(function() {
						if (true) {
							var data = new Object();
							data.id = $("#roleId").val();
							data.authority= $("#2").val();
							data.name = $("#3").val();
							data.code = $("#4").val();
							jQuery.ajax({
										headers : {
											'Accept' : 'application/json',
											'Content-Type' : 'application/json'
										},
										type : "POST",
										url : "admin/role-editor",
										data : JSON.stringify(data),
										success : function(message, tst, jqXHR) {
											 if (message.result == "success") {
												 return dialog.success(message.messageInfo,"admin/system-role");
											} else {
												return dialog.error(message.messageInfo);
												}
											} 
										}
									); 
						}
						return false;
					});
				
				
			},
			
			
		};
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
