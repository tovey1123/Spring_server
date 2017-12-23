package pkg_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import pkg_dao.UserDao;

public class UpdateSv  extends BaseSv {


	
	public Map doUpdateUser(HttpServletRequest request){
			
		String[] params =  {"ID","name","gender","Email","phone","birthday","address","oldPWD","newPWD1","newPWD2"};
		Map<String,String> mp = new HashMap<>();
		for(String param :params){
			mp.put(param, request.getParameter(param));
			
		}
		checkData cd = new checkData();
		Map check = cd.checkUserInfo(mp);
		if(check!=null){
			               //data is invalid
			return check;  //errCode="1"
		}else{
			try{
				
				//valid
				int status;
				System.out.println("see newPWD1");
				System.out.println(mp.get("newPWD1"));
				if(mp.get("newPWD1")==null||mp.get("newPWD1").length()==0){ // do not modify password
					System.out.println("in step 1");
					String sql = "UPDATE  user_tb SET employee_name=?,gender=?,Email=?,phone=?,birthday=?,address=? WHERE employee_id="+ mp.get("ID");
					Object[] arr = {mp.get("name"),mp.get("gender"),mp.get("Email"),mp.get("phone"),mp.get("birthday"),mp.get("address")};
					status = dao.doUpdate(sql, arr);
					
				}
				else{
					System.out.println("in step 2");
					String sql = "UPDATE  user_tb SET employee_name=?,employee_pwd=?,gender=?,Email=?,phone=?,birthday=?,address=? WHERE employee_id="+ mp.get("ID");
					Object[] arr = {mp.get("name"),mp.get("newPWD1"),mp.get("gender"),mp.get("Email"),mp.get("phone"),mp.get("birthday"),mp.get("address")};
					status = dao.doUpdate(sql, arr);
					
				}
				System.out.println("status="+status);
				if(status != 0){		//JDBC 更新成功
					mp.put("errCode", "0");
					return mp;
				}else{
					mp.put("errCode", "2");
					mp.put("errInfo", "更新数据失败");//unknown error
					return mp;
				}
				}
				catch(Exception e){				
						mp.put("errCode", "2");
						mp.put("errInfo", e.getMessage());//unknown error
						return mp;
					
				}
		}
	}
	
	
	public Map doUpdateSensor(HttpServletRequest request){
		Map<String,Object> mp = new HashMap<>();
		checkData cd = new checkData();
		Map ck = cd.checkSensorInfo(request);
		if(ck.get("errCode")!="0"){
			return ck;
		}
		try{
			
			String ID=request.getParameter("sensorID");
			Object[] arr =((List)ck.get("data")).toArray(new Object[9]);
			String sql = "UPDATE sensor_tb SET sensor_id=?,conver_radio=?,railway_name=?,sensor_location=?,sensor_state=?"
					+ ",stress_state=?,stress_init=?,stress_recent=?,sensor_SN=? where sensor_id= '"+ID+"'";
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
