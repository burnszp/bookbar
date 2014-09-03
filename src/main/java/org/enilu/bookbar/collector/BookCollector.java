package org.enilu.bookbar.collector;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.enilu.bookbar.entity.Book;
import org.enilu.bookbar.entity.BookItem;

/**
 * 抽象的书籍信息采集类
 * <p/>
 * 
 * <li>所有书籍采集器都必须继承该类</li>
 * </p>
 * 2014年8月19日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
public abstract class BookCollector {
	/**
	 * 根据配置的采集器信息采集书籍信息
	 * 
	 * @param bookItem
	 *            采集器信息
	 * @return
	 */
	public abstract List<Book> collector(BookItem bookItem);

	public static void downloadImg(String imgUrl, String fileName)
			throws Exception {
		URL url = new URL(imgUrl);// ：获取的路径
		// :http协议连接对象
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setReadTimeout(6 * 10000);
		if (conn.getResponseCode() < 10000) {
			InputStream inputStream = conn.getInputStream();
			byte[] data = readStream(inputStream);
			// if (data.length > (1024 * 10)) {
			System.out.println("保存图片：" + fileName);
			FileOutputStream outputStream = new FileOutputStream(fileName);
			outputStream.write(data);
			outputStream.close();
			// }
		}

	}

	/**
	 * 读取url中数据，并以字节的形式返回
	 * 
	 * @param inputStream
	 * @return
	 * @throws Exception
	 */
	public static byte[] readStream(InputStream inputStream) throws Exception {
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = -1;
		while ((len = inputStream.read(buffer)) != -1) {
			outputStream.write(buffer, 0, len);
		}
		outputStream.close();
		inputStream.close();
		return outputStream.toByteArray();
	}
}
