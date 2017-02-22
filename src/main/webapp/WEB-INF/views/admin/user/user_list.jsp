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
    	<base href="<%=basePath%>">
    	<title>系统用户</title>
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
								<a href="#">系统管理</a>
							</li>
							<li class="active">系统用户</li>
						</ul><!-- .breadcrumb -->
						
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								系统用户
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
											<div class="col-xs-12">
												<form action="info_search" class="clearfix form-actions">
													<div class="row">
														<div class="col-sm-4">
															<div class="form-group">
																<label class="col-sm-3 control-label no-padding-right" for="username">用户名</label>
						
																<div class="col-sm-9">
																	<input type="text" id="username" placeholder="用户名" class="form-control">
																</div>
															</div>
														</div>
														<div class="col-sm-4">
															<!--添加下拉菜单-->
															<div class="form-group">
																<label class="col-sm-4 control-label no-padding-right" for="userrole">角色</label>
						
																<div class="col-sm-8">
																	<select class="form-control">
																	 	<option  selected>请选择：</option>
																	 		 <c:forEach var="item" items="${roleList}" >
            																	 <option value="${item.id}">${item.name}</option>
       																		 </c:forEach>
																	</select>
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
																	查询
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
											</div>
											
											<div class="col-xs-12">
												
												<div class="row">
													<div class="col-sm-6">
														<div class="dataTables_info" id="sample-table-2_info">
															<div class="btn-group">
																<button class="btn btn-info">
																	<i class="icon-edit bigger-125"></i> 添加用户
																</button>
															</div>
														</div>
													</div>
													<div class="col-sm-6">
														
													</div>
												</div>
												
												<div class="table-header">
													用户信息列表
												</div>
		
												<div class="table-responsive">
													<table id="sample-table-2" class="table table-striped table-bordered table-hover">
														<thead>
															<tr>
																<th class="center">选择</th>
																<th>序号</th>
																<th>用户名</th>
																<th>角色</th>
																<th>
																	<i class="icon-time bigger-110 hidden-480"></i>
																	创建时间
																</th>
																<th class="hidden-480">操作</th>
		
															</tr>
														</thead>
					
														<tbody>
															<c:forEach var="item" items="${userList}"  varStatus="status">
            												<tr>
																<td class="center">
																	<label>
																		<input type="checkbox" value="${item.userid}" class="ace"  name="check"/>
																		<span class="lbl"></span>
																	</label>
																</td>
		
																<td>
																	${status.index + 1}
																</td>
																<td>
																	${item.username}
																</td>
																<td>
																	${item.roleid}
																	${item.rolename}
																</td>
																<td></td>
																<td>
																	<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																		
																		<a class="blue"  data-id="${item.userid}" href="#" id="viewBtn">
																			<i class="icon-search bigger-130"></i> 详情
																		</a>
																		
																		</a>
																		<a class="green" data-id="${item.userid}" href="#"  id="editBtn">
																			<i class="icon-pencil bigger-130"></i> 编辑
																		</a>
																		<a class="red" href="#"  data-id="${item.userid}" id="deleteBtn">
																			<i class="icon-trash bigger-130"></i> 删除
																		</a>
																	</div>
		
																	<div class="visible-xs visible-sm hidden-md hidden-lg">
																		<div class="inline position-relative">
																			<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
																				<i class="icon-caret-down icon-only bigger-120"></i>
																			</button>
		
																			<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																				<li>
																					<a href="" class="tooltip-info" data-rel="tooltip" title="View">
																						<span class="blue">
																							<i class="icon-zoom-in bigger-120"></i>
																						</span>
																					</a>
																				</li>
		
																				<li>
																					<a href="" class="tooltip-success" data-rel="tooltip" title="Edit">
																						<span class="green">
																							<i class="icon-edit bigger-120"></i>
																						</span>
																					</a>
																				</li>
		
																				<li>
																					<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
																						<span class="red">
																							<i class="icon-trash bigger-120"></i>
																						</span>
																					</a>
																				</li>
																			</ul>
																		</div>
																	</div>
																</td>
															</tr>			
       														</c:forEach>
															
															
															
															
														</tbody>
													</table>
												</div>
												
												<div class="row">
													<div class="col-sm-6 col-sm-offset-6">
														<div class="dataTables_paginate paging_bootstrap">
															<ul class="pagination">
																<li class="prev disabled">
																	<a href="#">上一页</a>
																</li>
																<li class="active">
																	<a href="#">1</a>
																</li>
																<li>
																	<a href="#">2</a>
																</li>
																<li>
																	<a href="#">3</a>
																</li>
																<li class="next">
																	<a href="#">下一页</a>
																</li>
															</ul>
														</div>
													</div>
												</div>
												
											</div>
										</div>
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
