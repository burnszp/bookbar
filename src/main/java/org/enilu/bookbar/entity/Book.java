package org.enilu.bookbar.entity;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * 书籍实体bean
 * <p/>
 * 
 * </p>
 * 2014年8月19日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@Table("book_data")
public class Book {
	@Id
	private Long id;
	@Column
	private String name;// 书名
	@Column
	private String descript;// 简介
	@Column
	private String url;
	@Column("item_id")
	private Long itemId;// 对应的采集器id
	@Column("update_time")
	private Date updateTime;// 采集更新日期
	@Column
	private String author;// 作者
	@Column
	private String translator;// 译者
	@Column
	private String publisher;// 出版社
	@Column("publish_date")
	private Date publishDate;// 出版日期
	@Column
	private String isbn;
	@Column
	private Float price;// 定价
	@Column("shop_price")
	private Float shopPrice;// 商城价
	@Column
	private Integer rank;// 排行榜
	@Column("comment_count")
	private Integer commentCount;// 评论数

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTranslator() {
		return translator;
	}

	public void setTranslator(String translator) {
		this.translator = translator;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getShopPrice() {
		return shopPrice;
	}

	public void setShopPrice(Float shopPrice) {
		this.shopPrice = shopPrice;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

}
