package org.enilu.bookbar.collector;

import java.util.List;

import org.enilu.bookbar.entity.Book;
import org.enilu.bookbar.entity.BookItem;

/**
 * 抽象的书籍信息采集类
 * <p/>
 * 
 * <li>所有书籍采集器都必须继承该类</li>
 * </p>
 * 2014年8月19日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
public interface BookCollector {
	/**
	 * 根据配置的采集器信息采集书籍信息
	 * 
	 * @param bookItem
	 *            采集器信息
	 * @return
	 */
	public List<Book> collector(BookItem bookItem);
}
