<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="icon-dashboard"></i> <a
					href="javascript:void(0);">轮播图管理</a></li>
				<li class="active">轮播图编辑</li>
			</ul>
			<!-- .breadcrumb -->
		</div>
		<div class="page-content">
			<div class="page-header">
				<h1>
					<a href="admin/carousel-list">轮播图编辑</a> <small> <i
						class="icon-double-angle-right"></i>查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->

					<div class="row">
						<div class="col-xs-12">
							<form>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="enable">轮播图名称</label>
											<div class="col-sm-9">
												<input type="text" readonly="readonly"
													value="${carouselList.carouselname}" class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="enable">轮播图介绍</label>
											<div class="col-sm-9">
												<input type="text" readonly="readonly"
													value="${carouselList.note}" class="form-control" />
											</div>
										</div>
									</div>

								</div>
								<br />
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="enable">创建时间</label> <label class="control-label"
												style="width: 300px"> <fmt:formatDate
													value="${carouselList.createDate}" />
											</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="enable">创建者</label> <label class="control-label"
												style="width: 300px">${carouselList.createBy}</label>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="enable">更新时间</label>
											<fmt:formatDate value="${carouselList.updateDate}" />
											</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">更新者</label> <label class="control-label">${carouselList.updateBy}</label>
										</div>
									</div>

								</div>
								<br />
								<div class="col-sm-4">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1">轮播图图片</label>
										<div class="col-sm-9">
											<img id="pic" onclick="BrowseServer()"
												style="width: 80px; height: 80px" alt="图片"
												src="${carouselList.carouselhref}"> <input
												type="hidden" name="carouselhref" id="carouselhref"
												placeholder="图片">
										</div>
									</div>
								</div>

								<br />
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
</body>
</html>
