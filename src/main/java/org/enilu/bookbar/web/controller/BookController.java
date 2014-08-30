package org.enilu.bookbar.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.bookbar.entity.Book;
import org.enilu.bookbar.entity.BookItem;
import org.enilu.bookbar.service.BookItemService;
import org.enilu.bookbar.service.BookService;
import org.enilu.bookbar.service.CollectorService;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * 书籍controller
 * <p/>
 * </p>
 * 2014年8月30日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class BookController {

	@Inject
	private BookItemService bookItemService;

	@Inject
	private CollectorService collectorService;
	@Inject
	private BookService bookService;

	/**
	 * 采集器列表
	 * 
	 * @param request
	 * @param pager
	 */
	@At("/front/book-type/")
	@Ok("jsp:/page/front/book-type.jsp")
	public void productList(HttpServletRequest request) {
		List<BookItem> typeList = bookItemService.query();
		request.setAttribute("typelist", typeList);
		List<Book> bookList = bookService
				.queryByItemId(typeList.get(0).getId());

		request.setAttribute("booklist", bookList);
	}

	@At("/front/booklistbytype/")
	@Ok("jsp:/page/front/book-type.jsp")
	public void booklistbytype(@Param("itemid") Long itemId,
			HttpServletRequest request) {
		List<BookItem> typeList = bookItemService.query();
		request.setAttribute("typelist", typeList);
		List<Book> bookList = bookService.queryByItemId(itemId);

		request.setAttribute("booklist", bookList);
	}
}
