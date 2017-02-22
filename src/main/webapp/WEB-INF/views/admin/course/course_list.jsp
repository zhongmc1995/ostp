<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>教程</title>

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
				<li><i class="icon-dashboard"></i> <a>教程管理</a></li>
				<li class="active">教程列表</li>
			</ul>
			<!-- .breadcrumb -->
		</div>
		<div class="page-content">
			<div class="page-header">
				<h1>
					教程列表 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->
			<div>
				<div class="row">
					<div class="col-xs-12">
						<form method="post" id="findform" class="clearfix form-actions" action="admin/course-list">
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1">教程标题</label>
										<div class="col-sm-9">
											<input type="text" name="coursetitle" id="coursetitle" value="${page.params.coursetitle}"
												 placeholder="教程标题" class="form-control">	
											<input type="hidden" name="pageNo" id="pageNo" value="${page.pageNo}"
												 placeholder="教程标题" class="form-control">
										</div>
									</div>
								</div>
								<div class="col-sm-4">
									<!--添加下拉菜单-->
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-2">运动类型</label>
										<div class="col-sm-9">
											<select class="form-control" name="sporttypeid"
												id="sporttypeid">
												<option value="">全部</option>
												<c:forEach items="${sporttypelist}" var="sporttype">
													<option
														${sporttype.sporttypeid==page.params.sporttypeid?'selected="selected"':''}
														value="${sporttype.sporttypeid}">
														${sporttype.sporttypename}</option>
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

				</div>
				<br>
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-xs-12">
									<div class="row">
										<div class="col-sm-6">
											<div class="dataTables_info" id="sample-table-2_info">
												<div class="btn-group">
													<a class="btn btn-info" href="admin/course-add"> <i
														class="icon-edit bigger-125"></i> 添加教程
													</a>
												</div>
											</div>
										</div>
										<div class="col-sm-6"></div>
									</div>
									<div class="table-header">教程信息</div>
									<div class="table-responsive">
										<table id="sample-table-2"
											class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">选择</th>
													<th>序号</th>
													<th>教程标题</th>
													<th>教程作者</th>
													<th>运动类型</th>
													<th>关键字</th>
													<th>是否可用</th>													
												<!-- 	<th><i class="icon-time bigger-110 hidden-480"></i>
														创建时间</th>
													<th><i class="icon-time bigger-110 hidden-480"></i>
														更新时间</th> -->
													<th>点击量</th>
													<th class="hidden-480">操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${page.results}" var="item"
													varStatus="status">
													<tr>
														<td class="center"><label> 
															<input type="checkbox" class="ace" /> 
															<span class="lbl"></span>
														</label></td>
														<td><a href="javascript:void(0);">${(page.pageNo-1)*page.pageSize + status.index + 1}</a>
														</td>
														<td><a href="javascript:void(0);">${item.coursetitle}</a>
														</td>
														<td><a href="javascript:void(0);">${item.courseauthor}</a>
														</td>
														<c:forEach items="${sporttypelist}" var="sporttype">
															<c:if test="${sporttype.sporttypeid ==item.sporttypeid}">
																<td>${sporttype.sporttypename}</td>
															</c:if>
														</c:forEach>
														<td>${item.keywords}</td>
														<td>${item.enabled}</td>
														<%-- <td><fmt:formatDate value="${item.createtime}"
																pattern="yyyy-MM-dd" /></td>
														<td><fmt:formatDate value="${item.updatetime}"
																pattern="yyyy-MM-dd" /></td> --%>
														<td>${item.clicktimes}</td>
														<td>		
															<div
																class="visible-md visible-lg hidden-sm hidden-xs action-buttons">

																<a class="blue"
																	href="admin/course-view/${item.courseid}"> <i
																	class="icon-search bigger-130"></i> 详情
																</a> <a class="green"
																	href="admin/course-update/${item.courseid}"> <i
																	class="icon-pencil bigger-130"></i> 编辑
																</a> <a class="red" style="cursor:pointer;" data-url="admin/course-del/${item.courseid}"> 
																	<i class="icon-trash bigger-130"></i>
																	删除
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
												<ul class="pagination">
													<li>${pageStr}</li>
												</ul>
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
	<jsp:include page="../foot.jsp"></jsp:include>
	<script type="text/javascript">
		$(".pagebutton").click(function(){
			$("#pageNo").val($(this).data("id"));
			$("#coursetitle").val("${page.params.coursetitle}");
			$("#sporttypeid").val("${page.params.sporttypeid}");
			$("#findform").submit();
		});
		$(".btn-success").click(function(){
			$("#pageNo").val($("#toGoPage").val());
			$("#coursetitle").val("${page.params.coursetitle}");
			$("#sporttypeid").val("${page.params.sporttypeid}");
			$("#findform").submit();
		});
	</script>
	<script src="resources/js/laydate/laydate.js"></script>
	<script src="resources/js/myjs/course.js"></script>	
</body>
</html>
