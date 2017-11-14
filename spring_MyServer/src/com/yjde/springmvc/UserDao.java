package com.yjde.springmvc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

@SuppressWarnings("all")
public class UserDao extends JdbcDaoSupport {
	
	private static final Log logger = LogFactory.getLog(UserDao.class);
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	// 此方法把USEMBO表对应的字段查询出来依次放入userPO中
	public Collection<UserPO> doquery() {
		String sql = "SELECT employee_id,employee_name,birthday FROM user_tb";
		logger.info(sql);
//		return super.getJdbcTemplate().query(sql, new RowMapper() {
//
//			public Object mapRow(ResultSet rs, int num) throws SQLException {
//				UserPO user = new UserPO();
//				user.setUserId(rs.getInt("employee_id"));
//				user.setUserName(rs.getString("employee_name"));
//				user.setUserAge(rs.getInt("birthday"));
//				logger.debug(user);
//				System.out.println(user);
//				return user;
//			}
//		});
		return getJdbcTemplate().query(sql,new ItemRowMapper());
	}
	
	protected class ItemRowMapper implements RowMapper { //这个类也可以定义在方法里如 RowMapper rowMapper = new RowMapper(){}
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException { 
			UserPO user = new UserPO();
			user.setUserId(rs.getInt("employee_id"));
			user.setUserName(rs.getString("employee_name"));
			user.setUserAge(rs.getInt("birthday"));
			logger.debug(user);
			System.out.println(user);
			return user;
		} 
		}
}
