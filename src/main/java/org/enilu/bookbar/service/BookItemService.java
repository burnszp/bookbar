package org.enilu.bookbar.service;

import java.util.List;

import org.enilu.bookbar.entity.BookItem;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 书籍采集来源service
 * 
 * @author enilu
 * 
 */

@IocBean
public class BookItemService {

	@Inject
	protected Dao dao;

	@Inject
	protected GeneralService generalService;

	/**
	 * 根据用户id返回其多页文档
	 * 
	 * @param authorId
	 * @param order
	 * @param pager
	 * @return
	 */
	public List<BookItem> query() {
		List<BookItem> result = generalService
				.search(BookItem.class, Cnd.NEW());
		return result;

	}

}
