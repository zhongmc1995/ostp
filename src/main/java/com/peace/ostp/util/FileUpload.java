package com.peace.ostp.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * 
 * @author yls
 * 
 * 使用说明：当要使用这个方法进行上传文件的时候直接调用uploadFile(MultipartFile file,
 *	 		HttpServletRequest request)方法，然后调用getFilePath(MultipartFile file)
 *	  		返回文件名进行使用使用参考PositionController类中的position-insert方法
 *
 */
public class FileUpload {
	
	 //

	public static String FILE_PATH = "resources/upload"; // 上传相对地址
	private static String singleName = null;//文件上传唯一名
	private static File tempFile;
	
	public FileUpload() {
		
	}
	
	public FileUpload(MultipartFile file,
			HttpServletRequest request){
	}

	/**
	 * 文件上传
	 * @param file 接收前台文件
	 * @param request
	 * @return     返回文件名
	 * @throws IOException
	 */
	public String uploadFile(MultipartFile file,
			HttpServletRequest request) throws IOException {
		if(file.isEmpty()){
			return null;
		} else {
			String fileName = file.getOriginalFilename();
			String folder = request.getSession().getServletContext()
					.getRealPath("/" + FILE_PATH);
			System.out.println("上传文件的路径："+folder);
			//singleName = new Date().getTime() + String.valueOf(fileName);
			singleName = StringUtil.getUuid();
			tempFile = new File(folder, singleName);
			if (!tempFile.getParentFile().exists()) {
				tempFile.getParentFile().mkdir();
			}
			if (!tempFile.exists()) {
				tempFile.createNewFile();
			}
			file.transferTo(tempFile);
			return fileName;
		}
	}
	
	/**
	 * 返回上传文件的完整路径
	 * @param file 
	 * @return
	 */
	public String getFilePath(MultipartFile file) {
		if(file.isEmpty()) 
			return null;
		return FILE_PATH + "/" + singleName;
	}
	
	/**
	 * 获取文件名称
	 * @return
	 */
	public String getSingleName() {
		return singleName;
	}

	public File getFile(String fileName) {
		return new File(FILE_PATH, fileName);
	}
	
	/**
	 * 删除文件
	 * @param pathname 文件路径
	 */
	public void deletFile(String pathname,HttpServletRequest request) {
		String filePath = request.getSession().getServletContext()
				.getRealPath("/" + pathname);
		File file = new File(filePath);
		if (!file.exists())
			System.out.println("删除的文件失败，文件不存在");
		else {
			file.delete();
		}
		
	}
}
