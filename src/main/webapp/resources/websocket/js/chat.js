/**
 * AUTOOR:ggr
 * DESCRIPTION:即时通信关键js
 * TIME：2016-12-01
 */
	var ws = null;//定义websocket连接
	toName="all";//信息接收方，默认广播方式
	
	/**
	 * 实现窗口标题在收到消息时闪烁
	*/ 
	var flashStep=0;  //交替变量
	
	var flashTitleRun = false; //是否正在执行
	
	var normalTitle = "聊天室"; 
	
	//当前浏览器窗口是否处于焦点
	var isWindowFocus = true;

	function focusin() { isWindowFocus=true;}

	function focusout() { isWindowFocus=false;}

	//注册焦点变化监听器

	if ("onfocusin" in document){//for IE 

	    document.onfocusin = focusin;

	    document.onfocusout = focusout;

	} else {

	    window.onblur = focusout;

	    window.onfocus= focusin;

	}

	function flashTitle()  

	{  

	 //仅窗口不在焦点时闪烁title，回到焦点时停止闪烁并将title恢复正常

	 if(isWindowFocus){//当前处于焦点

	  document.title=normalTitle;

	  flashTitleRun = false;

	  return;//退出循环

	 }
	 
	 flashTitleRun = true;

	 flashStep++;  

	 if (flashStep==3) {flashStep=1;}  

	 if (flashStep==1) {
		 document.title="【您有新的消息】";	
	 }  

	 if (flashStep==2) {document.title="【                    】";}  

	 setTimeout("flashTitle()",200);  //循环

	} 

	//调用这个执行标题闪烁，而不是直接调用flashTitle，保证多次调用只会执行一次。

	function doFlashTitle(){
	 if(!flashTitleRun)    //没有执行时，才执行
		 flashTitle();
	}
	
	/**
	 * websocket部分
	 */
	function startWebSocket() {
		var ip_addr = document.location.hostname;
		console.info(ip_addr);	
		if ('WebSocket' in window){
			//alert(ip_addr);
			ws = new WebSocket("ws://"+ip_addr+":8080/ostp/websocket");
		}
		else if ('MozWebSocket' in window)
			ws = new WebSocket(encodeURI("ws://"+ip_addr+":8080/ostp/websocket"));
		else
			alert("not support");
		ws.onmessage = function(evt) {
			var data = evt.data;
			var o = eval("(" + data + ")");//将字符串转换成JSON  
			if (o.type == 'message') {
				setMessageInnerHTML(setmessage(o.data));
				//alert(setmessage(o.data));
				/*滚动条自动到底部*/
				var d=$(".chat01_content");
				d.scrollTop(d.prop("scrollHeight"));
				//提示音实现
				var temp3 = $("#message1")[0];
				temp3.volume = 0.6;
				temp3.speed  = 0.6;
				temp3.play();
				doFlashTitle();//实现标题闪烁
			} else if (o.type == 'user') {
				//提示音实现
				var temp2 = $("#message0")[0];
				temp2.speed  = 0.6;
				temp2.play();
				var userArry = o.data.split(',');
				$(".onlineuser").empty();//清空用户列表
				$(".onlineuser").append("<li class='to' id='all'><label class='online'></label><a href='javascript:;'><img src='resources/websocket/images/all.PNG'></a><a style='font-size:14px;'>所有用户</a></li>");
				$.each(userArry, function(n, value) {
					if (value != self) {
						$(".onlineuser").append("<li class='to' id='"+value+"'><label class='online'></label> <a href='javascript:;'><img src='resources/websocket/images/you.PNG'></a><a style='font-size:14px;' class='chat03_name'>"+value+"</a></li></a>");
					}
				});
			}
			$(".to").click(function(){
				//$('.chat01_content').empty();
				$(this).css("background","#D1EEEE");
				$(this).siblings().css("background","#FFFFFF");
				var to = $(this).attr('id');		
				toName=to;
			});
		};
		ws.onclose = function(evt) {
			$('#denglu').html("离线");
		};

		ws.onopen = function(evt) {
			$('#denglu').html("在线");
			$('#userName').html(self);
			var temp1 = $("#login")[0];
			temp1.volume = 0.6;
			temp1.play();
		};
		
		//出现异常，直接关闭
		ws.onerror = function (event) {
			if(ws.readyState==1){
				onclose(event);
			}	
		};
	}

	function setMessageInnerHTML(innerHTML) {
		var temp = $('.chat01_content').html();
		temp +=innerHTML + '<br/>';
		$('.chat01_content').html(temp);
	}
	function sendMsg() {
		/**
		 * 状态检验
		 */
		if(($("#denglu").html()=="离线")||($("#denglu").html()=="正在登录")){
			alert("请先登录！");
			return;
		}
		var online = new Array();
		online=$(".to");
		if(online.size()>1){
			var fromName = self;
			var content = $("#textarea").val(); //发送内容
			if(content==""){
				alert("请输入发送信息！");
				return;
			}
			var time = getNowFormatDate(new Date());
			var msg = fromName + "," + toName + "," + content + "," + time;
			$("#textarea").val("");
			ws.send(msg);
		}else{
			alert("无聊天对象！");
		}	
	}

	//样式拼装
	function setmessage(e){	
		var message = e.split("|");
		//发送方
		var from = message[0];
		//信息
		var msg = message[1];
		//时间
		var time = message[2];
		
		var img;
		if (from == $("#userName").text()) {
			 img = "<img src='resources/websocket/images/me.jpg' style='heigth:50px;width:50px'/>";
		} else {
			 img = "<img src='resources/websocket/images/you0.jpg' style='heigth:50px;width:50px'/>";
		}
	    message = "<div class='message clearfix'><div class='user-logo'>"+img+
		"</div><div class='wrap-text'><h5 class='clearfix' style='font-size:16px;'> "+from+"</h5><div style='font-size:20px;'>"+msg
		+"</div></div><div class='wrap-ri'><div class='clearfix'><span style='color:#5CACEE'><b>"+time
		+"</b></span></div></div><div style='clear:both;'></div></div>";
		return message;
	}

	//格式化时间
	function getNowFormatDate(data) {
		var date = data;
		var seperator1 = "-";
		var seperator2 = ":";
		var month = date.getMonth() + 1;
		var strDate = date.getDate();
		if (month >= 1 && month <= 9) {
			month = "0" + month;
		}
		if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
		}
		var currentdate = date.getFullYear() + seperator1 + month + seperator1
				+ strDate + " " + date.getHours() + seperator2
				+ date.getMinutes() + seperator2 + date.getSeconds();
		return currentdate;
	}
	
	
	
	
	