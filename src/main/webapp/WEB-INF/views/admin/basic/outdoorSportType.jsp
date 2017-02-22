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
<title>基础数据管理</title>
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
				<li><i class="icon-folder-open-alt"> 基础数据管理</i> <a href="#"></a>
				</li>
				<li class="active">户外运动类型</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					户外运动类型 <small> <i class="icon-double-angle-right"></i> 查看
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
														data-target="#sportTypeAdd">
														<i class="icon-edit bigger-125"></i> <a 
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

									<div class="table-header">户外运动类型信息</div>

									<div class="table-responsive">
										<table id="sample-table-2"
											class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>序号</th>
													<th>名称</th>
													<th>备注</th>
													<th>创建人</th>
													<th>创建时间</th>
													<th>更新人</th>
													<th>更新时间</th>
													<th class="hidden-480">操作</th>

												</tr>
											</thead>
											<tbody>
											
												<c:forEach items="${sportTypeList}" var="item"
													varStatus="status">
													<tr>
														 <input type="hidden" class="ace" value="${item.sporttypeid}"/>
														<td>${status.index + 1}</td>
														<td class="sporttypename">${item.sporttypename}</td>
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
																
																<a class="green"  data-toggle="modal" style="cursor: pointer;"
														data-target="#sportTypeUpdate" id="${status.index}" > <i
																	class="icon-pencil bigger-130"></i> 编辑
																</a> <a class="red delete_a" style="cursor: pointer;"
																	data-id="${item.sporttypeid}" >
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

	<div id="sportTypeAdd" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-padding">
					<div class="table-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true" id="close_btn1">
							<span class="white">×</span>
						</button>
						添加
					</div>
				</div>

				<div class="modal-body no-padding">
					<form id="sportTypeform" method="POST"
						class="clearfix form-actions">
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">户外运动类型</label>
									<div class="col-sm-9">
										<input type="text" id="form-field-1" placeholder="tilte" name="sportTypeName"
											class="form-control" required="required" oninvalid="setCustomValidity('请输入户外运动类型')" oninput="setCustomValidity('')">
									</div>
									<!-- <span id="check"></span> -->
									<script>
									
									
									</script>
								</div>
							</div>
							<br />
							<div class="col-xs-12" style="margin-top: 20px;">
								<div class="form-group">
									<label 
										class="col-sm-3 control-label no-padding-right"
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
									<button class="btn btn-primary" id="submit" type="submit" onclick="check()">
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
	
	<div id="sportTypeUpdate" class="modal fade in" tabindex="-1"
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
					<form id="sportTypeform2" method="POST" name="sportTypeform2"
						class="clearfix form-actions">
						<div class="row">
							<!-- <div class="col-xs-12" style="display: no">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-2">户外运动ID</label>
									<div class="col-sm-9">
										<input type="text" id="sporttypeid" placeholder="tilte" 
											class="form-control">
									</div>
									
								</div>
							</div> -->
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-2">户外运动类型</label>
									<div class="col-sm-9">
										<input type="text" id="form-field-2" placeholder="tilte" 
											class="form-control" required="required" oninvalid="setCustomValidity('请输入户外运动类型')" oninput="setCustomValidity('')">
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
	<jsp:include page="../foot.jsp"></jsp:include>

	<script>
		$(function() {
			sportTypeAdd.initial();
			//查询记录
			sportTypeUpdate.initial();
		});

		var sportTypeAdd = {

			initial : function initial() {
				this.bindSubmitForm();
			},

			bindSubmitForm : function bindSubmitForm() {
				var form = $("form#sportTypeform");
				
				form.submit(function() {
					var result=sportTypeAdd.check();
					if (result) {
						var data = new Object();
						data.sporttypename = $("#form-field-1").val();
						data.note = $("#note").val();
						jQuery.ajax({
							headers : {
								'Accept' : 'application/json',
								'Content-Type' : 'application/json'
							},
							type : "POST",
							url : "/ostp/admin/outdoorSportType-add",
							data : JSON.stringify(data),
							success : function(message, tst, jqXHR) {
								var close_btn = $("#close_btn1");
								close_btn.click();
								if (message.result == "success") {
									 return dialog.success(message.messageInfo,"/ostp/admin/outdoorSportType-list");
								} else {
									return dialog.success(message.messageInfo,"/ostp/admin/outdoorSportType-list");
									
								}
								//location.href="/ostp/admin/outdoorSportType-list";
							}
						});
						//$("#submit1").attr("data-dismiss","modal");
					}
					return false;
				});
				
			},
			check:function check(){
				var isOk=true;
				$(".sporttypename").each(function(){
				    if($(this).text()==$("#form-field-1").val())
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
		
		
		var sportTypeUpdate = {

				initial : function initial() {
					this.bindSubmitForm();
				},

				bindSubmitForm : function bindSubmitForm() {
					var form = $("form#sportTypeform2");

					form.submit(function() {
						if (true) {
							var data = new Object();
							data.sporttypeid= $("input#id").val();
							data.sporttypename = $("input#form-field-2").val();
							data.note = $("textarea#note2").val();
							//alert(data);
							jQuery.ajax({
								headers : {
									'Accept' : 'application/json',
									'Content-Type' : 'application/json'
								},
								type : "POST",
								url : "/ostp/admin/outdoorSportType-update",
								data : JSON.stringify(data),
								success : function(message, tst, jqXHR) {
									
									var close_btn = $("#close_btn2");
									close_btn.click();
									if (message.result == "success") {										
										return dialog.success(message.messageInfo,"/ostp/admin/outdoorSportType-list");
									} else {
										return dialog.erro(message.messageInfo);
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
		var sporttypename = $("td.sporttypename").eq(index).text();
		var note = $("td.note").eq(index).text();
		var sporttypeid = $("input.ace").eq(index).val();
	
		$("input#form-field-2").val(sporttypename);
		$("textarea#note2").val(note);
		$("input#id").val(sporttypeid);
		
	});
	var SCOPE={
			'del_url':'/ostp/admin/outdoorSportType-del',
			'index_url':'/ostp/admin/outdoorSportType-list',
	}
	</script>
<script src="resources/js/myjs/info.js"></script>
</body>
</html>
