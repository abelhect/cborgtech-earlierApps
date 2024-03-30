package org.toasthub.core.general.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

/**
 * @author Edward H. Seufert
 * Licensed under Eclipse Public License 1.0 (EPL-1.0)
 */
@Entity
@Table(name = "images")
public class Image extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Lob @Column(name = "image", nullable = false)
	private byte[] image;
	
	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "ext", nullable = false)
	private String ext;
	
	@Column(name = "lang", nullable = false)
	private String lang;
	
	@Column(name = "url_link")
	private String urlLink;
	
	// Constructor
	public Image() {
		super();
	}
	
	public Image(byte[] image, String name, String ext, String lang) {
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
		this.setImage(image);
		this.setName(name);
		this.setExt(ext);
		this.setLang(lang);
	}

	// setter/getter
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}

	public String getUrlLink() {
		return urlLink;
	}

	public void setUrlLink(String urlLink) {
		this.urlLink = urlLink;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}
	
}
