package org.enilu.bookbar.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.bookbar.entity.Product;
import org.enilu.bookbar.service.ProductService;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@IocBean
public class ProductController {
	@Inject
	private ProductService productService;

	/**
	 * 多页文档列表
	 * 
	 * @param request
	 * @param pager
	 */
	@At("/mgr/product-list/")
	@Ok("jsp:/admin/product-list.jsp")
	public void productList(HttpServletRequest request,
			@Param("::pager") Pager pager) {

		List<Product> list = productService.query();
	}
}
