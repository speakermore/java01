package ynjh.common.entity;

import java.io.Serializable;
/**
 * 为了方便在代码中获得用户的id，特做此实体的父类。<br />
 * 它的子类有两个，User和Company。
 * 为防止错误实例化此类，特写为抽象的
 * @author 牟勇
 */
public abstract class MyUser implements Serializable {
	private static final long serialVersionUID = -1387807269448397263L;
	//用户id
	private Integer id;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
