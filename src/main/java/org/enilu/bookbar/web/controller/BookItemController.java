package org.enilu.bookbar.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.bookbar.entity.BookItem;
import org.enilu.bookbar.service.BookItemService;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

@IocBean
public class BookItemController {
	@Inject
	private BookItemService bookItemService;

	/**
	 * 多页文档列表
	 * 
	 * @param request
	 * @param pager
	 */
	@At("/admin/collector-list/")
	@Ok("jsp:/page/admin/collector-list.jsp")
	public List<BookItem> productList(HttpServletRequest request) {

		List<BookItem> list = bookItemService.query();
		return list;
	}
}
