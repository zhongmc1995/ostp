 
 //删除操作js
 $(".delete_a").on('click',function(){
	console.log(SCOPE);
     var id=$(this).data('id');
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
     $.post(url,data,function(s){
         if(s.result=="success"){
             return dialog.success(s.messageInfo,SCOPE.index_url);
             //跳转到相关页面
         }else{
             return dialog.error(s.result);
         }
     },"JSON");
 }
 
 /*$("body").on("click",".pagination li a",function(){
		var url = $(this).attr("href");
		var datas = $("#position-select").serialize();
		$(this).attr("href","javascript:void(0);");
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
				for(var i = 0; i < positions.length; i++) {
					html += "<tr>"
						+"<td class=\"center\">"
							+"<label>"
								+"<input type=\"checkbox\" class=\"ace\" />"
								+"<span class=\"lbl\"></span>"
								 +"<input type=\"text\" hidden=\"hidden\" value=\""+positions[i].positionid +"\"/>" 
							+"</label>"
						+"</td>"
						+"<td>"+(i + 1)+"</td>"
						+"<td>"+positions[i].positionname +"</td>"
						+"<td>"+positions[i].positioncoordinate +"</td>"
						+"<td>"+positions[i].positionTypeInfo.positiontypename +"</td>"
						+"<td>"+positions[i].basicSportType.sporttypename +"</td>"
						+"<td>"+positions[i].positiondescribe+"</td>"
						+"<td>"+positions[i].positiontime+"</td>"
						+"<td>"
							+"<div class='visible-md visible-lg hidden-sm hidden-xs action-buttons'>"
								+"<a class='blue' href='admin/position-view?positionid='"+positions[i].positionid +"&positiontypeid="+positions[i].positionTypeInfo.positiontypeid +"&sporttypeid="+positions[i].basicSportType.sporttypeid +"'>"
									+"<i class=\"icon-search bigger-130\"></i> 详情"
							    +"</a>"
							    +"<a class=\"green\" href=\"admin/position?positionid='"+positions[i].positionid +"&positiontypeid="+positions[i].positionTypeInfo.positiontypeid +"&sporttypeid="+positions[i].basicSportType.sporttypeid +"\">"
						         	+"<i class=\"icon-pencil bigger-130\"></i> 编辑"
							     +"</a>"
							     +" <a class='red delete_a' href='javascript:void(0);' attr-id='${item.infoId}'>"
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
	});*/