<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>装备列表</title>

<jsp:include page="../head.jsp"></jsp:include>


</head>
<body>
	<!--将这一部分1转化成iframe-->
	<div class="main-content" style="margin-left: 0px; margin-bottom: 0px;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				$(".btn-success").attr('onclick','');
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>
			
			<ul class="breadcrumb">
				<li><i class="icon-dashboard"></i> <a href="javascript:void(0);">装备管理</a></li>
				<li class="active">装备列表</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					装备列表 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->
			
			<div class="row">
				<div class="col-xs-12">
					<!-- 表单 -->
					<form action="admin/equip-list" id="findform" method="post" class="clearfix form-actions">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">装备</label>

									<div class="col-sm-9">
										<input type="text" name="equipname" id="equipname" value="${page.params.equipname}" placeholder="装备名称"
											class="form-control">
										<input type="hidden" name="pageNo" id="pageNo"  placeholder="装备名称"
											class="form-control">
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<!--添加下拉菜单-->
								<div class="form-group">
									<label class="col-sm-4 control-label no-padding-right"
										for="form-field-1">运动类型</label>
									<div class="col-sm-8">
										<select class="form-control" name="sporttypeid" id="sporttypeid">
											<option value="">全部</option>
											<c:forEach items="${sporttypelist}" var="sporttype">
												<option ${sporttype.sporttypeid==page.params.sporttypeid?'selected="selected"':''} value="${sporttype.sporttypeid}">
													${sporttype.sporttypename}
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">装备类型</label>

									<div class="col-sm-9">
										<select class="form-control" name="equiptypeid" id="equiptypeid">
											<option value="">全部</option>
											<c:forEach items="${equiptypelist}" var="equiptype">
												<option ${equiptype.equiptypeid==page.params.equiptypeid?'selected="selected"':''} value="${equiptype.equiptypeid}">
													${equiptype.equiptypename}
												</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="form-actions">
								<div class="col-sm-offset-5 col-md-3">
									<button class="btn btn-primary" type="submit">
										<i class="icon-ok bigger-110"></i> 查询
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

				<div class="col-xs-12">

					<div class="row">
						<div class="col-sm-6">
							<div class="dataTables_info" id="sample-table-2_info">
								<div class="btn-group">
									<a class="btn btn-info" href="admin/equip-add"> <i
										class="icon-edit bigger-125"></i> 添加文档
									</a>
								</div>
							</div>
						</div>
						<div class="col-sm-6"></div>
					</div>

					<div class="table-header">资讯更新信息</div>



					<div class="table-responsive">
						<table id="sample-table-2"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">选择</th>
									<th>装备ID</th>
									<th>装备名称</th>
									<th>装备价格</th>
									<th>装备参数</th>
									<th>推荐</th>
									<th>运动类型</th>
									<th>装备功能类型</th>
									<th>是否可用</th>
									<th class="hidden-480">操作</th>

								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.results}" var="item" varStatus="status">
									<tr>
										<td class="center"><label> <input type="checkbox"
												class="ace" /> <span class="lbl"></span>
										</label></td>
										<td><a href="#">${(page.pageNo-1)*page.pageSize + status.index + 1}</a></td>
										<td>${item.equipname}</td>
										<td>${item.equipprice}</td>
										<td>${item.equipparam}</td>
										<td>${item.equiprecommend}</td>
										<td class="hidden-480">${item.sporttypeid}</td>
										<td>${item.equiptypeid}</td>
										
										<td>${item.enabled}</td>
										<td>
											<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<a class="blue" href="admin/equip-view?equipid=${item.equipid}"> <i
													class="icon-search bigger-130"></i> 详情
												</a> <a href="admin/equip-edit?equipid=${item.equipid}" class="green"> <i
													class="icon-pencil bigger-130"></i> 编辑
												</a><a class="red" href="javascript:void(0);"
													data-did="${item.equipid}"> <i
													class="icon-trash bigger-130"></i> 删除
												</a>
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
								<ul class="pagination">${pageLabal}</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- /.col -->
	</div>


	<!-- PAGE CONTENT ENDS -->



	<jsp:include page="../foot.jsp"></jsp:include>
	
	<!-- 删除equip -->
	<script type="text/javascript">
		$(".red").click(function() {
			var data = new Object();
			data.equipid = $(this).data('did');
			//alert(data.equipid);
			jQuery.ajax({
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				type : "POST",
				url : "admin/equip-delete",
				data : JSON.stringify(data),
				success : function(message, tst, jqXHR) {
					if (message.result == "success") {
						return dialog.success(message.messageInfo,"/ostp/admin/equip-list");
					} else {
						return dialog.error(message.result);
					}
				}
			});
		})
	</script>
	
	
	<!-- a标签form表单提交 -->
	<script type="text/javascript">
	$(".pagebutton").click(function(){
		$("#pageNo").val($(this).data('id'));
		$("#equipname").val("${page.params.equipname}");
		$("#equiptypeid").val("${page.params.equiptypeid}");
		$("#sporttypeid").val("${page.params.sporttypeid}");
		$("#findform").submit();
	})
	</script>
	
	
	<!-- 按钮查询 -->
	<script type="text/javascript">
	$(".btn-success").click(function(){
		$("#pageNo").val($("#toGoPage").val());
		$("#equipname").val("${page.params.equipname}");
		$("#equiptypeid").val("${page.params.equiptypeid}");
		$("#sporttypeid").val("${page.params.sporttypeid}");
		$("#findform").submit();
	})
	</script>

</body>
</html>
