package org.enilu.bookbar.collector;

import java.util.List;

import junit.framework.TestCase;

import org.enilu.bookbar.entity.Book;
import org.enilu.bookbar.entity.BookItem;

public class DangdangCollectorTest extends TestCase {

	public void testCollector() {
		DangdangCollector c = new DangdangCollector();
		BookItem bookItem = new BookItem();
		bookItem.setId(1L);
		bookItem.setUrl("http://bang.dangdang.com/books/bestsellers/01.03.00.00.00.00-recent30-0-0-1-{page}");

		List<Book> list = c.collector(bookItem);

	}

}
