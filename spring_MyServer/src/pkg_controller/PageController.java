/**
* PageController用于所有请求、超链接的跳转控制
*/

package pkg_controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import pkg_dao.UserDao;
import pkg_po.UserPO;
import pkg_service.AddSv;
import pkg_service.ConnectionPool;
import pkg_service.DeleteSv;
import pkg_service.QuerySv;
import pkg_service.UpdateSv;

@Controller
public class PageController extends BaseController{
		
	@RequestMapping(value="/userUpdate", method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	 public @ResponseBody Map  userUpdate(Model model,HttpServletRequest request,HttpServletResponse response){
		
		UpdateSv us= new UpdateSv();
			
		//update
		Map updateResult = us.doUpdateUser(request);
		if(updateResult.get("errCode")=="0"){
			//update PO
			String ID= request.getParameter("ID");
			List<Map> loginResult = dao.doLogin(ID);
			ConnectionPool.getInstance().addUser(ID,(UserPO)loginResult.get(0).get("data"));
		}
		return  updateResult;		
	}
	
	@RequestMapping(value="/sensorAdd", method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	 public @ResponseBody Map  sensorAdd(Model model,HttpServletRequest request,HttpServletResponse response){
		
		AddSv as= new AddSv();
			
		//delete
		Map deleteResult = as.doAddSensor(request);

		return  deleteResult;		
	}
	
	@RequestMapping(value="/sensorUpdate", method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	 public @ResponseBody Map  sensorUpdate(Model model,HttpServletRequest request,HttpServletResponse response){
		String ID=request.getParameter("sensorID");
		UpdateSv us= new UpdateSv();
			
		//delete
		Map deleteResult = us.doUpdateSensor(request);

		return  deleteResult;		
	}
	
	@RequestMapping(value="/sensorDelete", method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	 public @ResponseBody Map  sensorDelete(Model model,HttpServletRequest request,HttpServletResponse response){
		
		DeleteSv ds= new DeleteSv();
			
		//delete
		Map deleteResult = ds.doDeleteSensor(request);

		return  deleteResult;		
	}
	
	@RequestMapping(value="/line", method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	 public @ResponseBody Map  line(Model model,HttpServletRequest request,HttpServletResponse response){
		
		QuerySv qs= new QuerySv();	
		Map queryResult = qs.getLinePrestress(request);

		return  queryResult;		
	}
	@RequestMapping(value="/prestress", method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	 public @ResponseBody Map  prestress(Model model,HttpServletRequest request,HttpServletResponse response){	
		
		QuerySv qs= new QuerySv();	
		Map queryResult = qs.getPrestress(request);
		return  queryResult;			
	
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	 public String  login(Model model,HttpServletRequest request,HttpServletResponse response){		
		
		System.out.println("login in PageContoller");
		return "login";
		
	}

	@RequestMapping(value="/mainPage", method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	 public String  showMainPage(Model model,HttpServletRequest request,HttpServletResponse response){		
		HttpSession session = request.getSession(); 
		if(session==null||session.getAttribute("usrid")==null)
        {
            System.out.println("session is null ");
            return "redirect:/login "; 
        }
        else
        {
        	System.out.println("usrid="+session.getAttribute("usrid"));
        	HashSet<String> hs = (HashSet<String>) session.getAttribute("usrid");
        	for(String ID :hs){
        		if(ID.equals(request.getParameter("ID"))){
        			model.addAttribute("userPo",ConnectionPool.getInstance().getUser(ID));
	        		return "mainPage";
        		}		
        	}
        	 System.out.println("can not find this user ");
	         return "redirect:/login "; 
        }    		
		
	}
	
	@RequestMapping(value="/email", method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	 public String  showEmail(Model model,HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession(); 
		if(session==null||session.getAttribute("usrid")==null)
        {
            System.out.println("session is null ");
            return "redirect:/login "; 
        }
        else
        {
        	System.out.println("usrid="+session.getAttribute("usrid"));
        	HashSet<String> hs = (HashSet<String>) session.getAttribute("usrid");
        	for(String ID :hs){
        		if(ID.equals(request.getParameter("ID"))){
        			model.addAttribute("userPo",ConnectionPool.getInstance().getUser(ID));
	        		return "email";
        		}		
        	}
        	 System.out.println("can not find this user ");
	         return "redirect:/login "; 
        }    		
	}
	
	
	@RequestMapping(value="/userProfile", method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	 public String  showUserProfile(Model model,HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession(); 
		if(session==null||session.getAttribute("usrid")==null)
        {
            System.out.println("session is null ");
            return "redirect:/login "; 
        }
        else
        {
        	System.out.println("usrid="+session.getAttribute("usrid"));
        	HashSet<String> hs = (HashSet<String>) session.getAttribute("usrid");
        	for(String ID :hs){
        		if(ID.equals(request.getParameter("ID"))){
        			model.addAttribute("userPo",ConnectionPool.getInstance().getUser(ID));
	        		return "userProfile";
        		}		
        	}
        	 System.out.println("can not find this user ");
	         return "redirect:/login "; 
        }    		
		
	}
	
	@RequestMapping(value="/sensor", method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	 public String  showSensr(Model model,HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession(); 
		if(session==null||session.getAttribute("usrid")==null)
       {
           System.out.println("session is null ");
           return "redirect:/login "; 
       }
       else
       {
       	System.out.println("usrid="+session.getAttribute("usrid"));
       	HashSet<String> hs = (HashSet<String>) session.getAttribute("usrid");
       	for(String ID :hs){
       		if(ID.equals(request.getParameter("ID"))){
       			model.addAttribute("userPo",ConnectionPool.getInstance().getUser(ID));
       			//getSensor
       			QuerySv qsv = new QuerySv();
       			Map sensors = qsv.getAllSensor();      			
       			JSONObject jsonObj = JSONObject.fromObject(sensors);
       			model.addAttribute("sensorPo",jsonObj);
	        	return "sensor";
       		}		
       	}
       	 System.out.println("can not find this user ");
	         return "redirect:/login "; 
       }    		
		
	}
	
	@RequestMapping(value="/prestress", method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	 public String  showPrestress(Model model,HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession(); 
		if(session==null||session.getAttribute("usrid")==null)
       {
           System.out.println("session is null ");
           return "redirect:/login "; 
       }
       else
       {
       	System.out.println("usrid="+session.getAttribute("usrid"));
       	HashSet<String> hs = (HashSet<String>) session.getAttribute("usrid");
       	for(String ID :hs){
       		if(ID.equals(request.getParameter("ID"))){
       			model.addAttribute("userPo",ConnectionPool.getInstance().getUser(ID));
	        		return "prestress";
       		}		
       	}
       	 System.out.println("can not find this user ");
	         return "redirect:/login "; 
       }    		
	}

}
