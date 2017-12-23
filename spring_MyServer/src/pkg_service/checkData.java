package pkg_service;

import java.util.*;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

public class checkData {
	public static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
	public static final String REGEX_PHONE = "^((\\+86)|(86))?1[3458]\\d{9}$";
	
	public  Map<String,Object> checkUserInfo(Map<String, String> info){
		Map<String,Object> rslt= new HashMap<String,Object>();	

		if( !((info.get("oldPWD")==null||info.get("oldPWD").length()==0)
			&&(info.get("newPWD1")==null||info.get("newPWD1").length()==0)
			&&(info.get("newPWD2")==null||info.get("newPWD2").length()==0))){
			if(info.get("oldPWD")==null||info.get("oldPWD").length()==0){
				rslt.put("errCode", "1");
				rslt.put("errInfo", "请输入原密码");
				return rslt;
			}
			if(info.get("newPWD1")==null||info.get("newPWD1").length()==0){
				
				rslt.put("errCode", "1");
				rslt.put("errInfo", "新密码为空");
				return rslt;
			}
			if(!info.get("newPWD1").equals(info.get("newPWD2"))){
				rslt.put("errCode", "1");
				rslt.put("errInfo", "两次密码输入不一致");
				return rslt;
			}

			if(!info.get("oldPWD").equals(ConnectionPool.getInstance().getUser(info.get("ID")).getEmployee_pwd())){
				rslt.put("errCode", "1");
				rslt.put("errInfo", "密码输入错误");
				return rslt;
			}
			
		}
		if(!Pattern.matches(REGEX_EMAIL, info.get("Email"))){
			rslt.put("errCode", "2");
			rslt.put("errInfo", "邮箱格式不正确");
			return rslt;
		}
		if(!Pattern.matches(REGEX_PHONE, info.get("phone"))){
			rslt.put("errCode", "2");
			rslt.put("errInfo", "手机格式不正确");
			return rslt;
		}
		
		return null;
	}
	
	
	public  Map<String,Object> checkSensorInfo(HttpServletRequest request){
		Map<String,Object> rslt= new HashMap<String,Object>();	
		
		String sensor_id = request.getParameter("in_sensor_id").trim();
		String conver_radio =request.getParameter("in_conver_radio").trim();
		String railway_name = request.getParameter("in_railway_name".trim());
		String sensor_location = request.getParameter("in_sensor_location").trim();
		String sensor_state = request.getParameter("in_sensor_state").trim();
		String stress_state = request.getParameter("in_stress_state").trim();
		String stress_init = request.getParameter("in_stress_init").trim();
		String stress_recent = request.getParameter("in_stress_recent").trim();
		String sensor_SN = request.getParameter("in_sensor_SN").trim();
		
		if(sensor_id==null || sensor_id.length()==0){
			rslt.put("errCode", "1");
			rslt.put("errInfo", "传感器ID不能为空");
			return rslt;
		}
		if(conver_radio==null || conver_radio.length()==0){
			rslt.put("errCode", "1");
			rslt.put("errInfo", "转换系数不能为空");
			return rslt;
		}
		if(railway_name==null || railway_name.length()==0){
			rslt.put("errCode", "1");
			rslt.put("errInfo", "线路名不能为空");
			return rslt;
		}
		if(sensor_location==null || sensor_location.length()==0){
			rslt.put("errCode", "1");
			rslt.put("errInfo", "传感器位置不能为空");
			return rslt;
		}
		if(stress_init==null || stress_init.length()==0){
			rslt.put("errCode", "1");
			rslt.put("errInfo", "初始预应力不能为空");
			return rslt;
		}
		if(sensor_SN==null || sensor_SN.length()==0){
			rslt.put("errCode", "1");
			rslt.put("errInfo", "传感器序号不能为空");
			return rslt;
		}
		
		try{
			Integer.valueOf(sensor_SN);
		}
		catch(Exception e){
			rslt.put("errCode", "1");
			rslt.put("errInfo", "传感器序号格式不正确");
			return rslt;
		}
		try{
			Double.valueOf(conver_radio);
		}
		catch(Exception e){
			rslt.put("errCode", "1");
			rslt.put("errInfo", "转换系数格式不正确");
			return rslt;
		}
		try{
			Double.valueOf(stress_init);
		}
		catch(Exception e){
			rslt.put("errCode", "1");
			rslt.put("errInfo", "初始预应力格式不正确");
			return rslt;
		}
		try{
			if(stress_recent!=null && stress_recent.length()!=0){
				Double.valueOf(stress_recent);
			}
		}
		catch(Exception e){
			rslt.put("errCode", "1");
			rslt.put("errInfo", "预应力最新值格式不正确");
			return rslt;
		}
		
		Object[] arr = {sensor_id,Double.valueOf(conver_radio),railway_name,sensor_location,sensor_state,stress_state,Double.valueOf(stress_init),
				(stress_recent==null||stress_recent.length()==0)?null:Double.valueOf(stress_recent),Integer.valueOf(sensor_SN)};
		List ls =  Arrays.asList(arr);
		rslt.put("errCode", "0");
		rslt.put("data",ls);
		return rslt;
	}
	
}
