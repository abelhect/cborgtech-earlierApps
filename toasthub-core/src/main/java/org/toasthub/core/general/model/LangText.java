package org.toasthub.core.general.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.ajax.JsonViews;

/**
 * @author Edward H. Seufert
 * Licensed under Eclipse Public License 1.0 (EPL-1.0)
 */
@Entity
@Table(name = "langtexts")
public class LangText extends TextBaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private Text textMeta;
	private String lang;
	private String text;
	
	// Constructor
	public LangText() {
		super();
	}
	
	// setter/getter
	@JsonIgnore
	@ManyToOne(targetEntity = Text.class)
	@JoinColumn(name = "text_id", nullable = false)
	public Text getTextMeta() {
		return textMeta;
	}
	public void setTextMeta(Text textMeta) {
		this.textMeta = textMeta;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "lang", nullable = false)
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "text")
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
