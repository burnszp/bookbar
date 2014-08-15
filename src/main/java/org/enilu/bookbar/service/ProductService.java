package org.enilu.bookbar.service;

import java.util.List;

import org.enilu.bookbar.entity.Product;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 文档数据库操作
 * 
 * @author Administrator
 * 
 */

@IocBean
public class ProductService {

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
	public List<Product> query() {
		List<Product> result = generalService.search(Product.class, Cnd.NEW());
		return result;

	}

}
