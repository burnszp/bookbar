package org.enilu.bookbar.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.bookbar.entity.BookItem;
import org.enilu.bookbar.service.BookItemService;
import org.enilu.bookbar.service.CollectorService;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

@IocBean
public class BookItemController {
	@Inject
	private BookItemService bookItemService;

	@Inject
	private CollectorService collectorService;

	/**
	 * 采集器列表
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

	/**
	 * 采集数据
	 * 
	 * @param request
	 * @return
	 */
	@At("/admin/collectall/")
	@Ok("redirect:/admin/collector-list")
	public List<BookItem> collectAll(HttpServletRequest request) {
		collectorService.collect();
		return null;
	}
}
