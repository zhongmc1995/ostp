<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" 
	import="com.ibcio.WebSocketMessageServlet" 
	import="com.peace.ostp.security.UserInfo"
	import= "org.springframework.security.core.context.SecurityContextHolder"%>	
<%
//获取当前管理员信息
	UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	session.setAttribute("user", userInfo.getUsername());
	String name = (String)session.getAttribute("user");
%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/websocket/css/chat.css" />
<script type="text/javascript" src="resources/websocket/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="resources/websocket/js/chat.js"></script>
<script type="text/javascript">
	var self = "<%=name%>";
</script>
<title>聊天室</title>
</head>
<body onload="startWebSocket();">
<!-- 登录成功提示音 -->
<audio id="login" src="resources/websocket/audio/test1.wav"> </audio>
<!-- 有消息提示音 -->
<audio id="message1" src="resources/websocket/audio/test2.wav"></audio>
<!-- 有消息提示音 -->
<audio id="message0" src="resources/websocket/audio/test3.wav"></audio>
<div class="kePublic">
<!--效果html开始-->
    <div class="content">
        <div class="chatBox">
            <div class="chatLeft">
                <div class="chat01">
                    <div class="chat01_title">                    
                        <ul class="talkTo">
                            <li><a href="javascript:;"><span style="font-size:16px;" id="userName"></span>
					<span id="denglu" style="color:red;">正在登录</span></a></li></ul>               
                    </div>
                    <div class="chat01_content">   	
                    </div>
                </div>
                <div class="chat02">
                    <div class="chat02_title">           
                    	<h4 style="color:#6B8E23;padding-top:5px;"><b>发送信息:</b></h4>  	                  
                    </div>
                    <div class="chat02_content">
                        <textarea id="textarea" style="font-size:20px;"></textarea>
                    </div>
                    <div class="chat02_bar">
                        <ul>
                            <li style="right: 5px; top: 5px;"> <a href="javascript:;">
                                <img src="resources/websocket/images/send_btn.jpg" alt="发送" onclick="sendMsg()"></a> </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="chatRight">
                <div class="chat03" style="overflow:auto">
                    <div class="chat03_title">
                        <label class="chat03_title_t">
                           	 成员列表</label>
                    </div>
                    <div class="chat03_content">
                        <ul class="onlineuser">
                        </ul>
                    </div>
                </div>
            </div>
            <div style="clear: both;">
            </div>
        </div>
    </div>
<!--效果html结束-->
</div>
</body>
</html>



