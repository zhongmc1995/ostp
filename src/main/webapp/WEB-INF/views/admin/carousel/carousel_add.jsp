<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>轮播图添加</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
    <jsp:include page="../head.jsp"/>
</head>
<body>
	<div class="main-content" style="margin-left: 0; margin-bottom: 0;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
            try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
        </script>

			<ul class="breadcrumb">
				<li><i class="icon-camera-retro"></i> <a href="#">轮播图管理</a></li>
				<li class="active">轮播图添加</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					轮播图添加 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<form  id="carouseladd" action="admin/carousel-insert" method="GET" enctype="multipart/form-data">
								
								<div class="row"></div>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">轮播图名称</label>

											<div class="col-sm-9">
												<input type="text" name="carouselname" id="form-field-1"
													placeholder="carouselnames" class="form-control"
													required="required"
													oninvalid="setCustomValidity('请输入轮播图名称')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">轮播图图片</label>
											<div class="col-sm-9">
												<img id="pic" onclick="BrowseServer()"
													style="width: 50px; height: 50px" alt="图片"
													src="resources/img/addpicture_default.png"> <input
													type="hidden" value="" name="carouselhref"
													id="carouselhref" placeholder="图片">

											</div>
										</div>
									</div>
								</div>
								<br />
								<div class="form-group">
									<label class="control-label"><strong>介绍:</strong></label>
									<div class="note">
										<textarea name="note" style='width:100%;height:100%'></textarea>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="form-actions">
										<div class="col-sm-offset-5 col-md-3">
											<button class="btn btn-primary" type="submit">
												<i class="icon-ok bigger-110"></i> 添加
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
	<script type="text/javascript" src="resources/js/laydate/laydate.js"></script>
	<script type="text/javascript">
		function BrowseServer() {
			var finder = new CKFinder();
			finder.basePath = '<%=request.getContextPath()%>/userfiles/';
			finder.selectActionFunction = SetFileField; //当选中图片时执行的函数
			finder.popup();//调用窗口       
		}
				//文件选中时执行
				//fileUrl所选中文件的路径
		function SetFileField(fileUrl) {
			$("#pic").attr("src", fileUrl);
			$("#carouselhref").val(fileUrl);
		}		
		</script>	
		
        <script src="resources/js/dialog/layer.js"></script>
		<script src="resources/js/myjs/dialog.js"></script>

		<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>