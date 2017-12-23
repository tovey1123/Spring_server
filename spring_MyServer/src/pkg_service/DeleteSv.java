package pkg_service;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import pkg_dao.UserDao;

public class DeleteSv  extends BaseSv{

	public Map<String,Object> doDeleteSensor(HttpServletRequest request){
		Map<String,Object> mp = new HashMap<>();
		String ID=request.getParameter("sensor_id");
		String sql = "DELETE FROM sensor_tb where sensor_id = ?";
		Object[] arr = {ID};
		try{
			int status = dao.doUpdate(sql, arr);
			if(status==1){
				mp.put("errCode", "0");
			}else{
				mp.put("errCode", "1");
				mp.put("errInfo", "É¾³ýÊý¾ÝÊ§°Ü");//unknown error
			}
		}catch(Exception e){	
			mp.put("errCode", "2");
			mp.put("errInfo", e.getMessage());
		}
		return mp;
	}
}
