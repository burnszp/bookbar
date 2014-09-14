package org.enilu.bookbar.collector;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.enilu.bookbar.entity.Book;
import org.enilu.bookbar.entity.BookItem;
import org.enilu.bookbar.web.WebUtil;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.nutz.ioc.loader.annotation.IocBean;

import com.google.common.collect.Lists;

/**
 * 当当网书籍采集器
 * <p/>
 * 
 * </p>
 * 2014年8月19日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class DangdangCollector extends BookCollector {
	@Override
	public List<Book> collector(BookItem bookItem) {
		try {
			File imgDic = new File(WebUtil.imgdir + "dangdang/");
			if (!imgDic.exists()) {
				imgDic.mkdir();
			}
			List<Book> list = Lists.newArrayList();
			String collectorUrl = bookItem.getUrl();
			for (int i = 1; i <= 25; i++) {
				Document doc = Jsoup
						.connect(collectorUrl.replace("{page}", i + ""))
						.timeout(100000).get();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Elements bookEls = doc.getElementsByClass("bang_list").get(0)
						.children();
				for (Element bookEl : bookEls) {
					String rank = bookEl.getElementsByClass("list_num").get(0)
							.text().replace(".", "");
					String imgUrl = bookEl.getElementsByClass("pic").get(0)
							.getElementsByTag("a").get(0)
							.getElementsByTag("img").get(0).attr("src");

					String imgName = WebUtil.imgdir
							+ "dangdang/"
							+ new Date().getTime()
							+ "."
							+ imgUrl.split("\\.")[imgUrl.split("\\.").length - 1];
					downloadImg(imgUrl, imgName);
					Element nameEl = bookEl.getElementsByClass("name").get(0)
							.getElementsByTag("a").get(0);
					String name = nameEl.text().trim();
					String url = nameEl.attr("href");
					String commentCount = bookEl.getElementsByClass("star")
							.get(0).getElementsByTag("a").text()
							.replace("条评论", "");
					Elements publisherInfos = bookEl
							.getElementsByClass("publisher_info");
					Elements authors = publisherInfos.get(0).getElementsByTag(
							"a");
					String author = "";
					String translator = "";
					if (authors.size() > 1) {
						author = authors.get(0).text();
						translator = authors.get(authors.size() - 1).text();
					} else if (authors.size() == 1) {
						author = authors.get(0).text();
					}
					String publisher = publisherInfos.get(1)
							.getElementsByTag("a").text();
					String publishDate = publisherInfos.get(1)
							.getElementsByTag("span").text();
					Elements priceEls = bookEl.getElementsByClass("price")
							.get(0).getElementsByTag("p").get(0)
							.getElementsByTag("span");
					String shopPrice = priceEls.get(0).text().replace("¥", "");
					String price = priceEls.get(1).text().replace("¥", "");

					Book book = new Book();
					book.setAuthor(author);
					book.setCommentCount(Integer.valueOf(commentCount));
					book.setDescript(null);
					book.setIsbn("");// 需要去详情页面采集
					book.setItemId(bookItem.getId());
					book.setName(name);
					book.setImg(imgName);
					book.setPrice(Float.valueOf(price.replaceAll(",", "")));
					if (publishDate != null && !"".equals(publishDate)) {
						book.setPublishDate(sdf.parse(publishDate));
					}
					book.setPublisher(publisher);
					book.setRank(Integer.valueOf(rank));
					book.setShopPrice(Float.valueOf(shopPrice));
					book.setTranslator(translator);
					book.setUpdateTime(new Date());
					book.setUrl(url);
					System.out.println(book.getRank() + ":" + book.getName()
							+ "--" + book.getAuthor());
					list.add(book);
				}
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
