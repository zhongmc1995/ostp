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
<base href="<%=basePath%>">
<title>轮播图</title>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
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
				<li><i class="icon-dashboard"></i> <a href="#">轮播图管理</a></li>
				<li class="active">轮播图编辑</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					轮播图编辑 <small> <i class="icon-double-angle-right"></i> 查看
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
							<form id="CarouselInfo_update" action="admin/carousel-update"
								method="post" enctype="multipart/form-data">
								<input type="hidden" class="id" value="${carouselList.carouselid}"
										name="carouselid" />
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right"
												for="form-field-21">轮播图名称</label>
											<div class="col-sm-9">
												<input name="carouselname" type="text" id="form-field-21"
													placeholder="autor" class="form-control"
													
													value="${carouselList.carouselname}">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right"
												for="form-field-21">介绍</label>
											<div class="col-sm-9">
												<input name="note" type="text" id="form-field-21"
													placeholder="autor" class="form-control"
													value="${carouselList.note}">
											</div>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">轮播图图片</label>
											<div class="col-sm-9">
												<img id="pic" onclick="BrowseServer()"
													style="width: 80px; height: 80px" alt="图片" src="${carouselList.carouselhref}"> <input
													type="hidden" name="carouselhref"
													id=carouselhref placeholder="图片">
											</div>
										</div>
									</div>
								</div>
								<br />
								
								<div class="row">
									<div class="form-actions">
										<div class="col-sm-offset-5 col-md-3">
											<button class="btn btn-primary " type="submit"
												data-form="#CarouselInfo_update">
												<i class="icon-ok bigger-110"></i> 更新
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
	<!-- /.main-content -->


	<jsp:include page="../foot.jsp"></jsp:include>
	<script src="resources/js/laydate/laydate.js"></script>
	<script src="resources/js/myjs/course.js"></script>
	<script>
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
	}	</script>
</body>
</html>
