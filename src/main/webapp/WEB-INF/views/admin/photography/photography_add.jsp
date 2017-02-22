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
    <title>摄影添加</title>
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
				<li><i class="icon-camera-retro"></i> <a href="#">摄影管理</a></li>
				<li class="active">摄影添加</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					摄影添加 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<form  id="photographyadd" action="admin/photography-insert" method="POST" enctype="multipart/form-data">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">摄影风格</label>

											<div class="col-sm-9">
												<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
												<select class="form-control" name="styletypeid">
													<c:forEach items="${photoStyle }" var="photoStyle">
														<option value="${photoStyle.PhotoStyleID }">${photoStyle.PhotoStyleName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">运动类型</label>

											<div class="col-sm-9">
												<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
												<select class="form-control" name="sporttypeid">
													<c:forEach items="${sportType }" var="sportType">
														<option value="${sportType.SportTypeID }">${sportType.SportTypeName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">照片参数</label>

											<div class="col-sm-9">
												<input type="text" name="photoparam" id="form-field-1"
													placeholder="photoparams" class="form-control"
													required="required"
													oninvalid="setCustomValidity('请输入照片参数')"
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
												for="form-field-1">作品名称</label>

											<div class="col-sm-9">
												<input type="text" name="title" id="form-field-1"
													placeholder="title" class="form-control"
													required="required"
													oninvalid="setCustomValidity('请输入作品名称')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">作者</label>

											<div class="col-sm-9">
												<input type="text" name="author" id="form-field-1"
													placeholder="autor" class="form-control"
													required="required" oninvalid="setCustomValidity('请输入作者')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">作品来源</label>

											<div class="col-sm-9">
												<input type="text" name="origin" id="form-field-1"
													placeholder="origin" class="form-control"
													required="required"
													oninvalid="setCustomValidity('请输入作品来源')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">昨日点赞数</label>

											<div class="col-sm-9">
												<input type="text" name="currentliketimes" id="form-field-1"
													placeholder="currentliketimes" class="form-control"
													required="required"
													oninvalid="setCustomValidity('请输入昨日点赞数')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">总点赞数</label>

											<div class="col-sm-9">
												<input type="text" name="totalliketimes" id="form-field-1"
													placeholder="totalliketimes" class="form-control"
													required="required"
													oninvalid="setCustomValidity('请输入总点赞数')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">照片等级</label>

											<div class="col-sm-9">
												<input type="text" name="leveltype" id="form-field-1"
													placeholder="leveltype" class="form-control"
													oninvalid="setCustomValidity('请输入照片感悟')"
													oninput="setCustomValidity('')"
													required="required">
											</div>
										</div>
									</div>
								</div>
								<br />
								<div class="row"></div>
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">发布时间</label>
											<!-- <div class="col-sm-9">
												<input name="publishtime" type="text" id="form-field-1" placeholder="yyyy-MM-dd HH:mm:ss"  class="form-control date-picker date_calendar"   oninvalid="setCustomValidity('请输入发布时间')" oninput="setCustomValidity('')">
											</div> -->
											<div class="col-sm-9">
												<input name="publishtime" type="text" id="questiontime" 
												placeholder="yyyy-MM-dd HH:mm:ss"  
												class="form-control date-picker date_calendar"   
												oninvalid="setCustomValidity('请输入发布时间')" 
												oninput="setCustomValidity('')">
												
												<!-- <input type="text" name="publishtime" id="form-field-1"
													placeholder="yyyy-mm-dd"
													onclick="laydate({istime: false, format: 'YYYY-MM-DD'})"
													required="required"
													oninvalid="setCustomValidity('请输入发布时间')"
													oninput="setCustomValidity('')"> -->
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">列表图片</label>
											<div class="col-sm-9">
												<img id="pic" onclick="BrowseServer()"
													style="width: 50px; height: 50px" alt="图片"
													src="resources/img/addpicture_default.png"> <input
													type="hidden" value="" name="photourl"
													id="photourl" placeholder="图片">

											</div>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="form-group">
										<label class="col-xs-12 control-label no-padding-right"
											for="form-field-1">摄影内容</label>
										<div class="col-xs-12">
											<textarea rows="10" cols="60" id="editor" name="introduction"
												oninvalid="setCustomValidity('请输入摄影内容')"
												oninput="setCustomValidity('')" class="ckeditor"></textarea>
											<p class="help-block text-danger"></p>
											<!-- <script type="text/javascript">CKEDITOR.replace("financial.bz");</script> -->
										</div>
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
			$(function(){
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
			})
			function BrowseServer() {
			   var finder = new CKFinder();
			   finder.basePath = '<%=request.getContextPath()%>/userfiles/'; 
			   finder.selectActionFunction = SetFileField; //当选中图片时执行的函数
			   finder.popup();//调用窗口       
			}
			    //文件选中时执行
			    //fileUrl所选中文件的路径
			function SetFileField(fileUrl) {
			    //$("#xFilePath").val(fileUrl);
			    //alert(fileUrl);
			    $("#pic").attr("src",fileUrl);
			    $("#photourl").val(fileUrl);
			}
			$("button.save").click(function(){
				var formid = $(this).data('form');
				layer.open({
			        type:0,
			        title:'是否提交?',
			        btn:['yes','no'],
			        icon:3,
			        closeBtn:2,
			        content:'是否确定操作',
			        scrollbar:true,
			        yes:function(){
			            //执行提交 	     	
			        	dialog.toconfirm("提交成功！");
			        	$(formid).submit();
			        },
			    });			
			});		
		</script>	
		
        <script src="resources/js/dialog/layer.js"></script>
		<script src="resources/js/myjs/dialog.js"></script>

		<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>