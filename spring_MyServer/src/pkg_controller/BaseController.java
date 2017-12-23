/**
* BaseController 其他controller的基类，初始化公用的dao，logger,RSA等
*/


package pkg_controller;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;

import pkg_dao.UserDao;
import pkg_service.RsaKey;

@Controller
public class BaseController {
	public static final Log logger = LogFactory.getLog(UserController.class);
	public static String viewpage;
	public static UserDao dao;
	public static RsaKey rsakey;
	public void setDao(UserDao dao) {
		this.dao = dao;
	}
	public void setRsakey(RsaKey rsakey){
		this.rsakey = rsakey;
	}
}
