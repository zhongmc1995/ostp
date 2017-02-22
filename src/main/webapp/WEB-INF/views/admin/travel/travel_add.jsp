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
<title>行程管理——增加</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<jsp:include page="../head.jsp" />
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
<link rel="stylesheet" href="resources/css/mycss/travel.css" />
<style type="text/css">
.btn-mini, #toGoPage {
	display: none;
}
</style>
</head>

<body style="background: #fff; width: 100%;">

	<!--将这一部分1转化成ifream-->
	<div class="main-content" style="margin-left: 0;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>

			<ul class="breadcrumb">
				<li><i class="icon-dashboard"></i> <a href="#">行程管理</a></li>
				<li class="active">行程添加</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content" style="width: 95%;">
			<div class="page-header">
				<h1>
					添加行程 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<form action="admin/insert" method="post">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">行程名称</label>

											<div class="col-sm-9">
												<input type="text" name="travelname" id="form-field-1"
													placeholder="行程名称" required="required"
													oninvalid="setCustomValidity('请输入行程名称')"
													class="form-control">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<!--添加下拉菜单-->
										<div class="form-group">
											<label class="col-sm-4 control-label no-padding-right"
												for="form-field-1">户外运动类型</label>
											<div class="col-sm-8">
												<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
												<select class="form-control" name="sporttypeid">
													<c:forEach items="${sportType }" var="sportType">
														<option value="${sportType.SportTypeID }">${sportType.SportTypeName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">关键字</label>

											<div class="col-sm-9">
												<input type="text" name="keyword" id="form-field-1"
													placeholder="关键字" class="form-control">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<!--添加下拉菜单-->
										<div class="form-group">
											<!-- <label class="col-sm-4 control-label no-padding-right" for="form-field-1">位置</label> -->
											<div class="col-sm-8">
												<!--href="javascript:;"<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
												<input type="button" class="button" id="add_position"
													value="选择位置">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">封面图片</label>
											<div class="col-sm-9">
												<img id="pic" onclick="BrowseServer()"
													style="width: 50px; height: 50px" alt="图片"
													src="resources/img/addpicture_default.png"> <input
													type="hidden" name="travelpicture" value=""
													id="travelpicture" placeholder="图片">
											</div>
										</div>
									</div>
									<br /> <br />

									<div class="row" style="margin: 50px auto 0 auto; width: 90%;">
										<!--富文本内容-->
										行程攻略：
										<textarea id="guide_content" class="ckeditor" name="guide"
											style="margin: 0 auto;"></textarea>
										<script type="text/javascript">var myEditor = CKEDITOR.replace('guide');</script>
									</div>
									<br>

									<div class="row" style="margin: 50px auto 0 auto; width: 90%;">
										<!--富文本内容-->
										注意事项：
										<textarea class="ckeditor" name="attention"
											style="margin: 0 auto;"></textarea>
										<script type="text/javascript">CKEDITOR.replace('attention');</script>
									</div>
									<br />
									<div class="row">
										<div class="col-sm-offset-5 col-sm-1 text-center">
											<input type="submit" class="btn btn-success" value="添加">
										</div>
										<div class="col-sm-1 text-center">
											<input type="button" class="btn btn-info" value="重置">
										</div>
									</div>
							</form>
						</div>
						<!-- /.col -->
						<div id="posi-content">
							<!-- 查询 -->
							<div id="posi-left">
								<div id="posi-selcet">
									<form id="position-select" class="clearfix form-actions"
										action="admin/travel-positions-page" method="post" onsubmit="">
										<div class="row">
											<div class="col-sm-4">
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-1">位置名称</label>

													<div class="col-sm-9">
														<input type="text" id="form-field-1" name="positionname"
															class="form-control">
													</div>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right"
														for="form-field-1">位置坐标</label>

													<div class="col-sm-9">
														<%-- <c:if test="${positionInfo.positioncoordinate != null }">
	                                                    	 <input type="text" id="form-field-1" name="positioncoordinate" placeholder="tilte" class="form-control" value="${positionInfo.positioncoordinate }">
	                                                    </c:if>
	                                                    <c:if test="${positionInfo.positioncoordinate == null }"> --%>
														<input type="text" id="form-field-1"
															name="positioncoordinate" placeholder="tilte"
															class="form-control">
														<%-- </c:if> --%>
													</div>
												</div>
											</div>
										</div>
										<br />
										<div class="row">
											<div class="form-actions">
												<div class="col-sm-offset-5 col-md-3">
													<input type="button" id="select_posi"
														class="btn btn-primary" value="查询">
												</div>
											</div>

										</div>
									</form>
								</div>
								<!-- 列表 -->
								<div id="posi-list">
									<div class="col-xs-12">
										<div class="table-header">位置更新信息</div>
										<div class="table-responsive">
											<table id="sample-table-2"
												class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>序号</th>
														<th>位置名称</th>
														<th>位置坐标</th>
														<th>位置类型</th>
														<th>运动类型</th>
														<th><i class="icon-time bigger-110 hidden-480"></i>
															适宜去的时间</th>
														<th>操作</th>
													</tr>
												</thead>
												<tbody>
													<c:choose>
														<c:when test="${fn:length(positionInfos.results) > 0 }">
															<c:forEach items="${positionInfos.results }"
																var="positionInfo" varStatus="statu">
																<tr class="posi_tr">
																	<%-- <input type="text" hidden="hidden" value="${positionInfo.positionid }"/> --%>
																	<td>${(statu.index+1) }</td>
																	<td>${positionInfo.positionname }</td>
																	<td>${fn:substringBefore(positionInfo.positioncoordinate,'|') }<sup>。</sup>${fn:substringAfter(positionInfo.positioncoordinate,'|') }
																		<sup>。</sup></td>
																	<td>${positionInfo.positionTypeInfo.positiontypename }</td>
																	<td>${positionInfo.basicSportType.sporttypename }</td>
																	<td>${positionInfo.positiontime }</td>
																	<td>
																		<div
																			class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																			<%-- <a  class="blue" href="javascript:void(0);" onclick="add_position(${(statu.index + 1) })"> --%>
																			<a class="blue btn_add" href="javascript:void(0);"
																				attr-id="${(statu.index+1) }"> <i
																				class="icon-plus bigger-130"></i> 添加
																			</a>
																		</div>
																	</td>
																</tr>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<tr>
																<td colspan="9" align="center">对不起，暂无数据！</td>
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
							</div>
							<div id="posi-right">
								<div id="get-posi" class="top"></div>
								<button class="btn-info btn-bottom" id="btn_fini">
									<i class="icon-ok bigger-110"></i> 完成
								</button>
							</div>
						</div>
						<div id="hide_unUse"></div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->
	<jsp:include page="../foot.jsp" />
	<script type="text/javascript" src="resources/js/myjs/travel.js"></script>
</body>
</html>

