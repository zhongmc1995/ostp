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
		<title>资讯</title>
		
		<jsp:include page="../head.jsp"></jsp:include>
		<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
	</head>
	<body>
				<!--将这一部分1转化成ifream-->
				<div class="main-content" style="margin-left: 0px;margin-bottom: 0px;">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{
									ace.settings.check('breadcrumbs' , 'fixed');
								}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-dashboard"></i>
								<a href="#">资讯管理</a>
							</li>
							<li class="active">资讯添加</li>
						</ul><!-- .breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								资讯添加
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
										<form action="admin/info-add" id="ostp-add" method="POST" enctype="multipart/form-data">
											<div class="row">
												<div class="col-sm-4">
													<!--添加下拉菜单-->
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="form-field-1">户外运动类型</label>
				
														<div class="col-sm-8">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control" name="sporttypeid">
																<c:forEach items="${sportType}" var="sportType">
																	<option value="${sportType.SportTypeID }">${sportType.SportTypeName }</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="form-field-1">一级类目</label>
				
														<div class="col-sm-8">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control" id="first_select" name="firstlevelinfotypeid">
																<c:forEach items="${firstLevelType }" var="firstLevelType">
																	<option value="${firstLevelType.FirstLevelInfoTypeID }">${firstLevelType.FirstLevelInfoTypeName }</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="form-field-1">二级类目</label>
				
														<div class="col-sm-8">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control ckedit" name="secondlevelinfotypeid" id="second-level">
																<c:forEach items="${secondLevel }" var="secondLevel">
																	<option value="${secondLevel.secondlevelinfotypeid}">${secondLevel.secondlevelinfotypename}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
											</div>
											<br />
											<div class="row">
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">资讯标题</label>
				
														<div class="col-sm-9">
															<input name="title" type="text" id="form-field-1" placeholder="title" class="form-control" required="required" oninvalid="setCustomValidity('请输入资讯标题')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">作者</label>
				
														<div class="col-sm-9">
															<input name="author" type="text" id="form-field-1" placeholder="autor" class="form-control" required="required" oninvalid="setCustomValidity('请输入作者')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">文章来源</label>
				
														<div class="col-sm-9">
															<input name="copyfrom" type="text" id="form-field-1" placeholder="origin" class="form-control" required="required" oninvalid="setCustomValidity('请输入文章来源')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
											</div>
											<br />
											<div class="row">
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">关键字</label>
				
														<div class="col-sm-9">
															<input name="keywords" type="text" id="form-field-1" placeholder="keyword" class="form-control" required="required" oninvalid="setCustomValidity('请输入关键字')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
													
															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">发布时间</label>
															
															<div class="col-sm-9">
															<div class="input-group">
																<input name="createtime" type="text" id="publishTime" placeholder="yyyy-MM-dd HH:mm:ss"  class=" form-control date-picker date_calendar"  oninvalid="setCustomValidity('请输入发布时间')" oninput="setCustomValidity('')">
																<span class="input-group-addon">
																	<i class="icon-calendar bigger-110"></i>
																</span>
															</div>
															</div>
														
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right"
															for="form-field-1">封面图片</label>
														<div class="col-sm-9">
															<img id="pic" onclick="BrowseServer()"
																style="width: 50px; height: 50px" alt="图片" src="resources/img/addpicture_default.png"> <input
																type="hidden" name="imgurl" value=""
																id="imgurl" placeholder="图片">
														</div>
													</div>
												</div>
											</div>
											<br />
											<div class="row">
												<div class="form-group">
													<label class="col-xs-12 control-label no-padding-right" for="form-field-1">资讯内容</label>
													<div class="col-xs-12">
														<textarea name="content" class="form-control ckeditor"  id="form-field-1" style="margin: 0 auto;" required="required" oninvalid="setCustomValidity('请输入资讯内容')" oninput="setCustomValidity('')">资讯内容</textarea>
														<p class="help-block text-danger"></p>
														<script type="text/javascript">CKEDITOR.replace("content");</script>
													</div>
												</div>
											</div>
											<br />
											<div class="row"> 
												<div class="form-actions" style="background-color:white;">
													<div class="col-sm-offset-5 col-md-3">
														<button class="btn btn-primary" id="add_info">
															<i class="icon-ok bigger-110"></i>
															添加
														</button>
			
														&nbsp; &nbsp; &nbsp;
														<button class="btn btn-primary" type="reset">
															<i class="icon-undo bigger-110"></i>
															重置
														</button>
													</div>
												</div>
											</div>
											
										</form>
										
									</div><!-- /.col -->
								</div><!-- /.row -->
							
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

				
		<jsp:include page="../foot.jsp"></jsp:include>
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
			$("#imgurl").val(fileUrl);
		}
				
		function getSecondLevelTypeByFirstID() {
			var firstLevelTypeID = $("#first_select").val();
			$.ajax({
				url:"admin/info-getSecondLevelTypeByFirstID/"+firstLevelTypeID,
				type:"POST",
				dataType:"json",
				success: function(data) {
					var length = data.length;
					if (length > 0) {
						var html = "";
						for (var i = 0; i < length; i++) {
							html += "<option value="+data[i].secondlevelinfotypeid+">"+data[i].secondlevelinfotypename+"</option>";
						}
						$("#second-level").empty().append(html);
					} else
						$("#second-level").empty().append("<option value=\"\">暂无数据</option>");
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert("系统出错！");
				},
			});
		}
		/**
		 * 当选择了一级资讯之后更新二级资讯
		 */
		$("#first_select").on("change",function(){
			getSecondLevelTypeByFirstID();
		});
		
				/**
				 * 当选择了一级资讯之后更新二级资讯
		 		*/
				$("#first_select").on("change",function(){
					getSecondLevelTypeByFirstID();
				});
				
				$('.date_calendar').datetimepicker({
				    timeFormat: "HH:mm:ss",
				    dateFormat: "yy-mm-dd",
					showSecond:true,
					beforeShow:function(input){
						$(input).css({
							"position":"relative",
							"z-index":9999
						});
					} 
				});
				
				
		</script>

</body>
</html>
