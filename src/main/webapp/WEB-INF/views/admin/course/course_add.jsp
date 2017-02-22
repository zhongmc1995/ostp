
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
<title>教程</title>
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
				<li><i class="icon-dashboard"></i> <a href="#">教程管理</a></li>
				<li class="active">教程添加</li>
			</ul>
			<!-- .breadcrumb -->
		</div>
		<div class="page-content">
			<div class="page-header">
				<h1>
					教程添加 <small> <i class="icon-double-angle-right"></i> 查看
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
							<form id="CourseInfo_add" action="admin/course-addimpl" method="post"
								enctype="multipart/form-data">
								<div class="row">
									<div class="col-sm-4">
										<!--添加下拉菜单-->
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">户外运动类型</label>
											<div class="col-sm-9">
												<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
												<select class="form-control" name="sporttypeid"
													id="form-field-1">
													<c:forEach items="${SportTypeList}" var="sportType">
														<option value="${sportType.sporttypeid }">${sportType.sporttypename }</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right"
												for="form-field-8">教程标题</label>
											<div class="col-sm-9">
												<input name="coursetitle" type="text" id="form-field-3"
													placeholder="title" class="form-control"
													required="required"
													oninvalid="setCustomValidity('请输入教程标题')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right"
												for="form-field-3">关键字</label>

											<div class="col-sm-9">
												<input name="keywords" type="text" id="form-field-3"
													id="form-field-2" placeholder="keyword"
													class="form-control" required="required"
													oninvalid="setCustomValidity('请输入关键字')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>							
								</div>
								<br />
								<div class="row">
										<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-5">是否可用</label>
											<div class="col-sm-9">
												<select id="form-field-5" class="form-control"
													name="enabled">
													<option value="T">可用</option>
													<option value="F">不可用</option>
												</select>
											</div>
										</div>
									</div>		
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right"
												for="form-field-4">文章作者</label>
											<div class="col-sm-9">
												<input name="courseauthor" type="text" id="form-field-4"
													placeholder="autor" class="form-control"
													required="required" oninvalid="setCustomValidity('请输入作者')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right" for="form-field-1">点击量</label>	
												<div class="col-sm-9">
												<input name="clicktimes" type="text" id="clicktimes" placeholder="点击量" class="form-control" pattern="^-?\d+(\.\d+)?(,-?\d+(\.\d+)?)*,?$" required="required" oninvalid="setCustomValidity('请输入正确的数据')" oninput="setCustomValidity('')">
											</div>
										</div>
									</div>			
								</div>
								<br />
								<div class="row">								
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">封面图片</label>
											<div class="col-sm-9">
												<img id="pic" onclick="BrowseServer()"
													style="width: 50px; height: 50px" alt="图片" src="resources/img/addpicture_default.png"> <input
													type="hidden" name="coverpicture" value=""
													id="coverpicture" placeholder="图片">
											</div>
										</div>
									</div>	
								</div>
								<br />
								<div class="row">
									<div class="form-group">
										<input type="hidden" class="id" value="" /> <label
											class="col-xs-12 control-label no-padding-right"
											for="form-field-6">教程内容</label>

										<div class="col-xs-12">
											<textarea rows="10" cols="60" id="editor" name="content"
												oninvalid="setCustomValidity('请输入教程内容')"
												oninput="setCustomValidity('')" class="ckeditor"></textarea>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="form-actions" style="background-color: white;">
										<div class="col-sm-offset-5 col-md-3">
											<button class="btn btn-primary save" type="button"
												data-form="#CourseInfo_add">
												<i class="icon-ok bigger-110"></i> 保存
											</button>
											<button class="btn btn-primary" type="reset">
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
</body>
</html>
