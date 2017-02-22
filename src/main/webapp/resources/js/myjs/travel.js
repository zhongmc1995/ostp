
//封面图片处理
	function BrowseServer(){
		var finder = new CKFinder();
		finder.basePath ='<%=request.getContextPath()%>/userfiles/';
		finder.selectActionFunction = SetFileField; //当选中图片时执行的函数
		finder.popup();//调用窗口       
	}
			//文件选中时执行
			//fileUrl所选中文件的路径
	function SetFileField(fileUrl) {
		$("#pic").attr("src", fileUrl);
		$("#travelpicture").val(fileUrl);
	}
//位置添加弹出层
var account = 0;//删除次数
$("#add_position").on('click',function() {
	$("#get-posi").empty();
	var html = $("#posi-content").html();
	layer.open({
		  title: "位置信息",
		  type: 1,
		  skin: 'layui-layer-rim', //加上边框
		  area: ['90%', '70%'], //宽高
		  shadeClose: false, //点击遮罩关闭(true为点击遮罩关闭，false则禁止这个事件)
		  content: html,
		  scrollbar: false,
		});
	$(".layui-layer").on("click",".btn_add",function(){
		var index=$(this).attr('attr-id');
		var posi_name = $(".posi_tr").find("td").eq(index).text();
		var html = "";
		html = "<p class='ad_posi'><i class=\"icon-tint bigger-130\"></i>"
					+posi_name
					+"<a class=\"blue btn_cancle\" href=\"javascript:void(0);\">"
						+"<i class=\"icon-remove bigger-130\"></i>"
					+"</a>"
				+"</p>";
		$("#get-posi ").append(html);
		/* $(".posi_tr").eq(index).hide(); */
	});
	$(".layui-layer").on("click",".btn_cancle",function(){
		$(this).parent().removeClass("ad_posi");
		$(this).parent().remove();
		account++;
	});
	 $(".layui-layer").on('click',"#btn_fini",function() {
		 finish();
		 //layer.closeAll('dialog'); 强制关闭所有层
		 layer.closeAll('page');  //关闭所有页面层
	});
	 $(".layui-layer").on("click",".pagination li a",function() {
		var url = $(this).attr("href");
		$(this).attr("href","javascript:void(0);");
		positionList(url);
	 });
	 $(".layui-layer").on("click","#select_posi",function() {
		var url = $('#position-select').attr('action')+"?page=1";
		//var url = "admin/travel-positions-page?page=1"
		positionList(url);
	 });
});
//日期格式化
$('.date_calendar').datetimepicker({
    timeFormat: "HH:mm:ss",
    dateFormat: "yy-mm-dd",
    showSecond:true,
    beforeShow:function(input){
        $(input).css({
            "position":"relative",
            "z-index":9999
        });
    }
});
//修改ckeditor框中的内容
function finish(){
	var html = [];
	var len=$("#get-posi .ad_posi").length;
	for(var n=0,i=(len+account)/2;i<len;i++,n++){
		html[n]="<p>"+$("#get-posi .ad_posi").eq(i).html()+"</p>";
	}
	var oldData = myEditor.document.getBody().getHtml();
	var htmlStr=html.join("");
	myEditor.setData(oldData+htmlStr);
}

//位置列表
function positionList(url) {
	for(var i = 0 ; i < ($("#position-select input[name]").length / 2); i++) {
		$("#position-select input[name]").eq(i).addClass("posi_inp");
	}
	var datas = $("#position-select input[name]:not(.posi_inp)").serialize();
	console.log(datas);
	$.ajax({
		url : url,
		type : "POST",
		data : datas,
		async: false,
		dataType : "json",
		success : function(data){
			var pageStr = data[0];
			var positions = data[1];
			var html = "";
			if(positions.length > 0) {
				for(var i = 0; i < positions.length; i++) {
					html += "<tr class='posi_tr'>"
						+"<td>"+(i + 1)+"</td>"
						+"<td>"+positions[i].positionname +"</td>"
						+"<td>"+positions[i].positioncoordinate +"</td>"
						+"<td>"+positions[i].positionTypeInfo.positiontypename +"</td>"
						+"<td>"+positions[i].basicSportType.sporttypename +"</td>"
						+"<td>"+positions[i].positiontime+"</td>"
						+"<td>"
							+"<div class=\"visible-md visible-lg hidden-sm hidden-xs action-buttons\">"
	                           	+"<a class=\"blue btn_add\" href=\"javascript:void(0);\" attr-id="+(i + 1)+">"
	                           		+"<i class=\"icon-plus bigger-130\"></i> 添加"
	                       		+"</a>"
	                   		+"</div>"
	                  	+"</td>"
					+"</tr>";
				}
			} else {
				html += "<tr class='posi_tr'><td colspan=\"7\" align=\"center\">对不起，暂无数据！</td></tr>"
			}
			$("#sample-table-2 tbody").empty().append(html);
			$(".pagination li").detach();
			//$(".pagination").empty().append(pageStr);
			$(".pagination").append(pageStr);
		},
	});
}
