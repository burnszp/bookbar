package org.enilu.bookbar.service;

import java.util.List;

import org.enilu.bookbar.entity.BookItem;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 书籍采集器service
 * 
 * <p/>
 * 2014年8月16日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */

@IocBean
public class BookItemService extends GeneralService {

	/**
	 * 查询全部采集器信息
	 * 
	 * @return
	 */
	public List<BookItem> query() {
		return search(BookItem.class, Cnd.NEW());
	}

}
