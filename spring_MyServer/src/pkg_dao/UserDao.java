package pkg_dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import pkg_po.UserPO;


@SuppressWarnings("all")
public class UserDao extends JdbcDaoSupport {
	
	private static final Log logger = LogFactory.getLog(UserDao.class);


	// 此方法把USEMBO表对应的字段查询出来依次放入userPO中
	public List<Map> doLogin(String ID, final String passWord) {
		String sql = "SELECT * FROM user_tb where employee_id = "+ ID;
		logger.info(sql);
		return super.getJdbcTemplate().query(sql, new RowMapper() {

			public Object mapRow(ResultSet rs, int num) throws SQLException {
				Map mp = new HashMap();		
				if(rs==null){
					System.out.println(rs);
					mp.put("errCode", "1");  // 1表示用户名不存在
				}else if(!rs.getString("employee_pwd").equals(passWord)){
					System.out.println("passWord="+passWord);
					System.out.println("employee_pwd="+rs.getString("employee_pwd"));
					mp.put("errCode", "2");  // 2表示密码错误
				}else{
					UserPO user = new UserPO();
					user.setEmployee_id(rs.getInt("employee_id"));
					user.setEmployee_name(rs.getString("employee_name"));
					user.setEmployee_pwd(rs.getString("employee_pwd"));
					user.setGender(rs.getString("gender"));
					user.setPhone(rs.getString("phone"));
					user.setBirthday(rs.getString("birthday"));
					user.setDepartment(rs.getString("department"));
					user.setEmail(rs.getString("Email"));
					user.setAddress(rs.getString("address"));
					user.setLever(rs.getString("lever"));
					mp.put("errCode", "0");  // 0表示正确
					mp.put("data", user);
				}
				return mp;
			}
		});
		//return getJdbcTemplate().query(sql,new ItemRowMapper());
	}
	
//	protected class ItemRowMapper implements RowMapper { //这个类也可以定义在方法里如 RowMapper rowMapper = new RowMapper(){}
//		public Object mapRow(ResultSet rs, int rowNum) throws SQLException { 
//			Map mp = new HashMap();		
//			if(rs==null){
//				mp.put("errCode", "1");  // 1表示用户名不存在
//			}else if(rs.getString("employee_pwd")!=passWord){
//				mp.put("errCode", "2");  // 2表示密码错误
//			}else{
//				UserPO user = new UserPO();
//				user.setEmployeeId(rs.getInt("employee_id"));
//				user.setEmployeeName(rs.getString("employee_name"));
//				user.setEmployeePWD(rs.getString("employee_pwd"));
//				user.setGender(rs.getString("gender"));
//				user.setPhone(rs.getString("phone"));
//				user.setBirthday(rs.getString("birthday"));
//				user.setDepartment(rs.getString("department"));
//				user.setEmail(rs.getString("Email"));
//				user.setAddress(rs.getString("address"));
//				user.setLever(rs.getString("lever"));
//				mp.put("errCode", "0");  // 0表示正确
//				mp.put("data", user);
//			}
//			return mp;
//		} 
//		}
}
