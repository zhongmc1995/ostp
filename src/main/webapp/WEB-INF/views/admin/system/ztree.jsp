<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>系统管理</title>
<base href="<%=basePath%>">
<link rel="stylesheet"
	href="resources/ztree/css/metroStyle/metroStyle.css" type="text/css">
<script type="text/javascript"
	src="resources/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="resources/ztree/js/jquery.ztree.excheck.js"></script>

<SCRIPT type="text/javascript">
	var setting = {
		check : {
			enable : true
		},
		data : {
			simpleData : {
				enable : true
			},
			key : {
				id : "id",
				pid : "parentid",
				name : "menuname"
			}
		},
		callback : {
			onCheck : onCheck
		}
	};

	var zNodes = ${json};
	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);

	});
	var ids = "";
	function onCheck(e, treeId, treeNode) {
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");

		nodes = treeObj.getCheckedNodes(true);
		ids = "";
		for (var i = 0; i < nodes.length; i++) {
			ids += nodes[i].id + ",";
		}
	}

	$(function() {
		roleAuthority.initial();

	});
	var roleAuthority = {
		initial : function initial() {
			this.bindSubmitForm();
		},
		bindSubmitForm : function bindSubmitForm() {
			var form = $("form#role-authority-form");
			form.submit(function() {
				if (true) {
					jQuery.ajax({
						headers : {
							'Accept' : 'application/json',
							'Content-Type' : 'application/json'
						},
						type : "POST",
						url : "admin/role-authority?roleId="
								+ $("#roleId").val(),
						data : ids,
						success : function(message, tst, jqXHR) {
							if (message.result == "success") {
								return dialog.success(message.messageInfo,"admin/system-role");
							} else {
								return dialog.error(message.result);
							}
						}
					});
				}
				return false;
			});

		},

	};
</SCRIPT>


</head>

<body>
	<ul id="treeDemo" class="ztree"></ul>
</body>
</html>
