package ynjh.common.entity;

import java.io.Serializable;

/**
 * 省的实体类
 * @author 牟勇
 *
 */
public class Province implements Serializable {
	private int id;
	private String name;//省的名称
	public Province() {
		
	}
	public Province(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Province [id=" + id + ", name=" + name + "]";
	}
	
	
}
