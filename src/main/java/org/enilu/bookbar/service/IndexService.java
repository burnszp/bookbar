package org.enilu.bookbar.service;

import java.util.List;

import org.enilu.bookbar.entity.Book;
import org.nutz.dao.Cnd;

/**
 * 首页服务类
 * <p/>
 * </p>
 * 2014年9月9日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */

public class IndexService extends GeneralService {

	public List<Book> queryTopBook() {

		List<Book> list = dao.query(Book.class,
				Cnd.NEW().orderBy("commentCount", "desc"),
				dao.createPager(1, 16));
		return list;

	}

	public Object queryPopularBook() {
		List<Book> list = dao.query(Book.class,
				Cnd.NEW().orderBy("commentCount", "desc"),
				dao.createPager(1, 16));
		return list;

	}
}
