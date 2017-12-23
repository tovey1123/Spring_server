package pkg_service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.jdbc.core.RowMapper;

import pkg_dao.UserDao;
import pkg_po.SensorPO;

public class QuerySv  extends BaseSv{
	
	public Map getAllSensor(){
		String sql ="SELECT * FROM sensor_tb";
		List<SensorPO> ls =dao.query(sql,new SensorRowMapper());
		Map mp = new HashMap<String,Object>();
		mp.put("data", ls);
		return mp;
	}
	
	public  class SensorRowMapper implements RowMapper { //这个类也可以定义在方法里如 RowMapper rowMapper = new RowMapper(){}
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException { 	
			SensorPO sensor = new SensorPO();
			sensor.setSensor_id(rs.getString("sensor_id"));
			sensor.setConver_radio(rs.getString("conver_radio"));
			sensor.setRailway_name(rs.getString("railway_name"));
			sensor.setSensor_location(rs.getString("sensor_location"));
			sensor.setSensor_state(rs.getString("sensor_state"));
			sensor.setStress_state(rs.getString("stress_state"));
			sensor.setStress_init(rs.getString("stress_init"));
			sensor.setStress_recent(rs.getString("stress_recent"));
			sensor.setSensor_SN(rs.getInt("sensor_SN"));
		return sensor;
		} 
	}
	
	public Map getLinePrestress(HttpServletRequest request){
		Map<String,Object> mp = new HashMap<>();
		try{
			String line = request.getParameter("line");
			Integer from = Integer.valueOf(request.getParameter("from"));
			Integer to = Integer.valueOf(request.getParameter("to"));
			if(from>to){
				mp.put("errCode", "2");
				mp.put("errInfo", "请注意传感器序号的大小顺序");
				return mp;
			}
			String sql ="SELECT sensor_SN,stress_recent FROM sensor_tb where railway_name=? and sensor_SN BETWEEN ? and ?";
			Object[] arr={line,from,to}	;
			List ls =dao.query(sql,arr,new LineRowMapper());
			mp.put("errCode", "0");
			mp.put("data", ls);
		}
		catch(Exception e){
			mp.put("errCode", "1");
			mp.put("errInfo", e.getMessage());
		}
		
		return mp;
	}
	public  class LineRowMapper implements RowMapper { //这个类也可以定义在方法里如 RowMapper rowMapper = new RowMapper(){}
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				ArrayList al = new ArrayList<>();
				al.add(rs.getInt("sensor_SN"));
				al.add(rs.getDouble("stress_recent"));
			return al;
			} 
		}
	
	public Map getPrestress(HttpServletRequest request){
		Map<String,Object> mp = new HashMap<>();
		try{
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String id = request.getParameter("sensor_id");
			String from = request.getParameter("from");
			String to = request.getParameter("to");
			if(from.compareTo(to)>0){
				mp.put("errCode", "2");
				mp.put("errInfo", "请注意起止时间的大小顺序");
				return mp;
			}
			String sql ="SELECT data_value,date FROM sensor_data_tb where sensor_id=? and date>=? and date<=?";
			Object[] arr={id,from,to};
			List<List> ls =dao.query(sql,arr,new PrestressRowMapper());
			ArrayList<ArrayList> al = new ArrayList();
			ArrayList x_axis =new ArrayList();
			ArrayList y_axis =new ArrayList();
			for(int i=1;i<=ls.size();i++){
				List item = ls.get(i-1);
				ArrayList temp =new ArrayList();
				ArrayList temp2 =new ArrayList();
				temp.add(i);
				temp.add(item.get(0));
				x_axis.add(temp);

				temp2.add(i);
				temp2.add(item.get(1));
				y_axis.add(temp2);
				temp=null;
				temp2=null;
			}
			al.add(x_axis);
			al.add(y_axis);
			mp.put("errCode", "0");
			mp.put("data", al);
		}
		catch(Exception e){
			System.out.println(e);
			mp.put("errCode", "1");
			mp.put("errInfo", e.getMessage());
		}
		
		return mp;

	}
	
	public  class PrestressRowMapper implements RowMapper { //这个类也可以定义在方法里如 RowMapper rowMapper = new RowMapper(){}		
		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			List ls = new ArrayList<>();
			ls.add(rs.getString("date"));
			ls.add(rs.getDouble("data_value"));
			return ls;
			} 
		}
	
}
