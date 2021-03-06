package pkg_service;

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

public class RsaKey {
	
	 private static PrivateKey privateKey;
	 private static PublicKey publicKey;
	 
	//生成公私钥对  
	 public String[]  Generator() throws Exception {  	        
	         KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");        
	         keyPairGen.initialize(1024);        
	         KeyPair keyPair = keyPairGen.generateKeyPair();       
	         publicKey = (RSAPublicKey) keyPair.getPublic();     
	         privateKey = (RSAPrivateKey) keyPair.getPrivate();  
	         System.out.println("##############################");
		     System.out.println(privateKey);
	         
	         
	         //将公钥和模进行Base64编码  
	         KeyFactory keyFactory = KeyFactory.getInstance("RSA");     
	         RSAPublicKeySpec publicSpec= keyFactory.getKeySpec(publicKey,RSAPublicKeySpec.class);  
	         BigInteger modulus = publicSpec.getModulus();         //\d+
	         BigInteger exponent=publicSpec.getPublicExponent();   //65537
	         
	         byte[] ary_mod=modulus.toByteArray();//注意：对公钥和模进行Base64编码时，不是对BigInteger对应的字符串编码，而是对其内部 的字节数组进行编码  
	         byte[] ary_exp=exponent.toByteArray();  
	         String str_mod;  
	         String str_exp;  
	         if(ary_mod[0]==0 && ary_mod.length==129)//判断数组首元素是否为0，若是，则将其删除，保证模的位数是128  
	         {  
	              byte[] temp=new byte[ary_mod.length-1];  
	              for(int i=1;i<ary_mod.length;i++)  
	              {  
	                   temp[i-1]=ary_mod[i];  
	              }  
	              str_mod=(new BASE64Encoder()).encodeBuffer(temp);  
	         }  
	         else  
	         {  
	              str_mod=(new BASE64Encoder()).encodeBuffer(ary_mod);  
	         }  
	  
	        str_exp=(new BASE64Encoder()).encodeBuffer(ary_exp);
	        System.out.println(privateKey);
	        return new String[]{str_mod,str_exp};
	 }
	 
	 //解密
	 public String RSADecrypt(String encryptedString) throws Exception{
		 byte[] ary_en=(new BASE64Decoder()).decodeBuffer(encryptedString);
		 Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
		 System.out.println(privateKey);
         cipher.init(Cipher.DECRYPT_MODE, privateKey);     
         byte[] deBytes = cipher.doFinal(ary_en);     
         String unencrypted = new String(deBytes );  
		 return unencrypted;
	 }
}
