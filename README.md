# ostp
# 户外运动
##后台构建中，运用了javaweb的ssm三大框架
##160818:删除多余的前端代码失败。等待后期有时间进行整改
##160820:导入了新的前端ui（可能存在乱码问题）,对控制器进行了部分修改。控制器导入iframe包含文件路径出现问题
##160820:乱码问题搞定，修改了控制器。路径问题解决。可以开始资讯模块构建
##160820:基本将前端界面与后端代码对接。但是url安全方面存在较大问题。前端代码不严谨随意导包导致js报错！
分支测试
##160821:咨询数据的遍历以及咨询的添加已完成，下一步等待咨询的搜索以及咨询的删除
##160821:咨询添加时infoid为int型明显有问题，数据库的id均为char型
##160822:页面传值失败，很可能是因为添加时id为int型。未知原因导致css，js路径出现问题
##160823:infoid为int类型解决，现在存在问题
###1。二级项目存的是字符串而不是id值
###2.图片上传及图片的验证，由于无法通过验证暂时注释
###3.富文本由于位置原因被我玩坏了
###4.更新完后重新载入咨询列表时由于控制器未对数据库进行检索因此数据为空
##160824:处理资讯添加页面的三个复选框操作，每个复选框都改成了从后台动态获取数据，因此将前台（Zixun_add.jsp）的复选框中的静态数据删除了，并且也将sport_zixun.js从Zixun_add.jsp中移除。请将本次上传的.sql文件（数据库）更新到自己的数据库中方便使用数据。
##160825:添加图片上传功能
##160829：合并张微老师的代码