package com.peace.ostp.util;
public class PagingUtil {

	/**
	 * 返回anchor类型的分页
	 * @param currentPageNo
	 * @param maxPageNo
	 * @param parameters
	 * @param url
	 * @return
	 */
	public static String getPagelink(int currentPageNo, int maxPageNo, String parameters, String url) {

		int begainNo = currentPageNo - 5 > 0 ? currentPageNo - 5 : 1;
		int endNo = begainNo + 9 > maxPageNo ? maxPageNo : begainNo + 9;
		StringBuffer bf = new StringBuffer();
	
		if (maxPageNo > 1) {
			bf.append("	<li><input type=\"number\" value=\""+currentPageNo+"\" id=\"toGoPage\" style=\"width:50px;height:32px;text-align:center;float:left\" placeholder=\"页码\"/></li>\n");
			bf.append("	<li style=\"cursor:pointer;\"><a onclick=\"toTZ('"+url+"')\" style=\"height:32px;\" class=\"btn btn-mini btn-success\">跳转</a></li>\n");
			bf.append(currentPageNo==1?("<li class=\"disabled\"><a>首页</a></li>"):("<li><a href=\"" + url +"?page=1\">首页</a></li>"));
			bf.append(currentPageNo > 1 ? ("<li><a href = \"" + url + "?page=" + (currentPageNo - 1 > 1 ? currentPageNo - 1 : 1) + parameters + "\">上一页</a></li>") : "<li class=\"disabled\"><a>上一页</a></li>");
			for (int i = begainNo; i <= endNo; i++) {

				if (i == currentPageNo) {

					bf.append("<li class=\"active\"><a href = \"" + url + "?page=" + i + parameters + "\" >" + i + "</a></li>");
				} else
					bf.append("<li><a href = \"" + url + "?page=" + i + parameters + "\" >" + i + "</a></li>");
			}
			bf.append(currentPageNo < maxPageNo ? ("<li><a href = \"" + url + "?page=" + (currentPageNo + 1 > maxPageNo ? maxPageNo : currentPageNo + 1) + parameters + "\">下一页</a></li>") : "<li class=\"disabled\"><a>下一页</a></li>");
			bf.append(currentPageNo==maxPageNo?("<li class=\"disabled\"><a>尾页</a></li>"):("<li><a href=\"" + url +"?page="+maxPageNo+"\">尾页</a></li>"));
			bf.append("	<li><a>共"+maxPageNo+"页</a></li>\n");
			
			return bf.toString();
		}
		return "";

	}
	
	
	/**
	 * 返回button类型的分页
	 * @param currentPageNo
	 * @param maxPageNo
	 * @return
	 */
	/*public static String getPageBtnlink(int currentPageNo, int maxPageNo) {

		currentPageNo = currentPageNo > maxPageNo ? maxPageNo : currentPageNo;
		int begainNo = currentPageNo - 5 > 0 ? currentPageNo - 5 : 1;
		int endNo = begainNo + 9 > maxPageNo ? maxPageNo : begainNo + 9;
		StringBuffer bf = new StringBuffer();

		if (maxPageNo > 1) {
			bf.append(currentPageNo > 1 ? ("<li><a data-id = \"" + (currentPageNo - 1 > 1 ? currentPageNo - 1 : 1) + "\" >上一页</a></li>") : "<li class=\"disabled\"><a>上一页</a></li>");
			for (int i = begainNo; i <= endNo; i++) {

				if (i == currentPageNo) {

					bf.append("<li class=\"active\"><a data-id = \"" + i + "\">" + i + "</a></li>");
				} else
					bf.append("<li><a data-id = \"" + i + "\" >" + i
							+ "</a></li>");
			}
			bf.append(currentPageNo < maxPageNo ? ("<li><a data-id = \"" + (currentPageNo + 1 > maxPageNo ? maxPageNo : currentPageNo + 1) + "\" >下一页</a></li>") : "<li class=\"disabled\"><a>下一页</a></li>");
			return bf.toString();
		}
		return "";

	}*/
	public static String getPageBtnlink(int currentPageNo, int maxPageNo) {
		currentPageNo = currentPageNo > maxPageNo ? maxPageNo : currentPageNo;
		int begainNo = currentPageNo - 5 > 0 ? currentPageNo - 5 : 1;
		int endNo = begainNo + 9 > maxPageNo ? maxPageNo : begainNo + 9;
		StringBuffer bf = new StringBuffer();

		if (maxPageNo > 1) {
			bf.append("	<li><input id=\"toGoPage\""+" type=\"number\" value=\""+currentPageNo+"\" style=\"width:50px;height:32px;text-align:center;float:left\" placeholder=\"页码\"/></li>\n");
			bf.append("	<li style=\"cursor:pointer;\"><a data-id = \"" + 0 + "\" style=\"height:32px;\" class=\"btn btn-mini btn-success\">跳转</a></li>\n");
			bf.append(currentPageNo==1?("<li style=\"cursor:pointer;\" class=\"disabled\"><a >首页</a></li>"):("<li style=\"cursor:pointer;\"><a class=\""+ "pagebutton\"" +" data-id = \"" + 1 + "\">"+"首页"+"</a></li>"));
			bf.append(currentPageNo > 1 ? ("<li style=\"cursor:pointer;\"><a class=\""+ "pagebutton\"" +" data-id = \"" + (currentPageNo - 1 > 1 ? currentPageNo - 1 : 1) + "\" >上一页</a></li>") : "<li style=\"cursor:pointer;\" class=\"disabled\"><a>上一页</a></li>");
			for (int i = begainNo; i <= endNo; i++) {

				if (i == currentPageNo) {

					bf.append("<li style=\"cursor:pointer;\" class=\"active\"><a class=\""+ "pagebutton\"" +" data-id = \"" + i + "\">" + i + "</a></li>");
				} else
					bf.append("<li style=\"cursor:pointer;\"><a class=\""+ "pagebutton\"" +" data-id = \"" + i + "\" >" + i
							+ "</a></li>");
			}
			bf.append(currentPageNo < maxPageNo ? ("<li style=\"cursor:pointer;\"><a class=\""+ "pagebutton\"" +" data-id = \"" + (currentPageNo + 1 > maxPageNo ? maxPageNo : currentPageNo + 1) + "\" >下一页</a></li>") : "<li style=\"cursor:pointer;\" class=\"disabled\"><a>下一页</a></li>");
			bf.append(currentPageNo==maxPageNo?("<li style=\"cursor:pointer;\" class=\"disabled\"><a>尾页</a></li>"):("<li style=\"cursor:pointer;\"><a class=\""+ "pagebutton\"" +" data-id = \"" + (currentPageNo + 1 > maxPageNo ? maxPageNo : currentPageNo + 1) + "\">尾页</a></li>"));
			bf.append("	<li><a>共"+maxPageNo+"页</a></li>\n");
			return bf.toString();
		}
		return "";
	}
	
	public static void main(String[] args){
		System.out.println(PagingUtil.getPageBtnlink(1,3));
	}

}
