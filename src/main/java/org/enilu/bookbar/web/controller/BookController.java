package org.enilu.bookbar.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.bookbar.entity.BookItem;
import org.enilu.bookbar.service.BookService;
import org.enilu.bookbar.service.CollectorService;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * 书籍controller
 * <p/>
 * 2014年8月30日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class BookController {

	@Inject
	private CollectorService collectorService;
	@Inject
	private BookService bookService;

	/**
	 * 采集器列表首页
	 * 
	 * @param request
	 * @param pager
	 */
	@At("/front/book-type/")
	@Ok("jsp:/page/front/book-type.jsp")
	public void productList(HttpServletRequest request) {
		List<BookItem> typeList = collectorService.query();
		request.setAttribute("typelist", typeList);
		Pager page = new Pager();
		page.setPageNumber(1);
		page.setPageSize(20);
		// 显示默认第一个采集器信息及其下的书籍列表。
		request.setAttribute("bookpage",
				bookService.queryByItemId(typeList.get(0).getId(), page));
		request.setAttribute("item", typeList.get(0));

	}

	/**
	 * 根据采集器id和分页信息显示书籍列表
	 * 
	 * @param itemId
	 * @param request
	 */
	@At("/front/booklistbytype/")
	@Ok("jsp:/page/front/book-type.jsp")
	public void booklistbytype(@Param("itemid") Long itemId,
			@Param("ps") Integer pageSize, @Param("pn") Integer pageNumber,
			HttpServletRequest request) {
		List<BookItem> typeList = collectorService.query();
		request.setAttribute("typelist", typeList);
		Pager page = new Pager();
		page.setPageNumber(pageNumber == null ? 1 : pageNumber);
		page.setPageSize(pageSize == null ? 20 : pageSize);
		request.setAttribute("bookpage",
				bookService.queryByItemId(itemId, page));
		// 设置默认类别
		for (BookItem item : typeList) {
			if (item.getId().intValue() == itemId.intValue()) {
				request.setAttribute("item", item);
				break;
			}
		}

	}
}
