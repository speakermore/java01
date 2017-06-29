package ynjh.common.entity;

import java.io.Serializable;

/**
 * 民族
 * @author 牟勇
 *
 */
public class Nation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2033613622706028743L;
	private Integer id;
	private String nationName;
	public Nation() {
		super();
	}
	public Nation(String nationName) {
		super();
		this.nationName = nationName;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNationName() {
		return nationName;
	}
	public void setNationName(String nationName) {
		this.nationName = nationName;
	}
	@Override
	public String toString() {
		return "Nation [id=" + id + ", nationName=" + nationName + "]";
	}
	
}
