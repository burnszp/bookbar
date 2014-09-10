package org.enilu.bookbar.web.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.enilu.bookbar.service.IndexService;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

/**
 * 首页controller
 * <p/>
 * 2014年9月9日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class IndexController {

	@Inject
	private IndexService indexService;

	/**
	 * 采集器列表首页
	 * 
	 * @param request
	 * @param pager
	 */
	@At("/index")
	@Ok("jsp:/index.jsp")
	public void index(HttpServletRequest request) {
		request.setAttribute("list", indexService.queryTopBook());
	}

	/**
	 * 流行榜
	 * 
	 * @param request
	 */
	@At("/popular")
	@Ok("jsp:/index.jsp")
	public void popular(HttpServletRequest request) {
		request.setAttribute("list", indexService.queryPopularBook());
	}

	/**
	 * 访问书籍图片
	 * 
	 * @param request
	 * @param response
	 */
	@At("/index/img")
	public void img(HttpServletRequest request, HttpServletResponse response) {
		String img = request.getParameter("img");
		File file = new File(img);
		try {
			OutputStream ops = response.getOutputStream();
			ServletContext sc = request.getServletContext();
			response.setContentType(sc.getMimeType(file.getName()));
			InputStream in = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(in);
			BufferedOutputStream bos = new BufferedOutputStream(ops);
			byte data[] = new byte[1024];
			int size = 0;
			size = bis.read(data);
			while (size != -1) {
				bos.write(data, 0, size);
				size = bis.read(data);
			}
			bis.close();
			bos.flush();
			bos.close();
			ops.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
