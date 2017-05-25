package ynjh.common.util;

import java.util.List;

import ynjh.common.crowdfund.entity.Crowdfund;
/**
 * @author 何爽
 *移除list集合中内容相同的数据
 */
public class NoSameList {
	public static List<Crowdfund> removeSameList(List<Crowdfund> list) {
		   for ( int i = 0 ; i < list.size() - 1 ; i ++ ) {
		     for ( int j = list.size() - 1 ; j > i; j -- ) {
		       if (list.get(j).getId()==list.get(i).getId()) {
		         list.remove(j);
		       }
		      }
		    }
		   return list;
		} 
}
