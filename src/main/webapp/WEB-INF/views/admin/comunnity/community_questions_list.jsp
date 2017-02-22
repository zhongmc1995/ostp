<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title>Equip</title>

<jsp:include page="../head.jsp"></jsp:include>


</head>
<body>
	<!--将这一部分1转化成iframe-->
	<div class="main-content" style="margin-left: 0px; margin-bottom: 0px;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				$(".btn-success").attr('onclick','');
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>
			
			<ul class="breadcrumb">
				<li><i class="icon-dashboard"></i> <a href="#">社区管理</a></li>
				<li class="active">问题列表</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					问题列表 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->
			
			<div class="row">
				<div class="col-xs-12">
					<!-- 表单 -->
					<form action="admin/community-questions-list" id="findform" method="post" class="clearfix form-actions">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">问题标题</label>
									<div class="col-sm-9">
										<input type="text" name="questiontitle" id="questiontitle" value="${page.params.questiontitle}" placeholder="问题标题"
											class="form-control">
										<input type="hidden" name="pageNo" id="pageNo"  placeholder="标题"
											class="form-control">
									</div>
								</div>
							</div>
							
							<div class="col-sm-4">
								<!--添加下拉菜单-->
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">问题热度</label>
									<div class="col-sm-9">
										<input type="text" name="questionattention" id="questionattention" value="${page.params.questionattention}" placeholder="hot or commom or cold"
											class="form-control">
									</div>
								</div>
							</div>
							
							<div class="col-sm-4">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">问题作者</label>
									<div class="col-sm-9">
										<input type="text" name="questionauthor" id="questionauthor" value="${page.params.questionauthor}" placeholder="作者"
											class="form-control">
									</div>
									
								</div>
							</div>
						</div>
						<br />
						<div class="row">
							<div class="form-actions">
								<div class="col-sm-offset-5 col-md-3">
									<button class="btn btn-primary" type="submit">
										<i class="icon-ok bigger-110"></i> 查询
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

				<div class="col-xs-12">

					<div class="row">
						<div class="col-sm-6">
							<div class="dataTables_info" id="sample-table-2_info">
								<div class="btn-group">
									<a class="btn btn-info" href="admin/community-questions-add"> <i
										class="icon-edit bigger-125"></i> 添加文档
									</a>
								</div>
							</div>
						</div>
						<div class="col-sm-6"></div>
					</div>

					<div class="table-header">问题更新信息</div>



					<div class="table-responsive">
						<table id="sample-table-2"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="center">选择</th>
									<th>序号</th>
									<th>问题标题</th>
									<th>问题描述</th>
									<th>问题作者</th>
									<th>问题热度</th>
									<th>提问时间</th>
									<!-- <th><i class="icon-time bigger-110 hidden-480"></i> 备注</th> -->
									<th>是否可用</th>
									<th class="hidden-480">操作</th>

								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.results}" var="item" varStatus="status">
									<tr>
										<td class="center"><label> <input type="checkbox"
												class="ace" /> <span class="lbl"></span>
										</label></td>
										<td>${(page.pageNo-1)*page.pageSize + status.index + 1}</td>
										<td>${item.questiontitle }</td>
										<td>${item.questioncontent }</td>
										<td>${item.questionauthor }</td>
										<td>${item.questionattention }</td>
										<td>
											<fmt:formatDate value="${item.questiontime}" pattern="yyyy-MM-dd" />
										</td>
										<td>
											${item.enabled eq '1'? '可用':'不可用'}<%-- 
										<c:if test="${item.enabled =='1' }">可用</c:if>
										<c:if test="${item.enabled =='0' } ">不可用</c:if> --%>
										</td>
										<td>
											<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
												<a class="blue" href="admin/community-questions-view?id=${item.questionid}"> <i
													class="icon-search bigger-130"></i> 详情
												</a> <a href="admin/community-questions-edit?id=${item.questionid}" class="green"> <i
													class="icon-pencil bigger-130"></i> 编辑
												</a><a  class="red delete_a"  href="javascript:void(0);"
													data-did="${item.questionid}"> <i
													class="icon-trash bigger-130"></i> 删除
												</a>
											</div>
										</td>
									</tr>

								</c:forEach>
							</tbody>
							
							
						</table>
					</div>

					<div class="row">
						<div class="col-sm-8 col-sm-offset-4">
							<div class="dataTables_paginate paging_bootstrap">
								<ul class="pagination">${pageLabal}</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- /.col -->
	</div>


	<!-- PAGE CONTENT ENDS -->



	<jsp:include page="../foot.jsp"></jsp:include>
	
	
	<!-- a标签form表单提交 -->
	<script type="text/javascript">
	$(".pagebutton").click(function(){
		$("#pageNo").val($(this).data('id'));
		//alert($("#pageNo").val($(this).data('id')));
		$("#questiontitle").val("${page.params.questiontitle}");
		$("#questionattention").val("${page.params.questionattention}");
		$("#questionauthor").val("${page.params.questionauthor}");
		$("#findform").submit();
	})
	</script>
	
	
	<!-- 按钮查询 -->
	<script type="text/javascript">
	$(".btn-success").click(function(){
		$("#pageNo").val($("#toGoPage").val());
		//alert($("#pageNo").val($("#toGoPage").val()));
		$("#questiontitle").val("${page.params.questiontitle}");
		$("#questionattention").val("${page.params.questionattention}");
		$("#questionauthor").val("${page.params.questionauthor}");
		$("#findform").submit();
	})
	
	//ajax 确定框弹出
 $(".delete_a").on('click',function(){
	console.log(SCOPE);
     var id=$(this).data('did');
     var url=SCOPE.del_url+"/"+id;
     var data={};
     layer.open({
         type:0,
         title:'是否提交?',
         btn:['yes','no'],
         icon:3,
         closeBtn:2,
         content:'是否确定删除',
         scrollbar:true,
         yes:function(){
             //执行相关的跳转
             todelete(url,data);
         },
     });
 });
	
	
	 function todelete(url,data){
	     $.post(url,data,function(message){
	         if(message.result=="success"){
	             return dialog.success(message.messageInfo,SCOPE.index_url);
	             //跳转到相关页面
	         }else{
	             return dialog.error(message.result);
	         }
	     },"JSON");
	 }
	
	var SCOPE={
			'del_url':'/ostp/admin/community-questions-delete',
			'index_url':'/ostp/admin/community-questions-list',   //为什么要加个ostp
	}
	</script>
	

</body>
</html>
