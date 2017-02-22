<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <title>轮播图</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <jsp:include page="../head.jsp"/>
</head>
<body>
 <div class="main-content" style="margin-left:0;margin-bottom:0;">
    <div class="breadcrumbs" id="breadcrumbs">
<script type="text/javascript">
    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
</script>
<ul class="breadcrumb">
    <li>
        <i class="icon-camera-retro"></i>
        <a href="#">轮播图管理</a>
    </li>
    <li class="active">轮播图列表</li>
</ul><!-- .breadcrumb -->
</div>
<div class="page-content">
    <div class="page-header">
        <h1>
            轮播图列表
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

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="dataTables_info" id="sample-table-2_info">
                                        <div class="btn-group">
                                            <a class="btn btn-info" href="admin/carousel-add"> <i
												class="icon-edit bigger-125"></i> 添加文档
											</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">

                                </div>
                            </div>

                            <div class="table-header">
                                轮播图信息
                            </div>

                            <div class="table-responsive">
                                <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="center" hidden="">选择</th>
                                        <th>序号</th>
                                        <th>轮播图名称</th>
                                        <th>备注</th>
                                        <th>创建人</th>
                                        <th>创建时间</th>
                                        <th>更新人</th>
                                        <th>
                                            <i class="icon-time bigger-110 hidden-480">更新时间</i>
                                            
                                        </th>
                                        <th class="hidden-480">操作</th>
                                    </tr>
                                    </thead>
                                      <tbody>
                                        	<c:choose>
                                        		<c:when test="${fn:length(carouselList) > 0 }">
                                        			<c:forEach items="${carouselList}" var="carouselList" varStatus="statu">
	                                        			 <tr id="carousel">
				                                            <td class="center" hidden="true">
				                                                <label>
				                                                    <input type="checkbox" class="ace" />
				                                                    <span class="lbl"></span>
				                                                </label>
				                                            </td>
				                                            <td>${status.index + 1}</td>
				                                            <td>${carouselList.carouselname}</td>
				                                            <td>${carouselList.note}</td>
				                                            <td>${carouselList.createBy}</td>
															<td><fmt:formatDate value="${carouselList.createDate}"
																pattern="yyyy-MM-dd" /></td>
															<td>${carouselList.updateBy}</td>
															<td><fmt:formatDate value="${carouselList.updateDate}"
																pattern="yyyy-MM-dd" /></td>
				                                            
				                                            <td> 
				                                                <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
				
				                                                    <a class="blue" href="admin/carousel-view/${carouselList.carouselid}">
				                                                        <i class="icon-search bigger-130"></i> 详情
				                                                    </a>
				
				                                                    <a class="green" href="admin/carousel-edit/${carouselList.carouselid}">
				                                                        <i class="icon-pencil bigger-130"></i> 编辑
				                                                    </a>
				                                                   <a class="red" style="cursor:pointer;" data-url="admin/carousel-del/${carouselList.carouselid}"> 
																	<i class="icon-trash bigger-130"></i>
																	删除
																</a>
				                                                </div>
				                                            </td>
				                                         </tr>
			                                        </c:forEach>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<tr>
														<td colspan="9" align="center">对不起，暂无数据！</td>
													</tr>
                                        		</c:otherwise>
                                        	</c:choose>
                                       
                                        </tbody>
                                </table>
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
	<script src="resources/js/laydate/laydate.js"></script>
	<script src="resources/js/myjs/course.js"></script>
</body>
</html>