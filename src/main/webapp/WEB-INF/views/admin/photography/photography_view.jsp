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
    <title>摄影详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
    <jsp:include page="../head.jsp"/>
</head>
<body>
<!--将这一部分1转化成ifream-->
<div class="main-content"  style="margin-left:0;margin-bottom:0;">
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
        </script>

        <ul class="breadcrumb">
            <li>
                <i class="icon-camera-retro"></i>
                <a href="#">摄影管理</a>
            </li>
            <li class="active">摄影详情</li>
        </ul><!-- .breadcrumb -->

    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
                摄影详情
                <small>
                    <i class="icon-double-angle-right"></i>
                    查看
                </small>
            </h1>
        </div><!-- /.page-header -->

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->

                <!--<div class="alert alert-block alert-success">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="icon-remove"></i>
                    </button>

                    <i class="icon-ok green"></i>

                    欢迎进入
                    <strong class="green">
                        OSTP后台管理系统
                        <small>(v1.0)</small>
                    </strong>
                </div>-->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <form>
                           <input type="text" name="pictureid" style="display:none" value="${photophotography.pictureid }">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">一级类目</label>
                                        <div class="col-sm-9">
                                              <select class="form-control" name="styletypeid">
                                              	<option >${photophotography.basicPhotoStyle.photostylename }</option>
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
                                             	<option >${photophotography.basicSportType.sporttypename }</option>          	
                                             </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">照片参数</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="photoparam"  placeholder="photoparams" class="form-control" disabled="disabled" value=${photophotography.photoparam }>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作品名称</label>
                                        <div class="col-sm-9">
                                           <input type="text" id="form-field-1" name="title" placeholder="tilte" class="form-control" disabled="disabled" value="${photophotography.title }">	
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作者</label>
                                        <div class="col-sm-9">
                                        	<input type="text" id="form-field-1" name="author" placeholder="author" class="form-control" disabled="disabled" value="${photophotography.author }" >    	
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作品来源</label>
                                        <div class="col-sm-9">
                                        	<input type="text" id="form-field-1" name="origin" placeholder="origin" class="form-control" disabled="disabled" value="${photophotography.origin }">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">昨日点赞数</label>

                                        <div class="col-sm-9">
                                        	<input type="text" id="form-field-1" name="currentliketimes" placeholder="currentliketimes" class="form-control" disabled="disabled" value="${photophotography.currentliketimes }">  
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">总点赞数</label>

                                        <div class="col-sm-9">
                                              
                                                    		<input type="text" id="form-field-1" name="totalliketimes" placeholder="totalliketimes" class="form-control" disabled="disabled" value="${photophotography.totalliketimes }">
                                                		
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">照片等级</label>
                                        <div class="col-sm-9"> 
                                            <input type="text" id="form-field-1" name="leveltype" placeholder="leveltype" class="form-control" disabled="disabled" value="${photophotography.leveltype }">
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
                                            <input type="text" name="publishtime" id="form-field-1" placeholder="yyyy-mm-dd" class="form-control"  disabled="disabled" value="${photophotography.publishtime }" oninput="setCustomValidity('')">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">列表图片</label>

                                        <div class="col-sm-9"><c:choose>
                                        		<c:when test="${photophotography.photourl == null }">
                                        			没有图片
                                        		</c:when>
                                        		<c:otherwise>
                                        		<img style="width:80px;height:80px" alt="图片" src="${photophotography.photourl }">
                                        		</c:otherwise>
                                        	</c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-xs-12 control-label no-padding-right" for="form-field-1">摄影内容</label>
										<div class="col-xs-9" style="padding:10px 25px;">
                                       			${photophotography.introduction }
											<p class="help-block text-danger"></p>
										</div>
									</div>
                            </div>
                            <br />
                        </form>

                    </div><!-- /.col -->
                </div><!-- /.row -->

                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div><!-- /.main-content -->
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
<jsp:include page="../foot.jsp"/>
</body>
</html>