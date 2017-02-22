<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
    <title>摄影编辑</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
	<jsp:include page="../head.jsp"/>
</head>
<body>
<!--将这一部分1转化成ifream-->
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
            <li class="active">摄影编辑</li>
        </ul><!-- .breadcrumb -->

    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
                摄影编辑
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

                        <form action="admin/photography-edit" method="POST" enctype="multipart/form-data">
                        <input type="text" name="pictureid" style="display:none" value="${photophotography.pictureid }">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">一级类目</label>

                                        <div class="col-sm-9">
                                            <!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
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
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">二级类目</label>

                                        <div class="col-sm-9">
                                            <!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
                                             <select class="form-control" name="sporttypeid">
                                                    <option value=""></option>
		                                                <c:forEach items="${sportType }" var="sportType" varStatus="status">
		                                                	<c:choose>
		                                                		<c:when test="${photophotography.sporttypeid==sportType.SportTypeID }">//为什么是大写
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
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">照片参数</label>

                                        <div class="col-sm-9">
                                            <input type="text" name="photoparam"  placeholder="photoparams" class="form-control" value=${photophotography.photoparam }>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">作品名称</label>
											<div class="col-sm-9">
												<input type="text" id="form-field-1" name="title"
													placeholder="tilte" class="form-control"
													value="${photophotography.title }">
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">作者</label>
											<div class="col-sm-9">
												<input type="text" id="form-field-1" name="author"
													placeholder="author" class="form-control"
													value="${photophotography.author }">
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">作品来源</label>
											<div class="col-sm-9">
												<input type="text" id="form-field-1" name="origin"
													placeholder="origin" class="form-control"
													value="${photophotography.origin }">
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
												<input type="text" id="form-field-1" name="currentliketimes"
													placeholder="currentliketimes" class="form-control"
													value="${photophotography.currentliketimes }">
											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">总点赞数</label>

											<div class="col-sm-9">

												<input type="text" id="form-field-1" name="totalliketimes"
													placeholder="totalliketimes" class="form-control"
													value="${photophotography.totalliketimes }">

											</div>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">照片等级</label>
											<div class="col-sm-9">
												<input type="text" id="form-field-1" name="leveltype"
													placeholder="leveltype" class="form-control"
													value="${photophotography.leveltype }">
											</div>
										</div>
									</div>
								</div>
								<br />
                            <div class="row">

                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">发布时间</label>
                                        <div class="col-sm-9">
                                             <input type="text" name="publishtime"id="form-field-1" placeholder="yyyy-mm-dd" onclick="laydate({istime: false, format: 'YYYY-MM-DD'})" class="aydate-icon form-control"  value="${photophotography.publishtime }" oninput="setCustomValidity('')">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">列表图片</label>

                                        <div class="col-sm-9">
                                        			<img id="pic" onclick="BrowseServer()"
													style="width: 50px; height: 50px" alt="无图片"
													src="${photophotography.photourl}"> 
													<input
													type="hidden" value="" name="photourl"
													id="getphotourl" placeholder="图片">
                                            

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-xs-12 control-label no-padding-right" for="form-field-1">摄影内容</label>
                                    <div class="col-xs-12">
                                        <textarea rows="10" cols="60" id="editor" name="introduction"
												oninvalid="setCustomValidity('请输入摄影内容')"
												oninput="setCustomValidity('')" class="ckeditor">${photophotography.introduction }</textarea>
                                        <p class="help-block text-danger"></p>
                                       
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="form-actions">
                                    <div class="col-sm-offset-5 col-md-3">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="icon-ok bigger-110"></i>
                                            更新
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
<jsp:include page="../foot.jsp"/>
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
			    $("#getphotourl").val(fileUrl);
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
<script type="text/javascript" src="resources/js/laydate/laydate.js"></script>
</body>
</html>