<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
    	<base href="<%=basePath%>">
    	<title>资讯</title>
    	
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
								<a href="#">资讯管理</a>
							</li>
							<li class="active">资讯列表</li>
						</ul><!-- .breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								资讯列表
								<small>
									<i class="icon-double-angle-right"></i>
									 查看
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-xs-12">
										<!-- PAGE CONTENT BEGINS -->
	
										<div class="row">
											<div class="col-xs-12">
												<form action="admin/info-search"  method="POST" class="clearfix form-actions">
													<div class="row">
														<div class="col-sm-4">
															<div class="form-group">
																<label class="col-sm-3 control-label no-padding-right" for="form-field-1">文章标题</label>
						
																<div class="col-sm-9">
																	<input type="text" id="form-field-1" placeholder="tilte" class="form-control">
																</div>
															</div>
														</div>
														<div class="col-sm-4">
															<!--添加下拉菜单-->
															<div class="form-group">
																<label class="col-sm-4 control-label no-padding-right" for="form-field-1">户外运动类型</label>
						
																<div class="col-sm-8">
																	<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
																	<select class="form-control" name="sporttypeid">
																		<option value="" >请选择运动类型</option>
																		<c:forEach items="${sportType}" var="sportType">
																				<option value="${sportType.	SportTypeID }">${sportType.	SportTypeName }</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-group">
																<label class="col-sm-3 control-label no-padding-right" for="form-field-1">起始时间</label>
						
																<div class="col-sm-9">
																	<div class="input-group">
																		<input class="form-control date-picker date_calendar " type="text" name="beginTime">
																		<span class="input-group-addon">
																			<i class="icon-calendar bigger-110"></i>
																		</span>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<br />
													<div class="row">
														<div class="col-sm-4">
															<div class="form-group">
																<label class="col-sm-4 control-label no-padding-right" for="form-field-1">一级类目</label>
						
																<div class="col-sm-8">
																	<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
																	<select class="form-control" id="first_select" name="firstlevelinfotypeid">
																		<option value="" >请选择一级类目</option>
																		<c:forEach items="${firstLevelType }" var="firstLevelType">
																				<option value="${firstLevelType.FirstLevelInfoTypeID }">${firstLevelType.FirstLevelInfoTypeName }</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-group">
																<label class="col-sm-4 control-label no-padding-right" for="form-field-1">二级类目</label>
						
																<div class="col-sm-8" id="second_select">
																	<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
																	<select class="form-control" name="secondlevelinfotypeid" id="second-level">
																		<option value="" >请选择二级类目</option>
																		<c:forEach items="${secondLevel }" var="secondLevel">
																				<option value="${secondLevel.secondlevelinfotypeid}">${secondLevel.secondlevelinfotypename}</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>
														<div class="col-sm-4">
															<div class="form-group">
																<label class="col-sm-3 control-label no-padding-right" for="form-field-1">结束时间</label>
						
																<div class="col-sm-9">
																	<div class="input-group">
																		<input class="form-control date-picker date_calendar" type="text" name="endTime">
																		<span class="input-group-addon">
																			<i class="icon-calendar bigger-110"></i>
																		</span>
																	</div>
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
																	查询
																</button>
					
																&nbsp; &nbsp; &nbsp;
																<button class="btn btn-primary" type="reset">
																	<i class="icon-undo bigger-110"></i>
																	重置
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
																<a class="btn btn-info" href="admin/info-add">
																	<i class="icon-edit bigger-125"></i> 添加文档
																</a>
															</div>
														</div>
													</div>
													<div class="col-sm-6">
														
													</div>
												</div>
												
												<div class="table-header">
													资讯更新信息
												</div>
		
												<div class="table-responsive">
													<table id="sample-table-2" class="table table-striped table-bordered table-hover">
														<thead>
															<tr>
																<th class="center">选择</th>
																<th>序号</th>
																<th>文章标题</th>
																<th>运动类型</th>
																<th>一级类目</th>
																<th>二级类目</th>
																<th>文章来源</th>
																<th>关键字</th>
																<th>
																	<i class="icon-time bigger-110 hidden-480"></i>
																	创建时间
																</th>
																<th class="hidden-480">操作</th>
		
															</tr>
														</thead>
					
														<tbody>
														<c:forEach items="${page.results}" var="item" varStatus="status">
														<c:out value="${ item.infoFirstLevelType}"></c:out>
															<tr>
																<td class="center">
																	<label>
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>
																</td>
		
																<td>
																	<a href="#">${(page.pageNo-1)*page.pageSize + status.index + 1}</a>
																</td>
																<td>
																	<a href="#">${item.title}</a>
																</td>
																<td>
																	<a href="javascript:void(0)">
																		<c:forEach items="${sportType}" var="sportType">
																			<c:if test="${sportType.SportTypeID eq item.sporttypeid }">
																				${sportType.SportTypeName }
																			</c:if>
																		</c:forEach>
																	</a>
																</td>
																<td>
																	<c:forEach items="${firstLevelType }" var="firstLevelType">
																		<c:if test="${firstLevelType.FirstLevelInfoTypeID eq item.firstlevelinfotypeid}">
																			${firstLevelType.FirstLevelInfoTypeName }
																		</c:if>
																	</c:forEach>
																</td>
																<td>
																	<c:forEach items="${allSecondLevel }" var="secondLevel">
																		<c:if test="${secondLevel.secondlevelinfotypeid eq item.secondlevelinfotypeid}">
																			${secondLevel.secondlevelinfotypename}
																		</c:if>
																	</c:forEach>
																</td>
																<td>${item.copyfrom}</td>
																<td class="hidden-480">${item.keywords}</td>
																<td><fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
																<td>
																	<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																		
																		<a class="blue" href="admin/info-view/${item.infoId}">
																			<i class="icon-search bigger-130"></i> 详情
																		</a>
																		<a class="green" href="admin/info-edit/${item.infoId}">
																			<i class="icon-pencil bigger-130"></i> 编辑
																		</a>
																		<a class="red delete_a" href="javascript:void(0);"  data-id="${item.infoId}">
																			<i class="icon-trash bigger-130"></i> 删除
																		</a>
																	</div>
		
																	<div class="visible-xs visible-sm hidden-md hidden-lg">
																		<div class="inline position-relative">
																			<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
																				<i class="icon-caret-down icon-only bigger-120"></i>
																			</button>
		
																			<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																				<li>
																					<a href="admin/info-view/${item.infoId}" class="tooltip-info" data-rel="tooltip" title="View">
																						<span class="blue">
																							<i class="icon-zoom-in bigger-120"></i>
																						</span>
																					</a>
																				</li>
		
																				<li>
																					<a href="admin/info-edit/${item.infoId}" class="tooltip-success" data-rel="tooltip" title="Edit">
																						<span class="green">
																							<i class="icon-edit bigger-120"></i>
																						</span>
																					</a>
																				</li>
		
																				<li>
																					<a href="javascript:void(0);" class="tooltip-error delete delete_a" data-id="${item.infoId}"  data-rel="tooltip" title="Delete">
																						<span class="red">
																							<i class="icon-trash bigger-120"></i>
																						</span>
																					</a>
																				</li>
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
															<ul class="pagination">
																	${pageStr}
															</ul>
														</div>
													</div>
												</div>
												
											</div>
										</div>
									</div><!-- /.col -->
								</div><!-- /.row -->
							
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

			
		<jsp:include page="../foot.jsp"></jsp:include>
		
	
		<script type="text/javascript">
		function getSecondLevelTypeByFirstID() {
			var firstLevelTypeID = $("#first_select").val();
			$.ajax({
				url:"admin/info-getSecondLevelTypeByFirstID/"+firstLevelTypeID,
				type:"POST",
				dataType:"json",
				success: function(data) {
					var length = data.length;
					if (length > 0) {
						var html = "";
						for (var i = 0; i < length; i++) {
							html += "<option value="+data[i].secondlevelinfotypeid+">"+data[i].secondlevelinfotypename+"</option>";
						}
						$("#second-level").empty().append(html);
					} else
						$("#second-level").empty().append("<option value=\"\">暂无数据</option>");
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert("系统出错！");
				},
			});
		}
		/**
		 * 当选择了一级资讯之后更新二级资讯
		 */
		$("#first_select").on("change",function(){
			getSecondLevelTypeByFirstID();
		});
		
				/**
				 * 当选择了一级资讯之后更新二级资讯
		 		*/
				$("#first_select").on("change",function(){
					getSecondLevelTypeByFirstID();
				});
				
				$('.date_calendar').datetimepicker({
				    timeFormat: "HH:mm:ss",
				    dateFormat: "yy-mm-dd",
					showSecond:true,
					beforeShow:function(input){
						$(input).css({
							"position":"relative",
							"z-index":9999
						});
					} 
				});
				var SCOPE = {
				 'index_url':'admin/info-list',
				 'del_url' : 'admin/info-del',
				 }
		</script>
		<script src="resources/js/dialog/layer.js"></script>
		<script src="resources/js/myjs/dialog.js"></script>
		<script src="resources/js/myjs/info.js"></script>
</body>
</html>
