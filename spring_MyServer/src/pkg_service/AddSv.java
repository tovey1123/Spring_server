package pkg_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class AddSv extends BaseSv{
	public Map doAddSensor(HttpServletRequest request){
		Map<String,Object> mp = new HashMap<>();
		
		checkData cd = new checkData();
		Map ck = cd.checkSensorInfo(request);
		if(ck.get("errCode")!="0"){
			return ck;
		}
		try{
			Object[] arr =((List)ck.get("data")).toArray(new Object[9]);
			String sql = "INSERT INTO sensor_tb(sensor_id,conver_radio,railway_name,sensor_location,sensor_state"
					+ ",stress_state,stress_init,stress_recent,sensor_SN) "
					+ "values(?,?,?,?,?,?,?,?,?)";
			int status = dao.doUpdate(sql, arr);
			if(status == 1){		//JDBC 更新成功
				mp.put("errCode", "0");
				return mp;
			}else{
				mp.put("errCode", "1");
				mp.put("errInfo", "添加传感器失败");
				return mp;
			}
		}
		catch(Exception e){
			mp.put("errCode", "2");
			mp.put("errInfo", e.getMessage());
			return mp;
		}
	
	}
}
