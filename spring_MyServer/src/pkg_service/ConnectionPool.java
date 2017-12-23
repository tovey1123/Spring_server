package pkg_service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import pkg_po.UserPO;

public class ConnectionPool {
	
	private ConnectionPool(){}
	public static ConnectionPool pool = null;
	public static synchronized ConnectionPool getInstance(){
		if(pool ==null){
			pool = new ConnectionPool();
		} 
		return pool;
	}

	private HashMap<String,UserPO> mp= new HashMap<>();
	
	public void addUser(String uid,UserPO userPo)
	{
		mp.put(uid, userPo);
//		System.out.println("uid = "+ID);
//		System.out.println("name = "+userPo.getEmployee_name());
	}

//	public Boolean existUser(String uid) {
//		for(String id: mp.keySet()){
//			if(id.equals(uid)){
//				return true;
//			}
//		}
//		return false;
//	}
	
	public UserPO getUser(String uid){
		return mp.get(uid);
	}
	
	public void setSession(HttpServletRequest request,String ID){
		HttpSession session = request.getSession(); 
		HashSet<String> hs;
		if(session==null||session.getAttribute("usrid")==null){
		    hs = new HashSet<>();
			hs.add(ID);
		}else{
			
			hs = (HashSet<String>) session.getAttribute("usrid");
			hs.add(ID);
		}
		session.setAttribute("usrid", hs);
	}
}

