<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<title>装备详情</title>
		
		<jsp:include page="../head.jsp"></jsp:include>
	</head>
	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
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
						<a href="admin/equip-list">装备列表</a>
					</li>
					<li class="active">装备详情</li>
				</ul><!-- .breadcrumb -->
				
			</div>

			<div class="page-content">
				<div class="page-header">
					<h1>
						装备详情
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
								
								
									<div class="row">
										
										<div class="col-sm-4">
											
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备ID</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="${equip.equipid}" readonly="readonly">
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备名称</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="${equip.equipname}" readonly="readonly">
												</div>
											</div>
										</div>
										
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备价格</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="${equip.equipprice}" readonly="readonly">
												</div>
											</div>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备参数</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="${equip.equipparam}" readonly="readonly">
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否推荐</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="${equip.equiprecommend eq '1'?'推荐':'不推荐'}" readonly="readonly">
												</div>
												
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">运动类型</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="${equip.sporttypeid}" readonly="readonly">
												</div>
											</div>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备类型</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="${equip.equiptypeid}" readonly="readonly" />
												</div>
												
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否可用</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="${equip.enabled eq '1'? '可用':'不可用'}" readonly="readonly">
												</div>
												
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">创建时间</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="<fmt:formatDate value='${equip.createdate}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
												</div>
												
											</div>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">创建者</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="${equip.createby}" readonly="readonly" />
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">更新时间</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="<fmt:formatDate value='${equip.updatedate}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
												</div>		
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">更新者</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" value="${equip.updateby}" readonly="readonly">
												</div>	
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">图片</label>
												<div class="col-sm-9">
													<img style="width:80px;height:80px" alt="图片" src="${equip.equipimage}">
												</div>
											</div>
										</div>
										
										
									</div>
									<br>
									<div class="row">
										<div class="form-group">
											<label class="col-xs-12 control-label no-padding-right" for="form-field-1">备注</label>
											<div class="col-xs-12">
												<textarea rows="10" cols="60" id="editor"oninvalid="setCustomValidity('请输入教程内容')"
													oninput="setCustomValidity('')" class="ckeditor">
													${equip.note}
												</textarea>
										
												<p class="help-block text-danger"></p>
											</div>
										</div>
									</div>
									<br />
									
								
								
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
