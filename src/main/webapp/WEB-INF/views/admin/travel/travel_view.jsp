<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<base href="<%=basePath%>">
		<title>行程管理——详情</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
		<jsp:include page="../head.jsp"/>
	</head>

	<body style="background:#fff;width:100%;">
		
	<!--将这一部分1转化成ifream-->
	<div class="main-content" style="margin-left:0;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
			</script>

			<ul class="breadcrumb">
				<li>
					<i class="icon-dashboard"></i>
					<a href="#">行程管理</a>
				</li>
				<li class="active">行程详情</li>
			</ul><!-- .breadcrumb -->
			
		</div>

		<div class="page-content" style="width:95%;">
			<div class="page-header">
				<h1>
					添加行程
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
							<form>
								<div class="row">
									<div class="col-sm-4">
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right" for="form-field-1">行程名称</label>
			
													<div class="col-sm-9">
														<input type="text" id="form-field-1" placeholder="行程名称" class="form-control" disabled="disabled" value="${tripTravelInfo.travelname }">
													</div>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="form-group">
													<label class="col-sm-4 control-label no-padding-right" for="form-field-1">户外运动类型</label>
			
													<div class="col-sm-8">
														<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
														<input type="text" id="form-field-1" placeholder="户外运动类型" class="form-control" disabled="disabled" value="${tripTravelInfo.basicSportType.sporttypename }">
													</div>
												</div>
											</div>
											<div class="col-sm-4">
												<div class="form-group">
													<label class="col-sm-3 control-label no-padding-right" for="form-field-1">关键字</label>
			
													<div class="col-sm-9">
														<input type="text" id="form-field-1" placeholder="关键字" class="form-control" disabled="disabled" value="${tripTravelInfo.keyword }">
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
													src="${tripTravelInfo.travelpicture }"> <input
													type="hidden" name="travelpicture" value=""
													id="travelpicture" placeholder="图片">
											</div>
										</div>
									</div>
									<br/>
									<br/>
								<br />
								<div class="row" style="margin: 50px auto 0 auto; width: 90%;">
										<!--富文本内容-->
										行程攻略：
										<textarea id="guide_content" class="ckeditor" name="guide"
											style="margin: 0 auto;">${tripTravelInfo.guide}</textarea>
										<script type="text/javascript">var myEditor = CKEDITOR.replace('guide');</script>
									</div>
									<br>

									<div class="row" style="margin: 50px auto 0 auto; width: 90%;">
										<!--富文本内容-->
										注意事项：
										<textarea class="ckeditor" name="attention"
											style="margin: 0 auto;">${tripTravelInfo.attention}</textarea>
										<script type="text/javascript">CKEDITOR.replace('attention');</script>
									</div>
									<br />
							</form>
							
						</div><!-- /.col -->
					</div><!-- /.row -->
				
					<!-- PAGE CONTENT ENDS -->
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.page-content -->
	</div><!-- /.main-content -->
	<jsp:include page="../foot.jsp"/>
	<script type="text/javascript" src="resources/js/myjs/travel.js"></script>
</body>
</html>

