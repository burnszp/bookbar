package org.enilu.bookbar.service;

import java.util.Date;
import java.util.List;

import org.enilu.bookbar.collector.DangdangCollector;
import org.enilu.bookbar.entity.Book;
import org.enilu.bookbar.entity.BookItem;
import org.nutz.dao.Cnd;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;
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
	private BookService bookService;

	@Inject
	private DangdangCollector dangdangCollector;

	/**
	 * 查询全部采集器信息
	 * 
	 * @return
	 */
	public List<BookItem> query() {
		return search(BookItem.class, Cnd.NEW());
	}

	public QueryResult query(Pager page) {
		List<BookItem> list = dao.query(BookItem.class, Cnd.NEW(), page);
		page.setRecordCount(dao.count(BookItem.class));
		return new QueryResult(list, page);
	}

	public void collect() {
		List<BookItem> cfgs = query();
		for (BookItem cfg : cfgs) {
			try {
				List<Book> list = dangdangCollector.collector(cfg);
				for (Book book : list) {
					bookService.save(book);
					cfg.setUpdateTime(new Date());
					update(cfg);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public void collect(Long id) {
		BookItem cfg = find(id, BookItem.class);

		try {
			List<Book> list = dangdangCollector.collector(cfg);
			for (Book book : list) {
				bookService.save(book);
			}
			cfg.setUpdateTime(new Date());
			update(cfg);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
