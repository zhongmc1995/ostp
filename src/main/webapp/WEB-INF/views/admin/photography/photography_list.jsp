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
    <title>摄影</title>
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
        <a href="#">摄影管理</a>
    </li>
    <li class="active">摄影列表</li>
</ul><!-- .breadcrumb -->
</div>
<div class="page-content">
    <div class="page-header">
        <h1>
            摄影列表
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
                            <form id="potography-select" class="clearfix form-actions" action="admin/photography-list" method="POST" enctype="form-data">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作品名称</label>
                                              
                                            <div class="col-sm-9">
                                              <c:choose>
                                                		<c:when test="${photophotography.title != null}">
                                                    		<input type="text" id="form-field-1" name="title" placeholder="tilte" class="form-control" value="${photophotography.title }">
                                                		</c:when>
                                                		<c:otherwise>
                                                			<input type="text" id="form-field-1" name="title" placeholder="tilte" class="form-control">
                                                		</c:otherwise>
                                                	</c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作者名</label>

                                            <div class="col-sm-9">
                                             <c:choose>
                                                		<c:when test="${photophotography.author != null}">
                                                    		<input type="text" id="form-field-1" name="author" placeholder="author" class="form-control" value="${photophotography.author }">
                                                		</c:when>
                                                		<c:otherwise>
                                                			<input type="text" id="form-field-1" name="author" placeholder="author" class="form-control">
                                                		</c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                    	
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">起始时间</label>
                                            
                                            <div class="col-sm-9">
													<div class="input-group">
														<input class="form-control date-picker date_calendar " type="text" name="begintime">
														<span class="input-group-addon">
															<i class="icon-calendar bigger-110"></i>
														</span>
													</div>
											</div>

                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-4">
                                        <!--添加下拉菜单-->
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">照片风格</label>

                                            <div class="col-sm-9">
                                               <select class="form-control" name="styletypeid">
                                                    <option value=""></option>
		                                                <c:forEach items="${photoStyle }" var="photoStyle" varStatus="status">
		                                                	<c:choose>
		                                                		<c:when test="${photophotography.styletypeid==photoStyle.PhotoStyleID }">
		                                                			<option value="${photoStyle.PhotoStyleID }" selected="selected">${photoStyle.PhotoStyleName }</option>
		                                                		</c:when>
		                                                		<c:otherwise>
		                                                			<option value="${photoStyle.PhotoStyleID }">${photoStyle.PhotoStyleName }</option>
		                                                		</c:otherwise>
		                                                	</c:choose>
		                                                </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">二级类目</label>

                                            <div class="col-sm-9">
                                             <select class="form-control" name="sporttypeid">
                                                    <option value=""></option>
		                                                <c:forEach items="${sportType }" var="sportType" varStatus="status">
		                                                	<c:choose>
		                                                		<c:when test="${photophotography.sporttypeid==sportType.SportTypeID }"><!-- //为什么是大写 -->
		                                                			<option value="${sportType.SportTypeID }" selected="selected">${sportType.SportTypeName }</option>
		                                                		</c:when>
		                                                		<c:otherwise>
		                                                			<option value="${sportType.SportTypeID }">${sportType.SportTypeName }</option>
		                                                		</c:otherwise>
		                                                	</c:choose>
		                                                </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">结束时间</label>

                                            <div class="col-sm-9">
													<div class="input-group">
														<input class="form-control date-picker date_calendar " type="text" name="engtime">
														<span class="input-group-addon">
															<i class="icon-calendar bigger-110"></i>
														</span>
													</div>
											</div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label class="col-sm-6 control-label no-padding-right" for="form-field-1">昨日最小点赞</label>
                                            <div class="col-sm-6">
                                            <c:choose>
                                            	<c:when test="${photophotography.minliketimes != null}">
                                            	<input type="text" name="minliketimes" id="form-field-1" placeholder="最小点赞数" class="form-control"   value="${photophotography.minliketimes }" oninput="setCustomValidity('')">
                                            	</c:when>
                                            	<c:otherwise>
                                            	<input type="text" name="minliketimes" id="form-field-1" placeholder="最小点赞数" class="form-control"   oninput="setCustomValidity('')">
                                            	</c:otherwise>
                                            </c:choose>
                                            </div>
                                             
                                        </div>
                                    </div>
                                      <div class="col-sm-3">
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label no-padding-right" for="form-field-1">总最小点赞</label>
                                            <div class="col-sm-7">
                                               <!-- <input type="text" name="tminliketimes" id="form-field-1" placeholder="minliketimes" class="form-control"  oninput="setCustomValidity('')"> -->
                                               <c:choose>
                                            	<c:when test="${photophotography.tminliketimes != null}">
                                            		<input type="text" name="tminliketimes" id="form-field-1" placeholder="总最小点赞数" class="form-control"   value="${photophotography.tminliketimes }" oninput="setCustomValidity('')">
                                            	
                                            	</c:when>
                                            	<c:otherwise>
                                            		<input type="text" name="tminliketimes" id="form-field-1" placeholder="总最小点赞数" class="form-control"   oninput="setCustomValidity('')">
                                            	
                                            	</c:otherwise>
                                            </c:choose>
                                            </div>
                                             
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                        	<label class="col-sm-6 control-label no-padding-right" for="form-field-1">昨日最大点赞</label>
                                             <div class="col-sm-6">
                                               <c:choose>
                                            	<c:when test="${photophotography.maxliketimes != null}">
                                            		<input type="text" name="maxliketimes" placeholder="最大点赞数" class="form-control"  value="${photophotography.maxliketimes }" >
                                            	
                                            	</c:when>
                                            	<c:otherwise>
                                            		<input type="text" name="maxliketimes" id="form-field-1" placeholder="最大点赞数" class="form-control" >
                                            	
                                            	</c:otherwise>
                                            </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                        	<label class="col-sm-5 control-label no-padding-right" for="form-field-1">总最大点赞</label>
                                             <div class="col-sm-7">
                                               <!-- <input type="text" name="tmaxliketimes" id="form-field-1" placeholder="maxliketimes" class="form-control"  oninput="setCustomValidity('')"> -->
                                               <c:choose>
                                            	<c:when test="${photophotography.tmaxliketimes != null}">
                                            		<input type="text" name="tmaxliketimes" id="form-field-1" placeholder="总最大点赞数" class="form-control"   value="${photophotography.tmaxliketimes }" oninput="setCustomValidity('')">
                                            	
                                            	</c:when>
                                            	<c:otherwise>
                                            		<input type="text" name="tmaxliketimes" id="form-field-1" placeholder="总最大点赞数" class="form-control"   oninput="setCustomValidity('')">
                                            	
                                            	</c:otherwise>
                                            </c:choose>
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
                                            <a class="btn btn-info" href="admin/photography-add"> <i
												class="icon-edit bigger-125"></i> 添加文档
											</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">

                                </div>
                            </div>

                            <div class="table-header">
                                摄影更新信息
                            </div>

                            <div class="table-responsive">
                                <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="center">选择</th>
                                        <th>序号</th>
                                        <th>作者</th>
                                        <th>作品名称</th>
                                        <th>一级类目</th>
                                        <th>二级类目</th>
                                        <th>作品来源</th>
                                        <th>
                                            <i class="icon-time bigger-110 hidden-480"></i>
                                            创建时间
                                        </th>
                                        <th class="hidden-480">操作</th>
                                    </tr>
                                    </thead>
                                      <tbody>
                                        	<c:choose>
                                        		<c:when test="${fn:length(photophotographys.results) > 0 }">
                                        			<c:forEach items="${photophotographys.results }" var="photophotography" varStatus="statu">
	                                        			 <tr id="zixun_tr">
				                                            <td class="center">
				                                                <label>
				                                                    <input type="checkbox" class="ace" />
				                                                    <span class="lbl"></span>
				                                                </label>
				                                            </td>
				                                            <td>${(statu.index+1) }</td>
				                                            <td>${photophotography.title }</td>
				                                            <td>${photophotography.author }</td>
				                                            <td>${photophotography.basicPhotoStyle.photostylename}</td>
				                                            <td>${photophotography.basicSportType.sporttypename}</td>
				                                            <td>${photophotography.origin}</td>
				                                            <td>
				                                            	<%-- <fmt:formatDate value="${photophotography.publishtime}" pattern="yyyy-MM-dd" /> --%>
				                                            	${photophotography.publishtime}
				                                            </td>
				                                            <td> 
				                                                <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
				
				                                                    <a class="blue" href="admin/photography-view?pictureid=${photophotography.pictureid }&photostyleid=${photophotography.styletypeid }&sporttypeid=${photophotography.sporttypeid }">
				                                                        <i class="icon-search bigger-130"></i> 详情
				                                                    </a>
				
				                                                    <a class="green" href="admin/photography?pictureid=${photophotography.pictureid }&photostyleid=${photophotography.styletypeid }&sporttypeid=${photophotography.sporttypeid }">
				                                                        <i class="icon-pencil bigger-130"></i> 编辑
				                                                    </a>
				                                                   <a class="red" style="cursor:pointer;" href="javascript:void(0);" data-did="${photophotography.pictureid}"
				                                                   <%-- href="admin/photography-del?pictureid=${photophotography.pictureid}&photourl=${photophotography.photourl}"   --%><%--  attr-id="${photophotography.pictureid }" --%>>
				                                                        <i class="icon-trash bigger-130"></i> 删除
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
                            	<div class="row">
									<div class="col-sm-8 col-sm-offset-4">
										<div class="dataTables_paginate paging_bootstrap">
											<ul class="pagination">${pageStr}
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
<jsp:include page="../foot.jsp"/>

	<script type="text/javascript">
		$ ('.date_calendar').datetimepicker({
			timeFormat : "HH:mm:ss",
			dateFormat : "yy-mm-dd",
			showSecond : true,
			beforeShow : function(input) {
				$(input).css({
					"position" : "relative",
					"z-index" : 9999
				});
			}
		}); 
		$(".red").click(
				function() {
					var data = new Object();
					data.pictureid = $(this).data('did');
					//alert(data.equipid);
					jQuery.ajax({
						headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						},
						type : "POST",
						url : "admin/photography-del",
						data : JSON.stringify(data),
						success : function(message, tst, jqXHR) {
							if (message.result == "success") {
								return dialog.success(message.messageInfo,
										"/ostp/admin/photography-list");
							} else {
								return dialog.error(message.result);
							}
						}
					});
				})
	</script>
	<script type="text/javascript">
$("body").on("click",".pagination li a",function(){
	var url = $(this).attr("href");
	var datas = $("#potography-select").serialize();
	$(this).attr("href","javascript:;");
	$.ajax({
		url : url,
		type : "POST",
		data : datas,
		//async: false,
		dataType : "json",
		success : function(data){
			var pageStr = data[0];
			var photophotography = data[1];
			var html = "";
			for(var i = 0; i < photophotography.length; i++) {
				html += "<tr>"
					+"<td class=\"center\">"
						+"<label>"
							+"<input type=\"checkbox\" class=\"ace\" />"
							+"<span class=\"lbl\"></span>"
						+"</label>"
					+"</td>"
					+"<td>"+(i + 1)+"</td>"
					+"<td>"+photophotography[i].title +"</td>"
					+"<td>"+photophotography[i].author +"</td>"
					+"<td>"+photophotography[i].basicPhotoStyle.photostylename +"</td>"
					+"<td>"+photophotography[i].basicSportType.sporttypename +"</td>"
					+"<td>"+photophotography[i].origin+"</td>"
					+"<td>"+photophotography[i].publishtime.toString()+"</td>"
					+"<td>"
						+"<div class='visible-md visible-lg hidden-sm hidden-xs action-buttons'>"
							+"<a class='blue' href='admin/photography-view?pictureid="+photophotography[i].pictureid +"&photostyleid="+photophotography[i].styletypeid +"&sporttypeid="+photophotography[i].sporttypeid +"'>"
								+"<i class=\"icon-search bigger-130\"></i> 详情"
						    +"</a>"
						    +"<a class=\"green\" href=\"admin/photography?pictureid="+photophotography[i].pictureid +"&photostyleid="+photophotography[i].styletypeid +"&sporttypeid="+photophotography[i].sporttypeid +"\">"
					         	+"<i class=\"icon-pencil bigger-130\"></i> 编辑"
						     +"</a>"
						     +" <a class=\"red\" href=\"admin/photography-del?pictureid="+photophotography[i].pictureid +"&pictureurl="+photophotography[i].pictureurl +"\" id=\"delete_a\">"
						         +"<i class=\"icon-trash bigger-130\"></i> 删除"
							 +"</a>"
						+"</div>"
					+"</td>"
				+"</tr>";
			}
			$("#sample-table-2 tbody").empty().append(html);
			$(".pagination li").detach();
			//$(".pagination").empty().append(pageStr);
			$(".pagination").append(pageStr);
		},
	});
});
</script>
</body>
</html>