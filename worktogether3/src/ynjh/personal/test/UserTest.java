//package ynjh.personal.test;
//
//import java.io.InputStream;
//import java.sql.Timestamp;
//import org.apache.ibatis.io.Resources;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//import org.apache.log4j.Logger;
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//import ynjh.personal.dao.message.MessageMapper;
//
//import ynjh.personal.entity.Message;
//
//public class UserTest {
//	private SqlSessionFactory ssf = null;
//	private SqlSession session = null;
//	private Logger logger = Logger.getLogger(getClass());
//	
//		// 之前
//		@Before
//		public void before() {
//			try {
//				if (ssf == null) {
//					InputStream is = Resources
//							.getResourceAsStream("mybatis-config.xml");
//					ssf = new SqlSessionFactoryBuilder().build(is);
//				}
//				session = ssf.openSession();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//
//		}
//
//		// 之后
//		@After
//		public void after() {
//			session.commit();
//			session.close();
//		}
//		Timestamp timestamp =new Timestamp(System.currentTimeMillis());
////		@Test
////		public void testadd(){	
////		User user =new User(1234567893,"123456","测试",1,"123456@163.com",1,"测试1","532165854669649","123","123",timestamp,"123444",100.0,timestamp,1);
////		int result=session.getMapper(UserMapper.class).addUser(user);
////		logger.info("************"+result);
////		}
////		@Test
////		public void testadd(){
////			Discuss discuss =new Discuss(123456789, "内容", 1, timestamp, 2);
////			int result =session.getMapper(DiscussMapper.class).addUserCommentFirm(discuss);
////			logger.info("************"+result);
////		}
////		@Test
////		public void testadd(){
////			Message message =new Message(1234567891, 1236547899, "内容", timestamp,1);
////			int result=session.getMapper(MessageMapper.class).addMessage(message);
////			logger.info("************"+result);
////		}
////		@Test
////		public void testadd(){
////			/*Resume(Integer userId, String resumeTitle,
////					Timestamp resumeCreateDate, String resumeName,
////					Integer resumeGender, String resumeNation, String resumePlace,
////					Timestamp resumeBirthday, Integer resumeMarriage,
////					String resumeGraduationSchool, Timestamp resumeGraduationTime,
////					String resumeEducation, String resumeMajor, Integer resumeWages,
////					Integer resumePhone, Integer resumeQQ, String resumePersonality,
////					String resumeSelfEvaluation,
////					Integer resumeHeight, Integer resumeWeight)*/
////			Resume resume =new Resume(1234567891, "标题", timestamp, "xxx", 1, "汉", "云南", timestamp, 2, "云南大学", timestamp, "本科", "工程师", 5000, 1234567891, 951951951, "下凡", "很好的！", 150, 150);
////			int result =session.getMapper(ResumeMapper.class).addResume(resume);
////		}
//}
