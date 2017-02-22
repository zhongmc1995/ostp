<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>基础数据管理</title>
<base href="<%=basePath%>">
<jsp:include page="../head.jsp"></jsp:include>
</head>

<body>
	<!--将这一部分1转化成ifream-->
	<div class="main-content" style="margin-left: 0px; margin-bottom: 0px;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

			<ul class="breadcrumb">
				<li><i class="icon-folder-open-alt"> 基础数据管理</i> <a href="#"></a>
				</li>
				<li class="active">装备功能类型</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					装备功能类型 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					
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
														data-target="#equipTypeAdd">
														<i class="icon-edit bigger-125"></i> <a href="#"
															class="green"> <i class="icon-double-angle-right"></i>
															添加文档
														</a>
													</button>
													<input type="hidden" id="id" />
													
												</div>
											</div>
										</div>
										<div class="col-sm-6"></div>
									</div>

									<div class="table-header">装备功能类型信息</div>

									<div class="table-responsive">
										<table id="sample-table-2"
											class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>序号</th>
													<th>装备类型</th>
													<th>备注</th>
													<th>创建人</th>
													<th>创建时间</th>
													<th>更新人</th>
													<th>更新时间</th>
													<th class="hidden-480">操作</th>

												</tr>
											</thead>

											<tbody>
												<c:forEach items="${basicEquipTypeList}" var="item" varStatus="status">
													<tr>
													 	<input type="hidden" class="ace" value="${item.equiptypeid}"/>
														<td>${status.index + 1}</td>
														<td class="equiptypename">${item.equiptypename}</td>
														<td class="note">${item.note}</td>
														<td class="createBy">${item.createBy}</td>
														<td class="createDate"><fmt:formatDate value="${item.createDate}"
																pattern="yyyy-MM-dd" /></td>
														<td class="updateBy">${item.updateBy}</td>
														<td class="updateDate"><fmt:formatDate value="${item.updateDate}"
																pattern="yyyy-MM-dd" /></td>
														<td>
															<div
																class="visible-md visible-lg hidden-sm hidden-xs action-buttons">

																<a class="green" style="cursor: pointer;" data-toggle="modal" data-target="#equidTypeUpdate" id="${status.index}"> <i
																	class="icon-pencil bigger-130"></i> 编辑
																</a> 
																<a class="red delete_a" style="cursor: pointer;"
																	data-id="${item.equiptypeid}" >
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
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="equipTypeAdd" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-padding">
					<div class="table-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="white">×</span>
						</button>
						添加
					</div>
				</div>

				<div class="modal-body no-padding">
					<form class="clearfix form-actions" id="equipTypeform" method="POST">
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">装备功能类型</label>
									<div class="col-sm-9">
										<input type="text" id="equiptypename" placeholder="tilte"
											class="form-control" required="required" oninvalid="setCustomValidity('请输入装备类型')" oninput="setCustomValidity('')">
									</div>
								</div>
							</div>
							<br />
							<div class="col-xs-12" style="margin-top: 20px;">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">备注</label>

									<div class="col-sm-9">
										<textarea id="note" class="form-control" style="min-height: 200px;"></textarea>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="form-actions">
								<div class="text-center">
									<button class="btn btn-primary" type="submit">
										<i class="icon-ok bigger-110"></i> 保存
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn btn-info" type="reset">
										<i class="icon-undo bigger-110"></i> 重置
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div id="equidTypeUpdate" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-padding">
					<div class="table-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true" id="close_btn2">
							<span class="white">×</span>
						</button>
						编辑
					</div>
				</div>

				<div class="modal-body no-padding">
					<form id="equipTypeform2" method="POST"
						class="clearfix form-actions">
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-2">装备类型</label>
									<div class="col-sm-9">
										<input type="text" id="equiptypename2" placeholder="tilte"
											class="form-control" required="required" oninvalid="setCustomValidity('请输入装备类型')" oninput="setCustomValidity('')">
									</div>
								</div>
							</div>
							<br />
							<div class="col-xs-12" style="margin-top: 20px;">
								<div class="form-group">
									<label 
										class="col-sm-3 control-label no-padding-right"
										for="form-field-1">备注</label>

									<div class="col-sm-9">
										<textarea id="note2" class="form-control" style="min-height: 200px;"></textarea>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="form-actions">
								<div class="text-center">
									<button class="btn btn-primary" id="submit1" type="submit">
										<i class="icon-ok bigger-110"></i> 保存
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn btn-info" type="reset">
										<i class="icon-undo bigger-110"></i> 重置
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			equipTypeform.initial();
			//查询记录
			equidTypeUpdate.initial();
		});

		var equipTypeform = {

			initial : function initial() {
				this.bindSubmitForm();
			},

			bindSubmitForm : function bindSubmitForm() {
				var form = $("form#equipTypeform");

				form.submit(function() {
					var result=equipTypeform.check();
					if (result) {
						var data = new Object();
						data.equiptypename = $("#equiptypename").val();
						data.note = $("#note").val();
						jQuery.ajax({
							headers : {
								'Accept' : 'application/json',
								'Content-Type' : 'application/json'
							},
							type : "POST",
							url : "/ostp/admin/equipType-add",
							data : JSON.stringify(data),
							success : function(message, tst, jqXHR) {

								if (message.result == "success") {
									 return dialog.success(message.messageInfo,"/ostp/admin/equipType-list");
								} else {
									return dialog.success(message.messageInfo,"/ostp/admin/equipType-list");
									
								}
								//location.href="/ostp/admin/equipType-list";
							}
						});
					}
					return false;
				});
			},
			check:function check(){
				var isOk=true;
				$(".equiptypename").each(function(){
				    if($(this).text()==$("#equiptypename").val())
				    {
				    	layer.alert('该类型已存在，请从新输入', {
				    		  skin: 'layui-layer-molv' //样式类名
				    		  ,closeBtn: 0
				    		});
				    	isOk=false;
				    }
				  });
			    return isOk;
			}

		};

		var equidTypeUpdate = {

				initial : function initial() {
					this.bindSubmitForm();
				},

				bindSubmitForm : function bindSubmitForm() {
					var form = $("form#equipTypeform2");

					form.submit(function() {
						if (true) {
							var data = new Object();
							data.equiptypeid= $("input#id").val();
							data.equiptypename = $("input#equiptypename2").val();
							data.note = $("textarea#note2").val();
							//alert(data);
							jQuery.ajax({
								headers : {
									'Accept' : 'application/json',
									'Content-Type' : 'application/json'
								},
								type : "POST",
								url : "/ostp/admin/equipType-update",
								data : JSON.stringify(data),
								success : function(message, tst, jqXHR) {
									
									var close_btn = $("#close_btn2");
									close_btn.click();
									if (message.result == "success") {										
										return dialog.success(message.messageInfo,"/ostp/admin/equipType-list");
									} else {
										return dialog.error(message.messageInfo);
									}
								}
							});
							//$("#submit1").attr("data-dismiss","modal");
						}
						return false;
					});
				}

			};
		
	$("a.green").click(function(){
		var index = $(this).attr("id");
		var equiptypename = $("td.equiptypename").eq(index).text();
		var note = $("td.note").eq(index).text();
		var equiptypeid = $("input.ace").eq(index).val();
		
	
		$("input#equiptypename2").val(equiptypename);
		$("textarea#note2").val(note);
		$("input#id").val(equiptypeid);
		
	});
	var SCOPE={
			'del_url':'/ostp/admin/equipType-del',
			'index_url':'/ostp/admin/equipType-list',
	}
	</script>
<script src="resources/js/myjs/info.js"></script>
	<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>
