/**
* UserController用于登陆，初始化用户、session
*/


package pkg_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pkg_po.UserPO;
import pkg_service.ConnectionPool;

import java.math.BigInteger;     
import java.security.KeyFactory;     
import java.security.PrivateKey;    
import java.security.KeyPair;  
import java.security.KeyPairGenerator;  
import java.security.PublicKey;  
import java.security.interfaces.RSAPrivateKey;  
import java.security.interfaces.RSAPublicKey;       
import java.security.spec.RSAPublicKeySpec;     
import javax.crypto.Cipher;  
import sun.misc.*; 

@Controller
public class UserController extends BaseController{

	
	
	//C#登陆
	@RequestMapping(value="/login", method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	//public ModelAndView showResult(HttpServletRequest request,HttpServletResponse response, Object command, BindException errors)throws Exception {
	 public @ResponseBody Map showResult(HttpServletRequest request,HttpServletResponse response){
		String passWord=null;
		
		String JSESSIONID=request.getSession().getId();
		System.out.println(JSESSIONID);
		String ID = request.getParameter("ID");
		String PWD = request.getParameter("PWD")==null?null:request.getParameter("PWD").replace(" ", "+");   // post String to server, "+" will become a space    通过APP发送 		
		//解密
		try{
				passWord=rsakey.RSADecrypt(PWD);
				System.out.println("passWord="+passWord);
		}
		catch (Exception e){
				e.printStackTrace();
				logger.error(e);
		}
			

		//查询数据库
		List<Map> loginResult = dao.doLogin(ID);
		UserPO userPO =(UserPO)loginResult.get(0).get("data");
		if(!userPO.getEmployee_pwd().equals(PWD)){
			
		}
		
		String uid = JSESSIONID+System.currentTimeMillis()+"";
		ConnectionPool.getInstance().addUser(uid,userPO);
		response.addCookie(new Cookie("uid",uid));
		return loginResult.get(0);
		
	}
	
	//网页登陆 
	@RequestMapping(value="/index", method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	 public @ResponseBody Map  showIndex(Model model,HttpServletRequest request,HttpServletResponse response){
				
		String passWord=null;		
		String ID = request.getParameter("ID");
		String PWD2 = request.getParameter("PWD2");     //通过网页发送，，字段不同
		
		//query
		List<Map> loginResult = dao.doLogin(ID);
		
		Map<String,Object> result = new HashMap<>();

		//check
		if(result.get("errCode")=="1"){
			result.put("errCode", "1");
			return result;   //errCode=1；用户名不存在
		}
	
		UserPO userPO =(UserPO)loginResult.get(0).get("data");

		if(!userPO.getEmployee_pwd().equals(PWD2)){
			result.put("errCode", "2");
			return result;   //errCode=2；密码错误
		}
		result=loginResult.get(0);
		//set Session 
		ConnectionPool.getInstance().setSession(request, ID);
		
		//add user to pool
		ConnectionPool.getInstance().addUser(ID,userPO);

		//return view
		model.addAttribute("userPo",userPO);
		return result;
		
	}
	
	@RequestMapping(value="/getPublicKey", method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	public @ResponseBody String ProvidePublicKey() throws Exception{
		String[] re= rsakey.Generator();
		System.out.println("str_mod="+re[0]);
		System.out.println("str_exp="+re[1]);	
		System.out.println(re[0]+","+re[1]);	
		return re[0]+","+re[1];
	}
	
	
	//test RSA
	@RequestMapping(value="/test/*", method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	public @ResponseBody void testPublicKey() throws Exception{
		KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");        
        keyPairGen.initialize(1024);        
        KeyPair keyPair = keyPairGen.generateKeyPair();       
        PublicKey publicKey = (RSAPublicKey) keyPair.getPublic();     
        PrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();       
         
        //将公钥和模进行Base64编码  
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");     
        RSAPublicKeySpec publicSpec= keyFactory.getKeySpec(publicKey,RSAPublicKeySpec.class);  
        BigInteger modulus = publicSpec.getModulus();  
        BigInteger exponent=publicSpec.getPublicExponent();  
        byte[] ary_m=modulus.toByteArray();//注意：对公钥和模进行Base64编码时，不是对BigInteger对应的字符串编码，而是对其内部 的字节数组进行编码  
        byte[] ary_e=exponent.toByteArray();  
        String str_m;  
        String str_e;  
        if(ary_m[0]==0 && ary_m.length==129)//判断数组首元素是否为0，若是，则将其删除，保证模的位数是128  
        {  
             byte[] temp=new byte[ary_m.length-1];  
             for(int i=1;i<ary_m.length;i++)  
             {  
                  temp[i-1]=ary_m[i];  
             }  
             str_m=(new BASE64Encoder()).encodeBuffer(temp);  
        }  
        else  
        {  
             str_m=(new BASE64Encoder()).encodeBuffer(ary_m);  
        }  
 
       str_e=(new BASE64Encoder()).encodeBuffer(ary_e);  
       System.out.println("公钥为："+str_e);  
       System.out.println("模为："+str_m);  
       System.out.println("运行.NET程序，用所提供的公钥和模进行加密，然后将加密结果输入本程序进行解密：");  
       Scanner sc=new Scanner(System.in);  
       String str_en="";  
       String st="";  
       while(!(st=sc.nextLine()).equals(""))  
       {  
            str_en+=st;
       }  
       byte[] ary_en=(new BASE64Decoder()).decodeBuffer(str_en);  
        //解密  
         //注意Cipher初始化时的参数“RSA/ECB/PKCS1Padding”,代表和.NET用相同的填充算法，如果是标准RSA加密，则参数为“RSA”  
         Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");     
        cipher.init(Cipher.DECRYPT_MODE, privateKey);     
        byte[] deBytes = cipher.doFinal(ary_en);     
        String s = new String(deBytes );  
        System.out.println("解密结果为：" + s);  
	}
	
	
	
	public void UpdatePO(String ID,String PWD){
		List<Map> loginResult = dao.doLogin(ID);
		ConnectionPool.getInstance().addUser(ID,(UserPO)loginResult.get(0).get("data"));
	}
		
}
