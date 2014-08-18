package org.enilu.bookbar.entity;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * 书籍采集地址配置项entity
 * <p/>
 * 2014年8月18日
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@Table("book_item")
public class BookItem {
	@Id
	private Long id;
	@Column
	private String name;
	@Column
	private String url;
	@Column
	private String collector;
	@Column
	private String dataOption;
	@Column
	private String website;
	@Column
	private String descript;
	@Column
	private Date updateTime;

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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCollector() {
		return collector;
	}

	public void setCollector(String collector) {
		this.collector = collector;
	}

	public String getDataOption() {
		return dataOption;
	}

	public void setDataOption(String dataOption) {
		this.dataOption = dataOption;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
