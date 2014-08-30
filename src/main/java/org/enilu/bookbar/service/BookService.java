package org.enilu.bookbar.service;

import java.util.List;

import org.enilu.bookbar.entity.Book;
import org.nutz.dao.Cnd;

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
	public List<Book> queryByItemId(Long itemId) {
		return dao.query(Book.class, Cnd.where("itemId", "=", itemId));
	}

}
