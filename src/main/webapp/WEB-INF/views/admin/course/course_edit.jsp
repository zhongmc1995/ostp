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
				<li class="active">教程编辑</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					教程编辑 <small> <i class="icon-double-angle-right"></i> 查看
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
							<form id="CourseInfo_update" action="admin/course-updateimpl"
								method="post" enctype="multipart/form-data">
								<div class="row">
									<input type="hidden" class="id" value="${courseInfo.courseid}"
										name="courseid" />
									<div class="col-sm-4">
										<!--添加下拉菜单-->
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">户外运动类型</label>

											<div class="col-sm-9">
												<select class="form-control" name="sporttypeid"
													id="first_select1">
													<c:forEach items="${SportTypeList }" var="sportType">
														<c:choose>
															<c:when
																test="${sportType.sporttypeid == courseInfo.sporttypeid}">
																<option value="${sportType.sporttypeid }"
																	selected="selected">${sportType.sporttypename }</option>
															</c:when>
															<c:otherwise>
																<option value="${sportType.sporttypeid }">${sportType.sporttypename}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right"
												for="form-field-11">教程标题 </label>
											<div class="col-sm-9">
												<input name="coursetitle" type="text" id="form-field-11"
													placeholder="title" class="form-control"
													required="required"
													oninvalid="setCustomValidity('请输入教程标题')"
													oninput="setCustomValidity('')"
													value="${courseInfo.coursetitle}">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right"
												for="form-field-31">关键字</label>

											<div class="col-sm-9">
												<input name="keywords" type="text" id="form-field-31"
													placeholder="keyword" class="form-control"
													required="required" oninvalid="setCustomValidity('请输入关键字')"
													oninput="setCustomValidity('')"
													value="${courseInfo.keywords}">
											</div>
										</div>

									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="enable">是否可用</label>
											<div class="col-sm-9">
												<select id="enable" class="form-control" name="enabled">
													<c:if test="${courseInfo.enabled=='T'}">
														<option value="T" selected="selected">可用</option>
														<option value="F">不可用</option>
													</c:if>
													<c:if test="${courseInfo.enabled=='F'}">
														<option value="T">可用</option>
														<option value="F" selected="selected">不可用</option>
													</c:if>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right"
												for="form-field-21">文章作者</label>

											<div class="col-sm-9">
												<input name="courseauthor" type="text" id="form-field-21"
													placeholder="autor" class="form-control"
													required="required" oninvalid="setCustomValidity('请输入作者')"
													oninput="setCustomValidity('')"
													value="${courseInfo.courseauthor}">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right" for="form-field-1">点击量</label>	
												<div class="col-sm-9">
												<input name="clicktimes" value="${courseInfo.clicktimes}" type="text" id="clicktimes" placeholder="点击量" class="form-control" pattern="^-?\d+(\.\d+)?(,-?\d+(\.\d+)?)*,?$" required="required" oninvalid="setCustomValidity('请输入正确的数据')" oninput="setCustomValidity('')">
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
													style="width: 80px; height: 80px" alt="图片" src="${courseInfo.coverpicture}"> <input
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
												oninput="setCustomValidity('')" class="ckeditor">${courseInfo.content}</textarea>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="form-actions">
										<div class="col-sm-offset-5 col-md-3">
											<button class="btn btn-primary save" type="button"
												data-form="#CourseInfo_update">
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
</body>
</html>
