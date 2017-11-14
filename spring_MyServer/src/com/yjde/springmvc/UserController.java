package com.yjde.springmvc;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.validation.BindException;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yjde.springmvc.UserPO;


@Controller
public class UserController {

	private static final Log logger = LogFactory.getLog(UserController.class);
	private String viewpage;
	private UserDao dao;
	public void setDao(UserDao dao) {
		this.dao = dao;
	}
	public String getViewpage() {
		return viewpage;
	}

	public void setViewpage(String viewpage) {
		this.viewpage = viewpage;
	}
	
	@RequestMapping(value="/query")	
	//public ModelAndView showResult(HttpServletRequest request,HttpServletResponse response, Object command, BindException errors)throws Exception {
	 public @ResponseBody Map showResult(Model model,HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");	
		
		Collection<UserPO> list = dao.doquery();
		List<UserPO> users = new ArrayList<UserPO>();
		UserPO user;
		for (UserPO userPO : list) {
			user = new UserPO();
			user.setUserId(userPO.getUserId());
			user.setUserName(userPO.getUserName());
			user.setUserAge(userPO.getUserAge());
			users.add(user);
		}

		Map mp = new HashMap();
		mp.put("list", users);
		//return new ModelAndView(getViewpage(), mp);
		//return new ModelAndView("userInfo", mp);
		model.addAttribute("mp",mp);
		//return getViewpage();
		return mp;
	}


}
