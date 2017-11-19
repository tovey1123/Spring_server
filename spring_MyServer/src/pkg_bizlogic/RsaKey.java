package pkg_bizlogic;

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
	 
	//���ɹ�˽Կ��  
	 public String[]  Generator() throws Exception {  	        
	         KeyPairGenerator keyPairGen = KeyPairGenerator.getInstance("RSA");        
	         keyPairGen.initialize(1024);        
	         KeyPair keyPair = keyPairGen.generateKeyPair();       
	         publicKey = (RSAPublicKey) keyPair.getPublic();     
	         privateKey = (RSAPrivateKey) keyPair.getPrivate();  
	         System.out.println("##############################");
		     System.out.println(privateKey);
	         
	         
	         //����Կ��ģ����Base64����  
	         KeyFactory keyFactory = KeyFactory.getInstance("RSA");     
	         RSAPublicKeySpec publicSpec= keyFactory.getKeySpec(publicKey,RSAPublicKeySpec.class);  
	         BigInteger modulus = publicSpec.getModulus();         //\d+
	         BigInteger exponent=publicSpec.getPublicExponent();   //65537
	         
	         byte[] ary_mod=modulus.toByteArray();//ע�⣺�Թ�Կ��ģ����Base64����ʱ�����Ƕ�BigInteger��Ӧ���ַ������룬���Ƕ����ڲ� ���ֽ�������б���  
	         byte[] ary_exp=exponent.toByteArray();  
	         String str_mod;  
	         String str_exp;  
	         if(ary_mod[0]==0 && ary_mod.length==129)//�ж�������Ԫ���Ƿ�Ϊ0�����ǣ�����ɾ������֤ģ��λ����128  
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
	 
	 //����
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