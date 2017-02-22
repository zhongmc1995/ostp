/**
 * 
 */
$("button.save").on('click',function(){
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

function BrowseServer() {
	var finder = new CKFinder();
	finder.basePath = '<%=request.getContextPath()%>/userfiles/';
	finder.selectActionFunction = SetFileField; //当选中图片时执行的函数
	finder.popup();//调用窗口       
}
		//文件选中时执行
		//fileUrl所选中文件的路径
function SetFileField(fileUrl) {
	$("#pic").attr("src", fileUrl);
	$("#coverpicture").val(fileUrl);
}

$("a.red").on('click',function(){
	var url = $(this).data('url');
	layer.open({
        type:0,
        title:'是否提交?',
        btn:['yes','no'],
        icon:3,
        closeBtn:2,
        content:'是否确定操作',
        scrollbar:true,
        yes:function(){
            //执行跳转			 	
        	dialog.success("删除成功！",url);
        },
    });	
});
