package com.peace.ostp.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sun.image.codec.jpeg.JPEGCodec;

/**
 * 
 * @author yls
 * 
 * 参考链接：http://chenhua-1984.iteye.com/blog/1870812
 *
 */
public class DrawImageUtil {
	
	//原图片路径
	private String originalPath = null;
	//缩略图上传相对地址
	private String THUMBNAIL_PATH = "resources/THUMBNAIL";
	//上传绝对路径（磁盘中完整路径）
	private String completePath = null;
	//图片唯一名和原图同名
	private String singleName = null;
	//原图片宽度
	private int width;
	//原图片高度
	private int height;
	//重置图片宽度
	private int RE_WIDTH = 100;
	//重置图片高度
	private int RE_HEIGHT = 80;
	private Image img;

	public DrawImageUtil() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * 
	 * @param originalPath 原图的完整路径
	 * @param fileName 原图的名字
	 */
	public DrawImageUtil(MultipartFile file,
			HttpServletRequest request, FileUpload fileUpload) {
		this.singleName = fileUpload.getSingleName();
		String filePath = fileUpload.getFilePath(file);
		if(singleName == null){
			System.out.println("原图为空，缩略图无法初始化工作。");
			return;
		}
		originalPath = request.getSession().getServletContext()
				.getRealPath("/" + filePath);
		completePath = creatNewFolder(request, singleName);
		System.out.println("缩略图上保存径:"+completePath);
		File _file = new File(originalPath); // 读入文件
		_file.getName();
		try {
			//resizeFix(RE_WIDTH, RE_HEIGHT);
			 // 构造Image对象
			img = javax.imageio.ImageIO.read(_file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		width = img.getWidth(null); // 得到源图宽
		height = img.getHeight(null); // 得到源图长
	}

	/**
	 * 
	 * @param args
	 */
	@SuppressWarnings("restriction")
	public void resize(int w, int h) throws IOException {
		if (completePath == null) {
			System.out.println("缩略图的保存路径为空，不能完成写入工作。");
			return;
		}
		try {
			BufferedImage _image = new BufferedImage(w, h,
					BufferedImage.TYPE_INT_RGB);
			_image.getGraphics().drawImage(img, 0, 0, w, h, null); // 绘制缩小后的图
			FileOutputStream newimageout = new FileOutputStream(completePath); // 输出到文件流
			/*
			 * JPEGImageEncoder 将图像缓冲数据编码为 JPEG 数据流。该接口的用户应在 Raster 或
			 * BufferedImage 中提供图像数据，在 JPEGEncodeParams 对象中设置必要的参数， 并成功地打开
			 * OutputStream（编码 JPEG 流的目的流）。JPEGImageEncoder 接口可 将图像数据编码为互换的缩略
			 * JPEG 数据流，该数据流将写入提供给编码器的 OutputStream 中。
			 * 注意：com.sun.image.codec.jpeg 包中的类并不属于核心 Java API。它们属于 Sun 发布的 JDK
			 * 和 JRE 产品的组成部分。虽然其它获得许可方可能选择发布这些类，但开发人员不能寄 希望于从非 Sun
			 * 实现的软件中得到它们。我们期望相同的功能最终可以在核心 API 或标准扩 展中得到。
			 */
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimageout);
			encoder.encode(_image); // 近JPEG编码
			newimageout.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * 按照固定的比例缩放图片
	 * 
	 * @param t
	 *            double 比例
	 * @throws IOException
	 */
	public void resize(double t) throws IOException {
		int w = (int) (width * t);
		int h = (int) (height * t);
		resize(w, h);
	}

	/**
	 * 以宽度为基准，等比例放缩图片
	 * 
	 * @param w
	 *            int 新宽度
	 * @throws IOException
	 */
	public void resizeByWidth(int w) throws IOException {
		int h = (int) (height * w / width);
		resize(w, h);
	}

	/**
	 * 以高度为基准，等比例缩放图片
	 * 
	 * @param h
	 *            int 新高度
	 * @throws IOException
	 */
	public void resizeByHeight(int h) throws IOException {
		int w = (int) (width * h / height);
		resize(w, h);
	}

	/**
	 * 按照最大高度限制，生成最大的等比例缩略图
	 * 
	 * @param w
	 *            int 最大宽度
	 * @param h
	 *            int 最大高度
	 * @throws IOException
	 */
	public void resizeFix() {
		if(singleName == null){
			System.out.println("原图为空，不能完成缩略图的大小重置工作。");
			return;
		}
		try {
			if (width / height > RE_WIDTH / RE_HEIGHT) {
				resizeByWidth(RE_WIDTH);
			} else {
				resizeByHeight(RE_HEIGHT);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取图片原始宽度 getSrcWidth
	 */
	public int getSrcWidth() {
		return width;
	}

	/**
	 * 获取图片原始高度 getSrcHeight
	 */
	public int getSrcHeight() {
		return height;
	}
	
	public String getThumbnailPath(){
		if(singleName != null) {
			return THUMBNAIL_PATH + "/" + singleName;
		} else {
			return null;
		}
	}

	private String creatNewFolder(HttpServletRequest request, String child) {
		String parent = request.getSession().getServletContext()
				.getRealPath("/" + THUMBNAIL_PATH);
		File file =new File(parent);
		//如果文件夹不存在则创建    
		if  (!file .exists()  && !file .isDirectory())      
		{       
		    System.out.println("//存放缩略图的文件夹不存在，创建");
		    file .mkdir();    
		} else {  
		    System.out.println("//存放缩略图的文件夹目录存在，无需创建");  
		} 
		return parent + "/" + child;
	}

}
