package ynjh.personal.test;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Date;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import ynjh.personal.dao.user.UserMapper;
import ynjh.personal.entity.User;

public class UserTest {
	private SqlSessionFactory ssf = null;
	private SqlSession session = null;
	private Logger logger = Logger.getLogger(getClass());
	private User user = null;
	
	// 之前
		@Before
		public void before() {
			try {
				if (ssf == null) {
					InputStream is = Resources
							.getResourceAsStream("mybatis-config.xml");
					ssf = new SqlSessionFactoryBuilder().build(is);
				}
				session = ssf.openSession();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// 之后
		@After
		public void after() {
			session.commit();
			session.close();
		}
		
		@Test
		public void testFindById(){
		Timestamp timestamp =new Timestamp(System.currentTimeMillis());
		User user =new User(1234567891,"123456","测试",1,"123456@163.com",1,"测试1","532165854669649","123","123",timestamp,"123444",100.0,timestamp,1);
		int result=session.getMapper(UserMapper.class).addUser(user);
		logger.info("************"+result);
		}
}
