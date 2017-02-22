<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>行程内容列表</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<jsp:include page="../head.jsp"/>
		<style type="text/css">
			.btn-mini,#toGoPage{
				display: none;
			}
		</style>

	</head>

	<body style="background:#fff;">
				
	<!--将这一部分1转化成ifream-->
	<div class="main-content" style="margin-left:0;margin-bottom:0;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>

			<ul class="breadcrumb">
				<li>
					<i class="icon-dashboard"></i>
					<a href="#">行程管理</a>
				</li>
				<li class="active">行程列表</li>
			</ul><!-- .breadcrumb -->
			
		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					行程列表
					<small>
						<i class="icon-double-angle-right"></i>
						 查看
					</small>
				</h1>
			</div><!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<div class="row">
								<div class="col-xs-12">
									<form id="travel-select" action="admin/travel-list" method="post">
										<div class="row">
											<div class="col-sm-4">
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right" for="form-field-1">行程名称</label>
													<div class="col-sm-9">
														<c:if test="${tripTravelInfo.travelname != null }">
                                                        	<input type="text" name="travelname" id="form-field-1" placeholder="行程名称" class="form-control" value="${tripTravelInfo.travelname }">
                                                        </c:if>
                                                        <c:if test="${tripTravelInfo.travelname == null }">
                                                        	<input type="text" name="travelname" id="form-field-1" placeholder="行程名称" class="form-control">
                                                        </c:if>
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
															<option value=""></option>
															<c:forEach items="${sportType }" var="sportType" varStatus="status">
																<c:choose>
																	<c:when test="${tripTravelInfo.sporttypeid == sportType.SportTypeID }">
																		<option value="${sportType.SportTypeID }" selected="selected">${sportType.SportTypeName }</option>
																	</c:when>
																	<c:otherwise>
																		<option value="${sportType.SportTypeID }">${sportType.SportTypeName }</option>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right" for="form-field-1">关键字</label>
			
													<div class="col-sm-9">
														<c:if test="${tripTravelInfo.keyword != null }">
                                                        	<input type="text" name="keyword" id="form-field-1" placeholder="关键字" class="form-control" value="${tripTravelInfo.keyword }">
                                                        </c:if>
                                                        <c:if test="${tripTravelInfo.keyword == null }">
                                                        	<input type="text" name="keyword" id="form-field-1" placeholder="关键字" class="form-control">
                                                        </c:if>
													</div>
												</div>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-sm-offset-5 col-sm-1 text-center">
												<input type="submit" class="btn btn-success" value="查询">
											</div>
											<div class="col-sm-1 text-center">
												<input type="button" class="btn btn-info" value="重置">
											</div>
										</div>
									</form>
								</div>
								<div class="col-xs-12">
									
									<div class="row">
										<div class="col-sm-6">
											<div class="dataTables_info" id="sample-table-2_info">
												<div class="btn-group">
													<button class="btn btn-info">
														<i class="icon-th-list bigger-125"></i> 列表
													</button>
												</div>
											</div>
										</div>
										<div class="col-sm-6">
											
										</div>
									</div>
									
									<div class="table-header">
										行程列表信息
									</div>

									<div class="table-responsive">
										<table id="sample-table-2" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>													
												<th class="center">选择</th>
													<th>序号</th>
													<th>行程名称</th>
													<th>运动类型</th>
													<th>注意事项</th>
													<th>关键字</th>
													<th>
														<i class="icon-time bigger-110 hidden-480"></i>
														创建时间
													</th>
													<th class="hidden-480">操作</th>

												</tr>
											</thead>

											<tbody>
												<c:choose>
													<c:when test="${fn:length(tripTravelInfos.results) > 0}">
														<c:forEach items="${tripTravelInfos.results }" var="tripTravelInfo" varStatus="status">
															<tr>
																<td class="center">
																	<label>
																		<input type="checkbox" class="ace" />
																		<span class="lbl"></span>
																	</label>
																</td>
																<td>
																	<input type="text" hidden="hidden" value="${tripTravelInfo.travelid }">
																	${status.index + 1 }
																</td>
																<td>
																	${tripTravelInfo.travelname }
																</td>
																<td>
																	${tripTravelInfo.basicSportType.sporttypename }
																</td>
																<td>
																	${tripTravelInfo.attention }
																</td>
																<td>
																	${tripTravelInfo.keyword }
																</td>
																<td>
																	${tripTravelInfo.creattime }
																</td>
																<td>
																	<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																		
																		<a class="blue" href="admin/travel-view?travelid=${tripTravelInfo.travelid }&sporttypeid=${tripTravelInfo.sporttypeid }">
																			<i class="icon-search bigger-130"></i> 详情
																		</a>
																		
																		<a class="green" href="admin/travel-edit?travelid=${tripTravelInfo.travelid }&sporttypeid=${tripTravelInfo.sporttypeid }">
																			<i class="icon-edit bigger-130"></i> 编辑<!-- edit  pencil -->
																		</a>
			
																		<a class="red delete_a" href="javascript:void(0)" attr-id="${tripTravelInfo.travelid }">
																			<i class="icon-trash bigger-130"></i> 删除
																		</a>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td colspan="8" align="center">对不起，暂无数据！</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
									<div class="row">
										<div class="col-sm-8 col-sm-offset-4">
											<div class="dataTables_paginate paging_bootstrap">
												<ul class="pagination">${pageStr}
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
	<jsp:include page="../foot.jsp"/>
	<script src="resources/js/myjs/info.js"></script>
	<script src="resources/js/myjs/dialog.js"></script>
	<script type="text/javascript">
	var SCOPE = {
			 'index_url':'admin/travel-list',
			// 'add_url' : 'admin/info-add',
			// 'edit_url' : 'admin/info-edit',
			 'del_url' : 'admin/travel-del',
	
	}
	$("body").on("click",".pagination li a",function(){
		var url = $(this).attr("href");
		var datas = $("#travel-select").serialize();
		$(this).attr("href","javascript:;");
		$.ajax({
			url : url,
			type : "POST",
			data : datas,
			async: false,
			dataType : "json",
			success : function(data){
				var pageStr = data[0];
				var travels = data[1];
				var html = "";
				for(var i = 0; i < travels.length; i++) {
					html += "<tr>"
						+"<td class=\"center\">"
							+"<label>"
								+"<input type=\"checkbox\" class=\"ace\" />"
								+"<span class=\"lbl\"></span>"
								/* +"<input type=\"text\" hidden=\"hidden\" value=\""+positions[i].positionid +"\"/>" */
							+"</label>"
						+"</td>"
						+"<td>"+(i + 1)+"</td>"
						+"<td>"+travels[i].travelname +"</td>"
						+"<td>"+travels[i].basicSportType.sporttypename +"</td>"
						+"<td>"+travels[i].attention +"</td>"
						+"<td>"+travels[i].keyword +"</td>"
						+"<td>"+travels[i].creattime+"</td>"
						+"<td>"
							+"<div class='visible-md visible-lg hidden-sm hidden-xs action-buttons'>"
								+"<a class='blue' href='admin/travel-view?travelid="+travels[i].travelid +"&sporttypeid="+travels[i].sporttypeid+ "'>"
									+"<i class=\"icon-search bigger-130\"></i> 详情"
							    +"</a>"
							    +"<a class=\"green\" href=\"admin/travel-edit?travelid="+travels[i].travelid +"&sporttypeid="+travels[i].sporttypeid+ "\">"
						         	+"<i class=\"icon-pencil bigger-130\"></i> 编辑"
							     +"</a>"
							     +" <a class=\"red delete_a\" href=\"javascript:void(0)\" attr-id="+travels[i].travelid +">"
							         +"<i class=\"icon-trash bigger-130\"></i> 删除"
								 +"</a>"
							+"</div>"
						+"</td>"
					+"</tr>";
				}
				$("#sample-table-2 tbody").empty().append(html);
				$(".pagination li").detach();
				//$(".pagination").empty().append(pageStr);
				$(".pagination").append(pageStr);
			},
		});
	});
	
	$("body").on('click',".delete_a",function(){
		console.log(SCOPE);
	     var id=$(this).attr('attr-id');
	     var url=SCOPE.del_url+"/"+id;
	     var data={};
	     layer.open({
	         type:0,
	         title:'是否提交?',
	         btn:['yes','no'],
	         icon:3,
	         closeBtn:2,
	         content:'是否确定删除',
	         scrollbar:true,
	         yes:function(){
	             //执行相关的跳转
	             todelete(url,data);
	         },
	     });
	});
	function todelete(url,data){
	     $.post(url,data,function(s){
	         if(s.result=="success"){
	             return dialog.success(s.messageInfo,SCOPE.index_url);
	             //跳转到相关页面
	         }else{
	             return dialog.error(s.result);
	         }
	     },"JSON");
	 }
	</script>
</body>
</html>

