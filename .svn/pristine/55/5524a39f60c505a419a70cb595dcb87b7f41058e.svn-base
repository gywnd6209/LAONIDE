package kr.or.ddit.utiles;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

public class CryptoGenerator {
   
   // 공개키(클라이언트에 제공 : 지수 and 가수부), 비밀키 생성
   // 비밀키(세션 저장) 생성
   public static Map<String,String> getGeneratePairKey(HttpSession session){
      // 공개키, 비밀키 생성
      KeyPairGenerator generator = null;
      // KeyPairGenerator 생성된 공개키,비밀키 저장
      KeyPair pair = null;
      // 공개키를 가수부,지수부 구분 생성
      KeyFactory factory = null;
      
      // KeyFactory를 통해 생성된 가수부,지수부 저장되 반환
      Map<String, String> publicKeyMap = new HashMap<String, String>();
      
      // 공개키
      PublicKey publicKey = null;
      // 비밀키
      PrivateKey privateKey = null;
      
      try {
         generator = KeyPairGenerator.getInstance("RSA");
         // 공개키 작성시의 사이즈 설정 : default 1kbyte
         generator.initialize(2048);
         
         // 공개키와 비밀키 생성
         pair = generator.generateKeyPair();
         
         // 공개키 취득
         publicKey = pair.getPublic();
         // 비밀키 취득
         privateKey = pair.getPrivate();
         session.setAttribute("privateKey", privateKey); //서버가 가지고있음
         
         factory = KeyFactory.getInstance("RSA");
         
         // 클라이언트에게 제공될 공개키를 Double 타입으로 작성
         // Double 타입을 가수부, 지수부 분리해서 publicKeyMap 저장
         // ex)) -1483.5435345345
         // float(32bit 단정도)  : 부호비트(양수|음수1 : 1bit) + 지수(소수점위치 8bit) + 가수(23bit)
         // double(64bit 배정도 ) : 부호비트(양수|음수1 : 1bit) + 지수(소수점위치 11bit) + 가수(52bit)
         RSAPublicKeySpec publicKeySpec= factory.getKeySpec(publicKey, RSAPublicKeySpec.class);
         // 공개키 가수 
         String publicKeyModulus =publicKeySpec.getModulus().toString(16);
         // 공개키 지수
         String publicKeyExponent = publicKeySpec.getPublicExponent().toString(16);
         
         publicKeyMap.put("publicKeyModulus", publicKeyModulus);
         publicKeyMap.put("publicKeyExponent", publicKeyExponent);
      } catch (NoSuchAlgorithmException e) {
         e.printStackTrace();
      } catch (InvalidKeySpecException e) {
         e.printStackTrace();
      }
      
      return publicKeyMap;
      
   }
   
   public static String decryptRSA(HttpSession session,String secureValue){
      PrivateKey privateKey =(PrivateKey) session.getAttribute("privateKey"); //세션 오브젝트 반환하므로 다운캐스팅~!~
      
      String returnValue ="";
      try {
         Cipher cipher = Cipher.getInstance("RSA");
         byte[] targetByte = hexToByteArray(secureValue);
         
         cipher.init(cipher.DECRYPT_MODE, privateKey);
         
         byte[] beforeStringBytes =cipher.doFinal(targetByte);
         
         returnValue = new String(beforeStringBytes,"UTF-8");
         
      } catch (NoSuchAlgorithmException e) {
         e.printStackTrace();
      } catch (NoSuchPaddingException e) {
         e.printStackTrace();
      } catch (InvalidKeyException e) {
         e.printStackTrace();
      } catch (IllegalBlockSizeException e) {
         e.printStackTrace();
      } catch (BadPaddingException e) {
         e.printStackTrace();
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      return returnValue;
      
   }

   private static byte[] hexToByteArray(String secureValue) {
      if(secureValue == null || secureValue.length()%2 != 0){
         return new byte[]{};
      }
      
      byte[] bytes = new byte[secureValue.length()/2];
      
      for(int i=0; i<secureValue.length(); i+=2){
         byte value =(byte) Integer.parseInt(secureValue.substring(i,i+2),16);
         bytes[(int)Math.floor(i/2)]= value;
      }
      return bytes;
   }

}