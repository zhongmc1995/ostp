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
		<base href="<%=basePath%>">
		<title>添加问题</title>
		<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
		<jsp:include page="../head.jsp"></jsp:include>
	</head>
	<body>
				<!--将这一部分1转化成ifream-->
				<div class="main-content" style="margin-left: 0px;margin-bottom: 0px;">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-dashboard"></i>
								<a href="admin/community-questions-list">问题列表</a>
							</li>
							<li class="active">问题查看</li>
						</ul><!-- .breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								问题查看
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
										
										<form id="questionadd" enctype="multipart/form-data">
											<div class="row">
												
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">问题名称</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" value="${communityQuestion.questiontitle}" readonly="readonly">
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">问题作者</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" value="${communityQuestion.questionauthor }" readonly="readonly">
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">问题热度</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" value="${communityQuestion.questionattention }" readonly="readonly">
														</div>
													</div>
												</div>
											</div>
											<br />

											<div class="row">
											
											<!--提问时间  -->
											<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">提问时间</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" value="${normalTime }" readonly="readonly">
														</div>
													</div>
												</div>
											
											
												
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否可用</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" 
															value="${communityQuestion.enabled eq '1'? '可用':'不可用'}" readonly="readonly">
														</div>
														
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="form-group">
													<label class="col-xs-12 control-label no-padding-right" for="form-field-1">问题内容</label>
													<div class="col-xs-12">
														<!-- <textarea name="notetextarea" class="form-control" id="notetextarea" placeholder="备注" style="margin: 0 auto;" required="required" oninvalid="setCustomValidity('请输入资讯内容')" oninput="setCustomValidity('')"></textarea>
														 -->
														 <textarea rows="10" cols="60" id="editor" name="notetextarea"
																oninvalid="setCustomValidity('请输入问题内容')" oninput="setCustomValidity('')"
																class="ckeditor" readonly="readonly">${communityQuestion.questioncontent }</textarea>
														 <p class="help-block text-danger"></p>
													</div>
												</div>
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
		<jsp:include page="../foot.jsp"></jsp:include>
		
		
		
</body>
</html>
