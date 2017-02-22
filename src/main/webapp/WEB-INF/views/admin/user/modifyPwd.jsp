<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<title>用户密码修改</title>
    	<base href="<%=basePath%>">
    	<jsp:include page="../head.jsp"></jsp:include>
	</head>
	<body>
				<!--将这一部分1转化成iframe-->
				<div class="main-content" style="margin-left: 0px;margin-bottom: 0px;">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-dashboard"></i>
								<a href="#">用户管理</a>
							</li>
							<li class="active">密码修改</li>
						</ul><!-- .breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								密码修改
								<small>
									<i class="icon-double-angle-right"></i>
									 修改
								</small>
							</h1>
						</div><!-- /.page-header -->
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<div class="row">
									<div class="col-xs-12">
										<!-- PAGE CONTENT BEGINS -->
										<form id="modify-psw-form" method="POST"  class="clearfix form-actions">
										<input type="hidden" id="userid" name="userId" value="${userId}">
											<div class="row">
												<div class="col-sm-4">
													<div class="form-group psw">
														<label class="col-sm-3 control-label no-padding-right" for="userpsw">新密码</label>
				
														<div class="col-sm-6">
															<input type="text" id="userpsw" name="userpsw" placeholder="New Password"  class="form-control">	
														</div>
														
														<div class="form-message">
															
														</div>
													</div>
												</div>
											</div>	
											<br />
											<div class="row">
												<div class="col-sm-4">
													<div class="form-group repsw" >
														<label class="col-sm-3 control-label no-padding-right" for="repeatpsw">重复密码</label>
				
														<div class="col-sm-6" >
															<input type="text" id="repeatpsw" name="repeatpsw" placeholder="Repeat Password"   class="form-control">	
														</div>
														
														<div class="form-message">
															
														</div>
													</div>
												</div>
											</div>	
											<br />
											<div class="row">
												<div class="form-actions">
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

	<jsp:include page="../foot.jsp"></jsp:include>
	

	<script>
	 $(function() {
		 
		 modifyPsw.initial();
	});

	var modifyPsw = {

		initial : function initial() {
			this.bindSubmitForm();
		},

		bindSubmitForm : function bindSubmitForm() {
			var form = $("form#modify-psw-form");

			form.submit(function() {
						var result = modifyPsw.verifyInput();
						if (result) {
							var data = new Object();
							data.userid= $("#userid").val();
							data.userpsw= $("#userpsw").val();
							
							jQuery.ajax({
										headers : {
											'Accept' : 'application/json',
											'Content-Type' : 'application/json'
										},
										type : "POST",
										
										url : "admin/modify-psw",
										data : JSON.stringify(data),
										success : function(message, tst, jqXHR) {
											 if (message.result == "success") {
												alert(message.messageInfo);
											} else {
													alert(message.messageInfo);
												}
											} 
										}
									); 
						}

						return false;
					});
		},

		verifyInput : function verifyInput() {
			var result = true;
			
			var checkUserpsw = this.checkUserpsw();
			var checkRepeatpsw = this.checkRepeatpsw();
			
			result = checkUserpsw && checkRepeatpsw;
			return result;
		},
		
		checkUserpsw : function checkUserpsw(){
			var userpsw = $("#userpsw").val();
			if (userpsw == "") {
				$(".psw .form-message").text("密码不能为空");
				$("#userpsw").focus();
				return false;
			}
			return true;
		},
		
		checkRepeatpsw : function checkRepeatpsw(){
			var repeatpsw = $("#repeatpsw").val();
			var psw = $("#userpsw").val();
			if (repeatpsw!=psw) {
				$(".repsw  .form-message").text("确认密码必须和密码一致");
				$("#repeatpsw").focus();
				return false;
			}
			return true;
		}
		
	};
	</script>
</body>
</html>

