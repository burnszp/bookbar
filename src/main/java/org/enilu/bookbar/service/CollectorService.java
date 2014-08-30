package org.enilu.bookbar.service;

import java.util.List;

import org.enilu.bookbar.collector.DangdangCollector;
import org.enilu.bookbar.entity.Book;
import org.enilu.bookbar.entity.BookItem;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 书籍采集服务类 </p> 2014年8月20日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class CollectorService extends GeneralService {
	@Inject
	private BookItemService bookItemService;
	@Inject
	private BookService bookService;

	@Inject
	private DangdangCollector dangdangCollector;

	public void collect() {
		List<BookItem> cfgs = bookItemService.query();
		for (BookItem cfg : cfgs) {
			try {
				List<Book> list = dangdangCollector.collector(cfg);
				for (Book book : list) {
					bookService.save(book);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
}
