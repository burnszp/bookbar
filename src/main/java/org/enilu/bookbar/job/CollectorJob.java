package org.enilu.bookbar.job;

import java.util.List;

import org.enilu.bookbar.collector.BookCollector;
import org.enilu.bookbar.entity.Book;
import org.enilu.bookbar.entity.BookItem;
import org.enilu.bookbar.service.BookService;
import org.enilu.bookbar.service.CollectorService;
import org.nutz.ioc.Ioc2;
import org.nutz.ioc.impl.NutIoc;
import org.nutz.ioc.loader.annotation.AnnotationIocLoader;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class CollectorJob implements Job {
	private static Log log = Logs.getLog(CollectorJob.class);

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		System.out.println("collector job start work");
		Ioc2 ioc = new NutIoc(new AnnotationIocLoader("org.enilu.bookbar"));
		CollectorService collectorService = ioc.get(CollectorService.class);
		List<BookItem> cfgs = collectorService.query();
		BookService bookService = ioc.get(BookService.class);
		for (BookItem cfg : cfgs) {
			try {
				Class clazz = Class.forName(cfg.getCollector());
				BookCollector collector = ioc.get(clazz);
				List<Book> list = collector.collector(cfg);
				for (Book book : list) {
					bookService.save(book);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
