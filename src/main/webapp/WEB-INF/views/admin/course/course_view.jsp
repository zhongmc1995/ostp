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
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="icon-dashboard"></i> <a href="javascript:void(0);">教程管理</a></li>
				<li class="active">教程编辑</li>
			</ul>
			<!-- .breadcrumb -->
		</div>
		<div class="page-content">
			<div class="page-header">
				<h1>
					<a href="admin/course-list">教程编辑</a> <small> <i class="icon-double-angle-right"></i>查看
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
												for="form-field-31">教程标题</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													value="${courseInfo.coursetitle}" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<!--添加下拉菜单-->
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">户外运动类型</label>

											<div class="col-sm-9">
												<c:forEach items="${sporttypelist}" var="sportType">
													<c:if
														test="${sportType.sporttypeid == courseInfo.sporttypeid}">
														<input value="${sportType.sporttypename }" type="text"
															readonly="readonly" class="form-control" />
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>

									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-31">关键字</label>

											<div class="col-sm-9">
												<input type="text" class="form-control"
													value="${courseInfo.keywords}" readonly="readonly">
											</div>
										</div>

									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-11">教程作者 </label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													value="${courseInfo.courseauthor}" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-21">创建者</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													value="${courseInfo.createby}" readonly="readonly" />
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-21">创建时间</label>

											<div class="col-sm-9">
												<input type="text" class="form-control"
													value="<fmt:formatDate value="${courseInfo.createtime}"
													pattern="yyyy-MM-dd HH:mm:ss" />"
													readonly="readonly" />
											</div>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-11">点击量</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													value="${courseInfo.clicktimes}" readonly="readonly" />
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-21">更新者</label>

											<div class="col-sm-9">
												<input type="text" class="form-control"
													value="${courseInfo.updateby}" readonly="readonly" />
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-11">更新时间</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													value="<fmt:formatDate value="${courseInfo.updatetime}"
																pattern="yyyy-MM-dd HH:mm:ss" />"
													readonly="readonly" />
											</div>
										</div>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="enable">是否可用</label>
											<div class="col-sm-9">
												<c:if test="${courseInfo.enabled=='T'}">
													<input type="text" value="可用" class="form-control"
														readonly="readonly" />
												</c:if>
												<c:if test="${courseInfo.enabled=='F'}">
													<input type="text" class="form-control" value="不可用"
														readonly="readonly" />
												</c:if>

											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="enable">课程类型</label>
											<div class="col-sm-9">
												<input type="text" value="" readonly="readonly"
													class="form-control" />
											</div>
										</div>
									</div>
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
										<label class="col-xs-12 control-label no-padding-right"
											for="form-field-6">教程内容</label>

										<div class="col-xs-12">
											<textarea rows="10" cols="60" id="editor"
												oninvalid="setCustomValidity('请输入教程内容')"
												oninput="setCustomValidity('')" class="ckeditor" disabled="disabled">${courseInfo.content}</textarea>
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
