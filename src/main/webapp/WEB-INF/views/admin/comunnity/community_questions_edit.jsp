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
		<title>修改问题</title>
		<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
		<jsp:include page="../head.jsp"></jsp:include>
	</head>
	<body>
	
	<!--这个用来传id  -->
	<input type="hidden" value="${communityQuestion.questionid }" id="questionid">
	
	
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
							<li class="active">问题修改</li>
						</ul><!-- .breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								问题修改
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
															<input name="questiontitle" value="${communityQuestion.questiontitle }"type="text" id="questiontitle" placeholder="问题名称" class="form-control" required="required" oninvalid="setCustomValidity('请输入问题名称')" oninput="setCustomValidity('')">
															<p id="tip"></p>
														</div>
														
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">问题作者</label>
				
														<div class="col-sm-9">
															<input name="questionauthor" type="text"  value="${communityQuestion.questionauthor }" id="questionauthor" placeholder="问题作者" class="form-control" required="required" oninvalid="setCustomValidity('请输入作者')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">问题热度</label>
				
														<div class="col-sm-9">
															<input name="questionattention" value="${communityQuestion.questionattention }" type="text" id="questionattention" placeholder="问题热度"  class="form-control" required="required" oninvalid="setCustomValidity('请输入正确数据')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
											</div>
											<br />
<%-- 											<div class="row">
												
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="form-field-1">是否推荐</label>
				
														<div class="col-sm-8">
															<input type="text" id="form-field-1" placeholder="Username" class="form-control">
															<select class="form-control" id="equiprecommend" name="equiprecommend">
																<option value="1">推荐</option>
																<option value="0">不推荐</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="form-field-1">运动类型</label>
				
														<div class="col-sm-8">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control" id="sporttypeid" name="sporttypeid">
																<c:forEach items="${sporttypelist }" var="sporttype">
																	<option value="${sporttype.sporttypeid }">${sporttype.sporttypename }</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="form-field-1">装备类型</label>
				
														<div class="col-sm-8">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control" id="equiptypeid" name="equiptypeid">
																<c:forEach items="${equiptypelist }" var="equiptype">
																	<option value="${equiptype.equiptypeid }">${equiptype.equiptypename }</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
											</div>
											<br /> --%>
											<div class="row">
											
											<!--提问时间  -->
											<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">提问时间</label>
				
														<div class="col-sm-9">
															<input name="questiontime" type="text" value="${normalTime }"id="questiontime" placeholder="yyyy-MM-dd HH:mm:ss"  class="form-control date-picker date_calendar"   oninvalid="setCustomValidity('请输入发布时间')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
											
											
												
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-4 control-label no-padding-right" for="form-field-1">是否可用</label>
														<div class="col-sm-8">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control" id="enabled" name="enabled">															
																<option ${communityQuestion.enabled =="1"?'selected="selected"':''} value="1" >可用</option>
																<option ${communityQuestion.enabled =="0"?'selected="selected"':''}value="0" >不可用</option>
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
																class="ckeditor">${communityQuestion.questioncontent }</textarea>
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
															修改
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
	
	
	<script type="text/javascript">
		$(function() {
			equip_add.initial();
		});
		var equip_add = {
			initial : function initial() {
				
				//时间插件
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
				/* 	alert($(".date_calendar").val()); */
					//alert($("#equipname").val());
					if (true) {
						//alert($("#equipname").val());
						var data = new Object();
					    data.questionid=$("#questionid").val();
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
							url : "admin/community-questions-update",  
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
		
		
/* 		$('.date_calendar').datetimepicker({
		    timeFormat: "HH:mm:ss",
		    dateFormat: "yy-mm-dd",
			showSecond:true,
			beforeShow:function(input){
				$(input).css({
					"position":"relative",
					"z-index":9999
				});
			} 
		}); */
	</script>
		<!-- <script src="resources/js/dialog/layer.js"></script> -->
    <!-- <link type="text/css" href="resources/css/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="resources/css/jquery-ui-timepicker-addon.css" type="text/css" />
    

    <script src="resources/js/jquery-1.9.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="resources/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="resources/js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>

    中文
    <script src="resources/js/jquery.ui.datepicker-zh-CN.js" type="text/javascript" charset="gb2312"></script>
    <script src="resources/js/jquery-ui-timepicker-zh-CN.js" type="text/javascript"></script> -->

		<jsp:include page="../foot.jsp"></jsp:include>
		
		
		
</body>
</html>
