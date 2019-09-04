package kr.or.ddit.member.controller;

import java.util.Random;

/**
 * 인증키 생성
 * @author Administrator
 */
public class TempKey {
	private boolean lowerCheck;
	private int size;
	
	public String getKey(int size, boolean lowerCheck){
		this.size = size;
		this.lowerCheck = lowerCheck;
		
		return init();
	}

	private String init() {
		Random ran = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75)+48;
			 if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
				buffer.append((char)num);
			 }else{
				 continue;
			 }
		} while (buffer.length() < size);
		
		if (lowerCheck) {
			return buffer.toString().toLowerCase();
		}
		
		return buffer.toString();
	}
}
