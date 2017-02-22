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
<jsp:include page="../../head.jsp"></jsp:include>
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
				<li><i class="icon-folder-open-alt"> 系统管理</i> <a href="#"></a>
				</li>
				<li class="active">首页导航栏管理</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					首页导航栏管理<small> <i class="icon-double-angle-right"></i> 查看
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
														data-target="#navigationbarAdd">
														<i class="icon-edit bigger-125"></i> <a href="#"> <i
															class="icon-double-angle-right"></i> 导航栏添加
														</a>

													</button>
												</div>
											</div>
										</div>
										<div class="col-sm-6"></div>
									</div>

									<div class="table-header">菜单管理</div>

									<div class="table-responsive">
										<table id="sample-table-2"
											class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">选择</th>
													<th>菜单ID</th>
													<th>菜单名称</th>
													<th>菜单href</th>
													<th>排序</th>
													<th class="hidden-480">操作</th>

												</tr>
											</thead>

											<tbody>
													<c:forEach items="${navigationBarList}" var="navigationbar"
														varStatus="status">
														<tr id="${navigationbar.id}">
															<td class="center"><label> <input
																	type="checkbox" class="ace" value="" name="check" /> <span
																	class="lbl"></span>
															</label></td>
															<td>${navigationbar.id}</td>
															<td>${navigationbar.menuName}</td>
															<td>${navigationbar.href}</td>
															<td>${navigationbar.sequence}</td>
															<td>
																<div
																	class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																	<a id="editor" data-toggle="modal"
																		data-target="#menuEditor" class="green editor"
																		href="#" data-rownum="${status.index+1}"> <i
																		class="icon-pencil bigger-130"></i> 编辑
																	</a> <a style="cursor:pointer;" class="red" data-url="admin/navigationbar-del?id=${navigationbar.id}">
																		<i class="icon-trash bigger-130"></i> 删除
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
																					class="red"> <i
																						class="icon-trash bigger-120"></i>
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
												<ul class="pagination"></ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="navigationbarAdd" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-padding">
					<div class="table-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="white">×</span>
						</button>
						导航栏添加
					</div>
				</div>

				<div class="modal-body no-padding">
					<form class="clearfix form-actions" id="menu-add-form">
						<div class="row">
							<div class="col-xs-12"></div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">导航栏名称</label>
									<div class="col-sm-9">
										<input type="text" id="menuname" placeholder=""
											class="form-control">
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">菜单href</label>
									<div class="col-sm-9">
										<input type="text" id="menuhref" placeholder="tilte"
											class="form-control">
									</div>
								</div>
							</div>
							
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">菜单排序</label>
									<div class="col-sm-9">
										<input type="text" id="menusequence" placeholder="tilte"
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
	<div id="menuEditor" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-padding">
					<div class="table-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="white">×</span>
						</button>
						导航栏编辑
					</div>
				</div>

				<div class="modal-body no-padding">
					<form class="clearfix form-actions" id="menu-editor-form">
						<div class="row">
							<div class="col-xs-12"></div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">导航栏ID</label>
									<div class="col-sm-9">
										<input type="text" id="c1" disabled="true" readOnly="true"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">导航栏名称</label>
									<div class="col-sm-9">
										<input type="text" id="c2" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">菜单href</label>
									<div class="col-sm-9">
										<input type="text" id="c3" class="form-control">
									</div>
								</div>
							</div>

							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">菜单排序</label>
									<div class="col-sm-9">
										<input type="text" id="c4" class="form-control">
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
		$(function() {
			menuAdd.initial();
		});
		var menuAdd = {
			initial : function initial() {
				this.bindSubmitForm();
			},
			bindSubmitForm : function bindSubmitForm() {
				var form = $("form#menu-add-form");
				form.submit(function() {
					if (true) {
						var data = new Object();
						data.id = 0;
						data.menuName = $("#menuname").val();
						data.href = $("#menuhref").val();
						data.sequence = parseInt($("#menusequence").val());
						jQuery.ajax({
							headers : {
								'Accept' : 'application/json',
								'Content-Type' : 'application/json'
							},
							type : "POST",
							url : "admin/navigationbar-add",
							data : JSON.stringify(data),
							success : function(message, tst, jqXHR) {
								if (message.result == "success") {
									return dialog.success(message.messageInfo,"admin/navigationbar-list");
								} else {
									return dialog.error(message.result);
								}
							}
						});
					}
					return false;
				});
			},
		};
		$(function() {
			menuEditor.initial();
		});
		var menuEditor = {
			initial : function initial() {
				this.bindSubmitForm();
			},
			bindSubmitForm : function bindSubmitForm() {
				var form = $("form#menu-editor-form");
				form.submit(function() {
					if (true) {
						var data = new Object();
						data.id = parseInt($("#c1").val());
						data.menuName = $("#c2").val();
						data.href = $("#c3").val();
						data.sequence = parseInt($("#c4").val());
						jQuery.ajax({
							headers : {
								'Accept' : 'application/json',
								'Content-Type' : 'application/json'
							},
							type : "POST",
							url : "admin/navigationbar-edit",
							data : JSON.stringify(data),
							success : function(message, tst, jqXHR) {
								if (message.result == "success") {
									return dialog.success(message.messageInfo,"admin/navigationbar-list");
								} else {
									return dialog.error(message.result);
								}
							}
						});
					}
					return false;
				});
			},
		};

		$(".editor").on('click', function() {
			var index = $(this).data('rownum');
			var row = $('#sample-table-2').find('tr:eq(' + index + ')');
			
			for (var i = 1; i < 5; i = i + 1) {
				var tr = row.find('td:eq(' + i + ')');
				$('#c' + i).val(tr.text());

			}
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
	<jsp:include page="../../foot.jsp"></jsp:include>
</body>
</html>
