package org.enilu.bookbar.service;

import java.util.List;

import org.enilu.bookbar.entity.Book;
import org.nutz.dao.Cnd;
import org.nutz.dao.QueryResult;
import org.nutz.dao.pager.Pager;

/**
 * 
 * 书籍服务类
 * <p/>
 * 2014年8月19日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
public class BookService extends GeneralService {
	/**
	 * 根据采集器id查询所有书籍列表
	 * 
	 * @param itemId
	 * @return
	 */
	public List<Book> queryByItemId(Long itemId) {
		return dao.query(Book.class, Cnd.where("itemId", "=", itemId));
	}

	/**
	 * 分页查询书籍信息
	 * 
	 * @param itemId
	 * @param page
	 * @return
	 */
	public QueryResult queryByItemId(Long itemId, Pager page) {
		Cnd cnd = Cnd.where("itemId", "=", itemId);
		List<Book> list = dao.query(Book.class, cnd, page);
		page.setRecordCount(dao.count(Book.class, cnd));
		return new QueryResult(list, page);
	}

}
