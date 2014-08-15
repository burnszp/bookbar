package org.enilu.bookbar.entity;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * 商品实体entity
 * <p/>
 * 2014年8月15日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@Table("product")
public class Product {
	@Id
	private Long id;
	@Column
	private String pname;
	@Column
	private Float price;
	@Column
	private Float cost;
	@Column
	private String descript;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

}
