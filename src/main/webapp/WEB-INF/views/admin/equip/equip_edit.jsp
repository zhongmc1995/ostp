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
		<title>装备编辑</title>
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
								<a href="admin/equip-list">装备列表</a>
							</li>
							<li class="active">装备更新</li>
						</ul><!-- .breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								装备更新
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
										
										<form id="equipupdate" action="admin/equip-update" method="post" enctype="multipart/form-data">
											<div class="row">
												
												<div class="col-sm-4">
													
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备ID</label>
				
														<div class="col-sm-9">
															<input name="equipid" readonly="readonly" type="text" id="equipid" value="${equip.equipid}" class="form-control" required="required" oninvalid="setCustomValidity('不能为空')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备名称</label>
				
														<div class="col-sm-9">
															<input name="equipname" type="text" id="equipname" value="${equip.equipname}" class="form-control" required="required" oninvalid="setCustomValidity('不能为空')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
												
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备价格</label>
				
														<div class="col-sm-9">
															<input name="equipprice" type="text" id="equipprice" value="${equip.equipprice}" class="form-control" pattern="^-?\d+(\.\d+)?(,-?\d+(\.\d+)?)*,?$" required="required" oninvalid="setCustomValidity('请输入正确价格')" oninput="setCustomValidity('')">
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
															<input name="equipparam" type="text" id="equipparam" value="${equip.equipparam}" class="form-control" required="required" oninvalid="setCustomValidity('不能为空')" oninput="setCustomValidity('')">
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否推荐</label>
				
														<div class="col-sm-9">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control" id="equiprecommend" name="equiprecommend">
																<option ${equip.equiprecommend==1?'selected="selected"':''} value="1">推荐</option>
																<option ${equip.equiprecommend == 0?'selected="selected"':''} value="0">不推荐</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">运动类型</label>
				
														<div class="col-sm-9">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control" id="sporttypeid" name="sporttypeid">
																<c:forEach items="${sporttypelist }" var="sporttype">
																	<option ${sporttype.sporttypeid==equip.sporttypeid?'selected="selected"':''} value="${sporttype.sporttypeid }">
																		${sporttype.sporttypename }
																	</option>
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
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备类型</label>
				
														<div class="col-sm-9">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control" id="equiptypeid"  name="equiptypeid">
																<c:forEach items="${equiptypelist }" var="equiptype">
																	<option ${equiptype.equiptypeid==equip.equiptypeid?'selected="selected"':''} value="${equiptype.equiptypeid }">
																		${equiptype.equiptypename }
																	</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否可用</label>
														<div class="col-sm-9">
															<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
															<select class="form-control" id="enabled"  name="enabled">															
																<option ${equip.enabled == 1?'selected="selected"':''} value="1">可用</option>
																<option ${equip.enabled == 0?'selected="selected"':''} value="0">不可用</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备图片</label>
														<div class="col-sm-9">
															<img id="pic" onclick="BrowseServer()" style="width:80px;height:80px" alt="图片" src="${equip.equipimage}">
															<input  type="hidden" name="equipimage" value="" name="picture" id="equipimage" placeholder="图片"> 
															
														</div>
													</div>
												</div>
											</div>
											<br>
											<div class="row">
												<div class="form-group">
													<label class="col-xs-12 control-label no-padding-right" for="form-field-1">备注</label>
													<div class="col-xs-12">
														<textarea rows="10" cols="60" id="note"oninvalid="setCustomValidity('请输入教程内容')"
															oninput="setCustomValidity('')" class="ckeditor">
															${equip.note}
														</textarea>
												
														<p class="help-block text-danger"></p>
													</div>
												</div>
											</div>
											<br />
											<div class="row">
												<div class="form-actions"  style="background:white;">
													<div class="col-sm-offset-5 col-md-3">
														<button class="btn btn-primary save" type="button" data-form="#equipupdate">
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
		<script src="resources/js/laydate/laydate.js"></script>
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
			    //$("#xFilePath").val(fileUrl);
			    //alert(fileUrl);
			    $("#pic").attr("src",fileUrl);
			    $("#equipimage").val(fileUrl);
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
	<jsp:include page="../foot.jsp"></jsp:include>
		
</body>
</html>
