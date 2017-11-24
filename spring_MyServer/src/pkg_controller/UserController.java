package pkg_controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.validation.BindException;
import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pkg_po.UserPO;
import pkg_dao.UserDao;
import pkg_bizlogic.RsaKey;
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
public class UserController {

	private static final Log logger = LogFactory.getLog(UserController.class);
	private String viewpage;
	private UserDao dao;
	private RsaKey rsakey;
	public void setDao(UserDao dao) {
		this.dao = dao;
	}
	public String getViewpage() {
		return viewpage;
	}

	public void setViewpage(String viewpage) {
		this.viewpage = viewpage;
	}
	
	public void setRsakey(RsaKey rsakey){
		this.rsakey = rsakey;
	}
	@RequestMapping(value="/login", method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	//public ModelAndView showResult(HttpServletRequest request,HttpServletResponse response, Object command, BindException errors)throws Exception {
	 public @ResponseBody Map showResult(Model model,HttpServletRequest request,HttpServletResponse response){
		String passWord=null;
		
		System.out.println(request);
		String ID = request.getParameter("ID");
		String PWD = request.getParameter("PWD")==null?null:request.getParameter("PWD").replace(" ", "+");   // post String to server, "+" will become a space    ͨ��APP���� 		
		//����
		try{
				passWord=rsakey.RSADecrypt(PWD);
				System.out.println("passWord="+passWord);
		}
		catch (Exception e){
				e.printStackTrace();
				logger.error(e);
		}
		
	
		
		

		//��ѯ���ݿ�
		List<Map> loginResult = dao.doLogin(ID,passWord);
		return loginResult.get(0);
		
//		List<UserPO> users = new ArrayList<UserPO>();
//		UserPO user;
//		for (UserPO userPO : list) {
//			user = new UserPO();
//			user.setEmployeeId(userPO.getEmployeeId());
//			user.setEmployeeName(userPO.getEmployeeName());			
//			user.setEmployeePWD(userPO.getEmployeePWD());
//			user.setGender(userPO.getGender());
//			user.setPhone(userPO.getPhone());
//			user.setBirthday(userPO.getBirthday());
//			user.setDepartment(userPO.getDepartment());
//			user.setEmail(userPO.getEmail());
//			user.setAddress(userPO.getAddress());
//			user.setLever(userPO.getLever());
//			users.add(user);
//		}

//		Map mp = new HashMap();
//		mp.put("list", list);
		//return new ModelAndView(getViewpage(), mp);
		//model.addAttribute("mp",mp);
		//return getViewpage();
	}
	
	@RequestMapping(value="/index", method=RequestMethod.POST,produces="text/html;charset=UTF-8")	
	//public ModelAndView showResult(HttpServletRequest request,HttpServletResponse response, Object command, BindException errors)throws Exception {
	 public String  showIndex(Model model,HttpServletRequest request,HttpServletResponse response){
		String passWord=null;
		
		System.out.println(request);
		String ID = request.getParameter("ID");
		String PWD2 = request.getParameter("PWD2");     //ͨ����ҳ����
		//��ѯ���ݿ�
		List<Map> loginResult = dao.doLogin(ID,PWD2);
		Map mp = loginResult.get(0);
		model.addAttribute("mp",mp);
		return "mainPage2";
		
	}
	
	@RequestMapping(value="/getPublicKey", method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	public @ResponseBody String ProvidePublicKey() throws Exception{
		String[] re= rsakey.Generator();
		System.out.println("str_mod="+re[0]);
		System.out.println("str_exp="+re[1]);	
		System.out.println(re[0]+","+re[1]);	
		return re[0]+","+re[1];
	}
	
	@RequestMapping(value="/test/*", method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	public @ResponseBody void testPublicKey() throws Exception{
		KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");        
        keyPairGen.initialize(1024);        
        KeyPair keyPair = keyPairGen.generateKeyPair();       
        PublicKey publicKey = (RSAPublicKey) keyPair.getPublic();     
        PrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();       
         
        //����Կ��ģ����Base64����  
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");     
        RSAPublicKeySpec publicSpec= keyFactory.getKeySpec(publicKey,RSAPublicKeySpec.class);  
        BigInteger modulus = publicSpec.getModulus();  
        BigInteger exponent=publicSpec.getPublicExponent();  
        byte[] ary_m=modulus.toByteArray();//ע�⣺�Թ�Կ��ģ����Base64����ʱ�����Ƕ�BigInteger��Ӧ���ַ������룬���Ƕ����ڲ� ���ֽ�������б���  
        byte[] ary_e=exponent.toByteArray();  
        String str_m;  
        String str_e;  
        if(ary_m[0]==0 && ary_m.length==129)//�ж�������Ԫ���Ƿ�Ϊ0�����ǣ�����ɾ������֤ģ��λ����128  
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
       System.out.println("��ԿΪ��"+str_e);  
       System.out.println("ģΪ��"+str_m);  
       System.out.println("����.NET���������ṩ�Ĺ�Կ��ģ���м��ܣ�Ȼ�󽫼��ܽ�����뱾������н��ܣ�");  
       Scanner sc=new Scanner(System.in);  
       String str_en="";  
       String st="";  
       while(!(st=sc.nextLine()).equals(""))  
       {  
            str_en+=st;  
       }  
       byte[] ary_en=(new BASE64Decoder()).decodeBuffer(str_en);  
        //����  
         //ע��Cipher��ʼ��ʱ�Ĳ�����RSA/ECB/PKCS1Padding��,�����.NET����ͬ������㷨������Ǳ�׼RSA���ܣ������Ϊ��RSA��  
         Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");     
        cipher.init(Cipher.DECRYPT_MODE, privateKey);     
        byte[] deBytes = cipher.doFinal(ary_en);     
        String s = new String(deBytes );  
        System.out.println("���ܽ��Ϊ��" + s);  
	}
	
	

}
