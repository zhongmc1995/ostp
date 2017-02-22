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
							<li class="active">问题添加</li>
						</ul><!-- .breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								问题添加
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
										
										<form id="questionadd" method="post">
											<div class="row">
												
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">问题名称</label>
				
														<div class="col-sm-9">
															<input name="questiontitle" type="text" id="questiontitle" placeholder="问题名称" class="form-control" required="required" oninvalid="setCustomValidity('请输入问题名称')" oninput="setCustomValidity('')">
															<p id="tip"></p>
														</div>
														
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">问题作者</label>
				
														<div class="col-sm-9">
															<input name="questionauthor" type="text" id="questionauthor" placeholder="问题作者" class="form-control" required="required" oninvalid="setCustomValidity('请输入作者')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">问题热度</label>
				
														<div class="col-sm-9">
															<input name="questionattention" type="text" id="questionattention" placeholder="问题热度"  class="form-control" required="required" oninvalid="setCustomValidity('请输入正确数据')" oninput="setCustomValidity('')">
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
															<input name="questiontime" type="text" id="questiontime" placeholder="yyyy-MM-dd HH:mm:ss"  class="form-control date-picker date_calendar"   oninvalid="setCustomValidity('请输入发布时间')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
											
											
												
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否可用</label>
														<div class="col-sm-9">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control" id="enabled" name="enabled">															
																<option value="1">可用</option>
																<option value="0">不可用</option>
															</select>
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
																class="ckeditor"></textarea>
														 <p class="help-block text-danger"></p>
													</div>
												</div>
											</div>
											<br />
											<div class="row">
												<div class="form-actions" style="background:white;">
													<div class="col-sm-offset-5 col-md-3">
														<button class="btn btn-primary" type="submit">
															<i class="icon-ok bigger-110"></i>
															添加
														</button>
			
														&nbsp; &nbsp; &nbsp;
														<button class="btn btn-info" type="reset">
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
	
<!-- 	<!-- 校验 -->
	<script type="text/javascript">
		$("#equipprice").blur(function(){
			if($("#equipprice").val() != ""){
				var equipprice = $("#equipprice").val()
				$.ajax({
		            type: "GET",
		            url: "admin/equip-validate/"+equipprice,
		            data: {equipprice:$("#equipprice").val()},
		            success: function(data){
		            	if(data.validate == "1"){
		            		//$("#tip").empty();
		            	}else{
		            		//$("#tip").empty();
		            		//$("#tip").html("无效数据");
		            	}
		           	}
		    	});
			}
		})

	</script> -->
	
	<script type="text/javascript">
		$(function() {
			equip_add.initial();
		});
		var equip_add = {
			initial : function initial() {
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
				this.bindSubmitForm();
			},
			bindSubmitForm : function bindSubmitForm() {
				var form = $("form#questionadd");
				form.submit(function() {
					if (true) {
						var data = new Object();
					
						data.questiontitle = $("#questiontitle").val();
						data.questionauthor = $("#questionauthor").val();
						data.questioncontent = CKEDITOR.instances.editor.getData().trim();
						data.questionattention = $("#questionattention").val();
						stringtime = $("#questiontime").val();
						data.questiontime = new Date(stringtime);
						data.enabled = $("#enabled").val();
						jQuery.ajax({
							headers : {
								'Accept' : 'application/json',
								'Content-Type' : 'application/json'
							},
							type : "POST",
							url : "admin/community-questions-insert",  
							data : JSON.stringify(data),
							success : function(message, tst, jqXHR) {
								if (message.result == "success") {
									return dialog.success(message.messageInfo,"/ostp/admin/community-questions-list");
								} else {
									return dialog.error(message.result);
								}
							}
						});
					}
					return false;
				});
			}
		};
		
		
	</script>

    
        <script src="resources/js/dialog/layer.js"></script>
		<script src="resources/js/myjs/dialog.js"></script>

		<jsp:include page="../foot.jsp"></jsp:include>
		
		
		
</body>
</html>
