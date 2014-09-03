package org.enilu.bookbar.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.enilu.bookbar.entity.BookItem;
import org.enilu.bookbar.service.CollectorService;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.json.Json;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * 采集器controller
 * <p/>
 * descript1
 * </p>
 * 2014年9月1日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class CollectorController {

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
	public void collectorList(HttpServletRequest request) {
		Pager page = new Pager();
		page.setPageNumber(1);
		page.setPageSize(20);
		request.setAttribute("page", collectorService.query(page));
	}

	/**
	 * 采集全部数据
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

	@At("/admin/collectone/")
	@Ok("raw:json")
	public String collectOne(@Param("itemid") Long id,
			HttpServletRequest request) {
		collectorService.collect(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("status", "ok");
		return Json.toJson(map);
	}
}
